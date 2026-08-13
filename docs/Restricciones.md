---
tags:
  - moc
  - restricciones
titulo: "Catálogo de restricciones — Pasanaku Digital"
motor: PostgreSQL 15+
total_restricciones: 75
fecha: 2026-08-11
---

# Catálogo de restricciones

> [!abstract] Qué es este documento
> El conjunto de **reglas que la base de datos hace cumplir por sí misma**, con su
> DDL listo para aplicar, el requisito normativo que las obliga y el caso de uso
> donde se verifican. Si una regla de negocio con dinero o con cumplimiento solo
> vive en el código de la aplicación, **no está garantizada**: está esperando el
> día que alguien corra un script, use otro cliente o despliegue un bug.

## Principios

1. **La base de datos es la última línea, no la única.** La aplicación valida para
   dar buenos mensajes; la base impide.
2. **Denegar por omisión.** Si falta un límite, una licencia o una política, la
   operación se rechaza. Nunca se permite "porque no había regla".
3. **Nada se edita.** El dinero, la auditoría y los reportes se corrigen con el
   movimiento inverso, nunca con `UPDATE`.
4. **Los plazos se guardan.** Toda fecha límite legal se calcula al inicio y se
   persiste; jamás se recalcula al consultar.
5. **Las cifras regulatorias son datos con vigencia**, no constantes ni `CHECK`
   con números adentro. Un umbral que cambia no puede requerir una migración.

## Nomenclatura

```
ck_<tabla>_<regla>     CHECK
uq_<tabla>_<columnas>  UNIQUE
ex_<tabla>_<regla>     EXCLUDE
fk_<tabla>_<destino>   FOREIGN KEY
ix_<tabla>_<columnas>  índice (parcial cuando aplica)
tg_<tabla>_<regla>     trigger
fn_<dominio>_<accion>  función
```

## Familias

| Prefijo | Dominio | Cantidad |
| --- | --- | --: |
| `R-AUD` | Auditoría, inmutabilidad y conservación | 8 |
| `R-BIL` | Billetera, saldo y custodia | 15 |
| `R-LIM` | Límites operativos | 3 |
| `R-TAR` | Tarifas, comisiones y facturación | 13 |
| `R-UIF` | Prevención de LGI/FT y reportes | 13 |
| `R-CON` | Consumidor financiero | 8 |
| `R-SEG` | Seguridad y datos personales | 6 |
| `R-LIC` | Licencia y gobierno | 3 |
| `R-GRP` | Circuito del pasanaku | 4 |
| `R-RIS` | Riesgo operativo y continuidad | 3 |

---

## R-AUD — Auditoría, inmutabilidad y conservación

| Código | Regla | Obliga | Se verifica en |
| --- | --- | --- | --- |
| R-AUD-01 | Las tablas de dinero y auditoría no admiten `UPDATE` ni `DELETE` | Ley 393 · ISO 27001 A.5.33 | [[CU-14 Reversar una transacción]] |
| R-AUD-02 | La bitácora está encadenada por hash | ASFI Seguridad de la Información | [[CU-04 Autenticar con MFA y registrar dispositivo]] |
| R-AUD-03 | Las transacciones de billetera están encadenadas por hash | ASFI · ISO 27001 | [[CU-10 Recargar saldo]] |
| R-AUD-04 | Todo cambio relevante emite evento de dominio en la misma transacción | Trazabilidad | todos |
| R-AUD-05 | Todo asiento contable cuadra: `SUM(debe) = SUM(haber)` | Contabilidad | [[CU-24 Registrar el asiento contable de una operación]] |
| R-AUD-06 | Un asiento confirmado solo se corrige por reversa | Contabilidad | [[CU-24 Registrar el asiento contable de una operación]] |
| R-AUD-07 | Los saldos diarios se cierran encadenados y son únicos por cuenta y fecha | Prueba de saldo histórico | [[CU-51 Ejecutar el cierre diario]] |
| R-AUD-08 | Nada se depura antes de su fecha de conservación | Ley 393 (10 años) | [[CU-07 Ejercer derechos sobre datos personales]] |

```sql
-- R-AUD-01 · append-only por privilegios, no por convención
REVOKE UPDATE, DELETE ON
    transaccion_billetera, movimiento_billetera, movimiento_custodia,
    saldo_diario_billetera, devengo_comision, asiento_contable,
    movimiento_contable, bitacora_evento, evento_dominio,
    registro_acceso_datos, movimiento_fondo, abono_recuperacion,
    registro_operacion_relevante, evento_riesgo_operativo, acta_comite
FROM rol_aplicacion;

-- Refuerzo: incluso un superusuario distraído choca con el trigger
CREATE OR REPLACE FUNCTION fn_aud_bloquear_mutacion() RETURNS trigger AS $$
BEGIN
  RAISE EXCEPTION 'R-AUD-01: % es append-only; corrija con el movimiento inverso',
        TG_TABLE_NAME;
END $$ LANGUAGE plpgsql;

-- El disparador se crea para CADA tabla de la lista. No se escribe a mano:
-- `scripts/generar_ddl.py` lo emite en sql/35_append_only/append_only.sql a
-- partir de la lista APPEND_ONLY del modelo, de modo que agregar una tabla a
-- esa lista alcanza para que quede sellada.

-- R-AUD-02 / R-AUD-03 · cadena de hash verificable
CREATE OR REPLACE FUNCTION fn_aud_encadenar_transaccion() RETURNS trigger AS $$
DECLARE v_anterior VARCHAR(64);
BEGIN
  SELECT hash_registro INTO v_anterior
    FROM transaccion_billetera ORDER BY secuencia DESC LIMIT 1;
  NEW.hash_anterior := v_anterior;
  NEW.hash_registro := encode(digest(
      COALESCE(NEW.secuencia::text,'') || NEW.tipo || NEW.monto_total::text ||
      COALESCE(NEW.origen_tipo,'') || COALESCE(NEW.origen_id::text,'') ||
      NEW.ocurrida_en::text || COALESCE(v_anterior,''), 'sha256'), 'hex');
  RETURN NEW;
END $$ LANGUAGE plpgsql;

CREATE TRIGGER tg_transaccion_billetera_hash
  BEFORE INSERT ON transaccion_billetera
  FOR EACH ROW EXECUTE FUNCTION fn_aud_encadenar_transaccion();

-- R-AUD-05 · invariante de partida doble contable
CREATE OR REPLACE FUNCTION fn_aud_asiento_cuadrado() RETURNS trigger AS $$
DECLARE v_debe NUMERIC(16,2); v_haber NUMERIC(16,2);
BEGIN
  SELECT COALESCE(SUM(debe),0), COALESCE(SUM(haber),0)
    INTO v_debe, v_haber
    FROM movimiento_contable WHERE asiento_id = NEW.id;
  IF v_debe <> v_haber THEN
    RAISE EXCEPTION 'R-AUD-05: asiento % descuadrado (debe=%, haber=%)',
                    NEW.id, v_debe, v_haber;
  END IF;
  RETURN NEW;
END $$ LANGUAGE plpgsql;

CREATE CONSTRAINT TRIGGER tg_asiento_cuadrado
  AFTER INSERT OR UPDATE ON asiento_contable
  DEFERRABLE INITIALLY DEFERRED
  FOR EACH ROW WHEN (NEW.estado = 'CONFIRMADO')
  EXECUTE FUNCTION fn_aud_asiento_cuadrado();

-- R-AUD-06 · la reversa apunta a un asiento distinto y confirmado
ALTER TABLE asiento_contable
  ADD CONSTRAINT ck_asiento_reversa_distinta
  CHECK (asiento_reversa_id IS NULL OR asiento_reversa_id <> id);

-- R-AUD-07 · un cierre de saldo por cuenta y día
ALTER TABLE saldo_diario_billetera
  ADD CONSTRAINT uq_saldo_diario_cuenta_fecha UNIQUE (cuenta_billetera_id, fecha);

-- R-AUD-08 · no se depura antes de tiempo
ALTER TABLE expediente_cliente
  ADD CONSTRAINT ck_expediente_retencion_futura
  CHECK (retencion_hasta >= ultima_actualizacion::date);
```

---

## R-BIL — Billetera, saldo y custodia

| Código | Regla | Obliga | Se verifica en |
| --- | --- | --- | --- |
| R-BIL-01 | Toda transacción cuadra: `SUM(débitos) = SUM(créditos)` | Integridad del dinero | [[CU-10 Recargar saldo]] |
| R-BIL-02 | El saldo disponible nunca es negativo | No dar crédito sin licencia | [[CU-11 Retirar saldo]] |
| R-BIL-03 | `saldo_total = saldo_disponible + saldo_retenido` | Consistencia | [[CU-13 Retener y liberar saldo]] |
| R-BIL-04 | Una cuenta por titular, moneda y tipo | Unicidad de titularidad | [[CU-01 Registro y apertura de billetera]] |
| R-BIL-05 | La titularidad es coherente con el tipo de cuenta | Separación patrimonial | [[CU-20 Crear grupo y congelar tarifario]] |
| R-BIL-06 | Idempotencia de toda operación con dinero | Evitar doble acreditación | [[CU-10 Recargar saldo]] |
| R-BIL-07 | `saldo_retenido` = suma de retenciones vigentes | Consistencia | [[CU-13 Retener y liberar saldo]] |
| R-BIL-08 | Toda retención expira, salvo orden de autoridad | Nada queda congelado sin fin | [[CU-13 Retener y liberar saldo]] |
| R-BIL-09 | El retiro exige MFA e instrumento verificado del titular | Antifraude · UIF | [[CU-11 Retirar saldo]] |
| R-BIL-10 | La referencia externa de recarga es única | Evitar doble acreditación | [[CU-10 Recargar saldo]] |
| R-BIL-11 | El encaje se verifica a diario y debe ser ≥ 1 | Respaldo de fondos | [[CU-50 Conciliar la custodia y verificar el encaje]] |
| R-BIL-12 | No se cierra el día con descuadre o excepciones abiertas | Contabilidad · ASFI | [[CU-51 Ejecutar el cierre diario]] |
| R-BIL-13 | No se cierra una cuenta con obligaciones, retenciones o bloqueos | Consumidor financiero | [[CU-16 Cerrar billetera y devolver saldo]] |
| R-BIL-14 | Un oficio, un bloqueo | Trazabilidad legal | [[CU-17 Bloquear saldo por orden de autoridad]] |
| R-BIL-15 | Una transacción se reversa una sola vez | Integridad | [[CU-14 Reversar una transacción]] |

```sql
-- R-BIL-01 · partida doble interna (diferido: se valida al COMMIT)
CREATE OR REPLACE FUNCTION fn_bil_transaccion_cuadrada() RETURNS trigger AS $$
DECLARE v_debitos NUMERIC(16,2); v_creditos NUMERIC(16,2);
BEGIN
  SELECT COALESCE(SUM(monto) FILTER (WHERE sentido='DEBITO'),0),
         COALESCE(SUM(monto) FILTER (WHERE sentido='CREDITO'),0)
    INTO v_debitos, v_creditos
    FROM movimiento_billetera WHERE transaccion_id = NEW.id;
  IF v_debitos <> v_creditos THEN
    RAISE EXCEPTION 'R-BIL-01: transacción % descuadrada (D=%, C=%)',
                    NEW.id, v_debitos, v_creditos;
  END IF;
  IF v_debitos = 0 THEN
    RAISE EXCEPTION 'R-BIL-01: transacción % sin movimientos', NEW.id;
  END IF;
  RETURN NEW;
END $$ LANGUAGE plpgsql;

CREATE CONSTRAINT TRIGGER tg_transaccion_cuadrada
  AFTER INSERT OR UPDATE ON transaccion_billetera
  DEFERRABLE INITIALLY DEFERRED
  FOR EACH ROW WHEN (NEW.estado = 'APLICADA')
  EXECUTE FUNCTION fn_bil_transaccion_cuadrada();

-- R-BIL-02 y R-BIL-03 · saldos coherentes y no negativos
ALTER TABLE cuenta_billetera
  ADD CONSTRAINT ck_cuenta_saldo_no_negativo
    CHECK (permite_saldo_negativo OR saldo_disponible >= 0),
  ADD CONSTRAINT ck_cuenta_retenido_no_negativo
    CHECK (saldo_retenido >= 0);
-- saldo_total es GENERATED ALWAYS AS (saldo_disponible + saldo_retenido) STORED

-- R-BIL-04 · unicidad por tipo de titular
CREATE UNIQUE INDEX uq_cuenta_usuario_moneda
  ON cuenta_billetera (usuario_id, moneda, tipo)
  WHERE tipo = 'USUARIO' AND estado <> 'CERRADA';
CREATE UNIQUE INDEX uq_cuenta_grupo_moneda
  ON cuenta_billetera (grupo_id, moneda)
  WHERE tipo = 'GRUPO' AND estado <> 'CERRADA';

-- R-BIL-05 · titularidad coherente con el tipo
ALTER TABLE cuenta_billetera
  ADD CONSTRAINT ck_cuenta_titularidad CHECK (
      (tipo = 'USUARIO' AND usuario_id IS NOT NULL AND grupo_id IS NULL)
   OR (tipo = 'GRUPO'   AND grupo_id  IS NOT NULL AND usuario_id IS NULL)
   OR (tipo NOT IN ('USUARIO','GRUPO') AND usuario_id IS NULL AND grupo_id IS NULL)
  );

-- R-BIL-06 · idempotencia extremo a extremo
ALTER TABLE transaccion_billetera ADD CONSTRAINT uq_tx_idem UNIQUE (clave_idempotencia);
ALTER TABLE orden_recarga        ADD CONSTRAINT uq_recarga_idem UNIQUE (clave_idempotencia);
ALTER TABLE orden_retiro         ADD CONSTRAINT uq_retiro_idem  UNIQUE (clave_idempotencia);
ALTER TABLE devengo_comision     ADD CONSTRAINT uq_devengo_idem UNIQUE (clave_idempotencia);

-- R-BIL-07 · el retenido es exactamente la suma de retenciones vigentes
CREATE OR REPLACE FUNCTION fn_bil_sincronizar_retenido() RETURNS trigger AS $$
DECLARE v_cuenta UUID; v_suma NUMERIC(16,2);
BEGIN
  v_cuenta := COALESCE(NEW.cuenta_billetera_id, OLD.cuenta_billetera_id);
  SELECT COALESCE(SUM(monto),0) INTO v_suma
    FROM retencion_saldo
    WHERE cuenta_billetera_id = v_cuenta AND estado = 'VIGENTE';
  UPDATE cuenta_billetera SET saldo_retenido = v_suma WHERE id = v_cuenta;
  RETURN NULL;
END $$ LANGUAGE plpgsql;

CREATE TRIGGER tg_retencion_sincroniza_saldo
  AFTER INSERT OR UPDATE OF estado, monto ON retencion_saldo
  FOR EACH ROW EXECUTE FUNCTION fn_bil_sincronizar_retenido();

-- R-BIL-08 · toda retención expira salvo orden de autoridad
ALTER TABLE retencion_saldo
  ADD CONSTRAINT ck_retencion_expira CHECK (
      motivo = 'ORDEN_AUTORIDAD' OR expira_en IS NOT NULL
  );

-- R-BIL-09 · condiciones duras del retiro
ALTER TABLE orden_retiro
  ADD CONSTRAINT ck_retiro_mfa CHECK (
      estado IN ('BORRADOR','RECHAZADA') OR mfa_verificado = TRUE
  );

CREATE OR REPLACE FUNCTION fn_bil_validar_instrumento_retiro() RETURNS trigger AS $$
DECLARE v_ok BOOLEAN;
BEGIN
  SELECT (estado_verificacion = 'VERIFICADO'
          AND titular_coincide
          AND (bloqueado_hasta IS NULL OR bloqueado_hasta < now()))
    INTO v_ok FROM instrumento_fondeo WHERE id = NEW.instrumento_destino_id;
  IF NOT COALESCE(v_ok,FALSE) THEN
    RAISE EXCEPTION 'R-BIL-09: instrumento destino no habilitado para retiro';
  END IF;
  RETURN NEW;
END $$ LANGUAGE plpgsql;

CREATE TRIGGER tg_retiro_instrumento
  BEFORE INSERT ON orden_retiro
  FOR EACH ROW EXECUTE FUNCTION fn_bil_validar_instrumento_retiro();

-- R-BIL-10 · una referencia externa, una acreditación
ALTER TABLE orden_recarga
  ADD CONSTRAINT uq_recarga_referencia UNIQUE (referencia_externa);

-- R-BIL-11 · encaje mínimo y unicidad diaria de la conciliación
ALTER TABLE conciliacion_custodia
  ADD CONSTRAINT uq_conciliacion_cuenta_fecha UNIQUE (cuenta_custodia_id, fecha),
  ADD CONSTRAINT ck_conciliacion_encaje
    CHECK (cumple_encaje = (ratio_cobertura >= 1.0));

-- R-BIL-12 · no se cierra el día con problemas abiertos
CREATE OR REPLACE FUNCTION fn_bil_validar_cierre_diario() RETURNS trigger AS $$
DECLARE v_excepciones INT; v_descuadres INT;
BEGIN
  SELECT count(*) INTO v_excepciones
    FROM excepcion_conciliacion e
    JOIN conciliacion c ON c.id = e.conciliacion_id
   WHERE e.estado <> 'RESUELTA' AND c.fecha_conciliacion::date = NEW.fecha;
  SELECT count(*) INTO v_descuadres
    FROM conciliacion_custodia WHERE fecha = NEW.fecha AND estado = 'DESCUADRADA';
  IF NEW.cuadrado AND (v_excepciones > 0 OR v_descuadres > 0) THEN
    RAISE EXCEPTION 'R-BIL-12: no se puede cuadrar el % (excepciones=%, descuadres=%)',
                    NEW.fecha, v_excepciones, v_descuadres;
  END IF;
  RETURN NEW;
END $$ LANGUAGE plpgsql;

CREATE TRIGGER tg_cierre_diario_valido
  BEFORE INSERT OR UPDATE ON cierre_diario
  FOR EACH ROW EXECUTE FUNCTION fn_bil_validar_cierre_diario();

-- R-BIL-13 · condiciones para cerrar una billetera
CREATE OR REPLACE FUNCTION fn_bil_validar_cierre_cuenta() RETURNS trigger AS $$
DECLARE v_bloqueos INT; v_retenciones INT; v_saldo NUMERIC(16,2);
BEGIN
  IF NEW.estado <> 'CERRADA' THEN RETURN NEW; END IF;
  SELECT count(*) INTO v_bloqueos FROM bloqueo_saldo
    WHERE cuenta_billetera_id = NEW.id AND estado = 'VIGENTE';
  SELECT count(*) INTO v_retenciones FROM retencion_saldo
    WHERE cuenta_billetera_id = NEW.id AND estado = 'VIGENTE';
  v_saldo := NEW.saldo_disponible + NEW.saldo_retenido;
  IF v_bloqueos > 0 OR v_retenciones > 0 OR v_saldo <> 0 THEN
    RAISE EXCEPTION 'R-BIL-13: cuenta % no cerrable (bloqueos=%, retenciones=%, saldo=%)',
                    NEW.id, v_bloqueos, v_retenciones, v_saldo;
  END IF;
  RETURN NEW;
END $$ LANGUAGE plpgsql;

CREATE TRIGGER tg_cuenta_cierre_valido
  BEFORE UPDATE OF estado ON cuenta_billetera
  FOR EACH ROW EXECUTE FUNCTION fn_bil_validar_cierre_cuenta();

-- R-BIL-14 · un oficio, un bloqueo
ALTER TABLE bloqueo_saldo
  ADD CONSTRAINT uq_bloqueo_oficio UNIQUE (numero_oficio);

-- R-BIL-15 · una transacción se reversa una sola vez
CREATE UNIQUE INDEX uq_reverso_original
  ON reverso_transaccion (transaccion_original_id)
  WHERE estado <> 'RECHAZADO';
```

---

## R-LIM — Límites operativos

| Código | Regla | Obliga | Se verifica en |
| --- | --- | --- | --- |
| R-LIM-01 | Ninguna operación se aplica sin evaluar límites; sin límite configurado se deniega | Límites BCB · UIF | [[CU-40 Evaluar límites antes de una operación]] |
| R-LIM-02 | Un consumo por cuenta, límite y ventana | Consistencia | [[CU-40 Evaluar límites antes de una operación]] |
| R-LIM-03 | Los límites se versionan por vigencia y no se borran | Reproducibilidad | [[CU-40 Evaluar límites antes de una operación]] |

```sql
-- R-LIM-01 · denegar por omisión
CREATE OR REPLACE FUNCTION fn_lim_evaluar(
    p_cuenta UUID, p_concepto TEXT, p_monto NUMERIC) RETURNS VOID AS $$
DECLARE v_nivel TEXT; v_lim RECORD; v_acumulado NUMERIC; v_hay BOOLEAN := FALSE;
BEGIN
  SELECT nivel_debida_diligencia INTO v_nivel
    FROM cuenta_billetera WHERE id = p_cuenta;

  FOR v_lim IN
      SELECT * FROM limite_operativo_billetera
       WHERE concepto = p_concepto AND nivel_debida_diligencia = v_nivel
         AND activo AND vigente_desde <= current_date
         AND (vigente_hasta IS NULL OR vigente_hasta >= current_date)
  LOOP
    v_hay := TRUE;
    SELECT COALESCE(monto_acumulado,0) INTO v_acumulado
      FROM consumo_limite
     WHERE cuenta_billetera_id = p_cuenta AND limite_id = v_lim.id
       AND now() BETWEEN ventana_inicio AND ventana_fin;
    IF v_lim.monto_maximo IS NOT NULL
       AND v_acumulado + p_monto > v_lim.monto_maximo THEN
      RAISE EXCEPTION 'R-LIM-01: límite % (%) superado: disponible %',
        v_lim.concepto, v_lim.ventana, v_lim.monto_maximo - v_acumulado;
    END IF;
  END LOOP;

  IF NOT v_hay THEN
    RAISE EXCEPTION 'R-LIM-01: no hay límite configurado para % en nivel %; se deniega por omisión',
                    p_concepto, v_nivel;
  END IF;
END $$ LANGUAGE plpgsql;

-- R-LIM-02 · un consumo por ventana
ALTER TABLE consumo_limite
  ADD CONSTRAINT uq_consumo_ventana
  UNIQUE (cuenta_billetera_id, limite_id, ventana_inicio);

-- R-LIM-03 · vigencias sin solape por concepto, nivel y ventana
ALTER TABLE limite_operativo_billetera
  ADD CONSTRAINT ex_limite_vigencia
  EXCLUDE USING gist (
    concepto WITH =, nivel_debida_diligencia WITH =, ventana WITH =,
    daterange(vigente_desde, vigente_hasta, '[]') WITH &&
  ) WHERE (activo);
```

---

## R-TAR — Tarifas, comisiones y facturación

| Código | Regla | Obliga | Se verifica en |
| --- | --- | --- | --- |
| R-TAR-01 | Un solo tarifario vigente por código y rango de fechas | Transparencia ASFI | [[CU-34 Publicar un tarifario nuevo con preaviso]] |
| R-TAR-02 | Un tarifario vigente es inmutable | Reproducibilidad | [[CU-34 Publicar un tarifario nuevo con preaviso]] |
| R-TAR-03 | Coherencia entre método de cálculo y valores | Correctitud | [[CU-30 Cotizar la comisión antes de operar]] |
| R-TAR-04 | Un devengo por hecho y concepto | Evitar doble cobro | [[CU-31 Devengar y cobrar la comisión]] |
| R-TAR-05 | Idempotencia del devengo | Evitar doble cobro | [[CU-31 Devengar y cobrar la comisión]] |
| R-TAR-06 | Una deducción de entrega respalda un solo cargo | Trazabilidad | [[CU-22 Liquidar y entregar el fondo]] |
| R-TAR-07 | Un grupo tiene una sola tarifa congelada | Precio pactado | [[CU-20 Crear grupo y congelar tarifario]] |
| R-TAR-08 | Un incremento no entra en vigencia sin preaviso cumplido | ASFI Consumidor Financiero | [[CU-34 Publicar un tarifario nuevo con preaviso]] |
| R-TAR-09 | CUF y numeración de factura únicos | SIN | [[CU-32 Emitir factura electrónica]] |
| R-TAR-10 | Una factura validada no se modifica | SIN | [[CU-32 Emitir factura electrónica]] |
| R-TAR-11 | No se devuelve más de lo cobrado | Contabilidad | [[CU-33 Devolver comisión y emitir nota de crédito]] |
| R-TAR-12 | El precio publicado incluye impuestos cuando corresponde | ASFI transparencia | [[CU-30 Cotizar la comisión antes de operar]] |
| R-TAR-13 | Toda factura offline tiene evento significativo con plazo | SIN | [[CU-32 Emitir factura electrónica]] |

```sql
-- R-TAR-01 · un solo tarifario vigente por código y rango
ALTER TABLE tarifario
  ADD CONSTRAINT ex_tarifario_vigente
  EXCLUDE USING gist (
    codigo WITH =,
    tstzrange(vigente_desde, vigente_hasta, '[)') WITH &&
  ) WHERE (estado = 'VIGENTE');

-- R-TAR-02 · inmutabilidad del tarifario vigente y sus conceptos
CREATE OR REPLACE FUNCTION fn_tar_tarifario_inmutable() RETURNS trigger AS $$
DECLARE v_estado TEXT;
BEGIN
  SELECT estado INTO v_estado FROM tarifario
   WHERE id = COALESCE(NEW.tarifario_id, OLD.tarifario_id);
  IF v_estado IN ('VIGENTE','SUSTITUIDO') THEN
    RAISE EXCEPTION 'R-TAR-02: el tarifario % es inmutable; cree una versión nueva', v_estado;
  END IF;
  RETURN COALESCE(NEW, OLD);
END $$ LANGUAGE plpgsql;

CREATE TRIGGER tg_concepto_tarifa_inmutable
  BEFORE UPDATE OR DELETE ON concepto_tarifa
  FOR EACH ROW EXECUTE FUNCTION fn_tar_tarifario_inmutable();

-- R-TAR-03 · coherencia del método de cálculo
ALTER TABLE concepto_tarifa
  ADD CONSTRAINT ck_concepto_metodo CHECK (
      (metodo_calculo = 'GRATUITO')
   OR (metodo_calculo = 'FIJO'        AND valor_fijo IS NOT NULL)
   OR (metodo_calculo = 'PORCENTUAL'  AND valor_porcentual IS NOT NULL)
   OR (metodo_calculo = 'MIXTO'       AND valor_fijo IS NOT NULL
                                      AND valor_porcentual IS NOT NULL)
   OR (metodo_calculo LIKE 'ESCALONADO%')
  ),
  ADD CONSTRAINT ck_concepto_piso_techo CHECK (
      monto_minimo IS NULL OR monto_maximo IS NULL OR monto_minimo <= monto_maximo
  );

-- R-TAR-04 y R-TAR-05 · un devengo por hecho
ALTER TABLE devengo_comision
  ADD CONSTRAINT uq_devengo_hecho
  UNIQUE (referencia_tipo, referencia_id, concepto_tarifa_id);

-- R-TAR-06 · una deducción respalda un solo cargo
CREATE UNIQUE INDEX uq_cargo_deduccion
  ON cargo_comision (deduccion_entrega_id)
  WHERE deduccion_entrega_id IS NOT NULL;

-- R-TAR-07 · una tarifa congelada por grupo
ALTER TABLE tarifa_congelada_grupo
  ADD CONSTRAINT uq_tarifa_congelada_grupo UNIQUE (grupo_id);

-- R-TAR-08 · preaviso cumplido antes de entrar en vigencia
CREATE OR REPLACE FUNCTION fn_tar_validar_preaviso() RETURNS trigger AS $$
DECLARE v_cambio RECORD;
BEGIN
  IF NEW.estado <> 'VIGENTE' OR OLD.estado = 'VIGENTE' THEN RETURN NEW; END IF;
  SELECT * INTO v_cambio FROM cambio_tarifario WHERE tarifario_nuevo_id = NEW.id;
  IF v_cambio.requiere_preaviso THEN
    IF v_cambio.fecha_aviso IS NULL
       OR now() < v_cambio.fecha_aviso + (v_cambio.dias_preaviso || ' days')::interval THEN
      RAISE EXCEPTION 'R-TAR-08: preaviso de % días no cumplido', v_cambio.dias_preaviso;
    END IF;
  END IF;
  RETURN NEW;
END $$ LANGUAGE plpgsql;

CREATE TRIGGER tg_tarifario_preaviso
  BEFORE UPDATE OF estado ON tarifario
  FOR EACH ROW EXECUTE FUNCTION fn_tar_validar_preaviso();

-- R-TAR-09 · unicidad fiscal
ALTER TABLE factura_electronica
  ADD CONSTRAINT uq_factura_cuf UNIQUE (cuf),
  ADD CONSTRAINT uq_factura_correlativo
    UNIQUE (nit_emisor, sucursal, punto_venta, numero_factura);
ALTER TABLE nota_credito_debito ADD CONSTRAINT uq_nota_cuf UNIQUE (cuf);

-- R-TAR-10 · factura validada inmutable
CREATE OR REPLACE FUNCTION fn_tar_factura_inmutable() RETURNS trigger AS $$
BEGIN
  IF OLD.estado_fiscal = 'VALIDADA'
     AND NEW.estado_fiscal NOT IN ('ANULADA','VALIDADA') THEN
    RAISE EXCEPTION 'R-TAR-10: una factura validada solo se anula; emita nota de crédito';
  END IF;
  IF OLD.estado_fiscal = 'VALIDADA' AND NEW.monto_total <> OLD.monto_total THEN
    RAISE EXCEPTION 'R-TAR-10: no se puede modificar el monto de una factura validada';
  END IF;
  RETURN NEW;
END $$ LANGUAGE plpgsql;

CREATE TRIGGER tg_factura_inmutable
  BEFORE UPDATE ON factura_electronica
  FOR EACH ROW EXECUTE FUNCTION fn_tar_factura_inmutable();

-- R-TAR-11 · no devolver más de lo cobrado
CREATE OR REPLACE FUNCTION fn_tar_validar_devolucion() RETURNS trigger AS $$
DECLARE v_cobrado NUMERIC(12,2); v_devuelto NUMERIC(12,2);
BEGIN
  SELECT COALESCE(SUM(monto_cobrado),0) INTO v_cobrado
    FROM cargo_comision WHERE devengo_id = NEW.devengo_id AND estado = 'COBRADO';
  SELECT COALESCE(SUM(monto_devuelto),0) INTO v_devuelto
    FROM devolucion_comision
   WHERE devengo_id = NEW.devengo_id AND estado = 'EJECUTADA' AND id <> NEW.id;
  IF v_devuelto + NEW.monto_devuelto > v_cobrado THEN
    RAISE EXCEPTION 'R-TAR-11: devolución (%) excede lo cobrado (%)',
                    v_devuelto + NEW.monto_devuelto, v_cobrado;
  END IF;
  RETURN NEW;
END $$ LANGUAGE plpgsql;

CREATE TRIGGER tg_devolucion_maxima
  BEFORE INSERT OR UPDATE ON devolucion_comision
  FOR EACH ROW EXECUTE FUNCTION fn_tar_validar_devolucion();

-- R-TAR-12 · consumidor final: precio con impuestos incluidos
ALTER TABLE concepto_tarifa
  ADD CONSTRAINT ck_concepto_precio_final CHECK (
      NOT (gravado_iva AND NOT precio_incluye_impuesto
           AND sujeto_obligado IN ('BENEFICIARIO_DEL_TURNO','PAGADOR_DE_LA_OPERACION'))
  );

-- R-TAR-13 · toda factura offline bajo un evento significativo
ALTER TABLE factura_electronica
  ADD CONSTRAINT ck_factura_offline_evento CHECK (
      estado_fiscal <> 'EMITIDA_OFFLINE' OR evento_significativo_id IS NOT NULL
  );
```

---

## R-UIF — Prevención de LGI/FT y reportes

| Código | Regla | Obliga | Se verifica en |
| --- | --- | --- | --- |
| R-UIF-01 | Los umbrales son datos con vigencia y base normativa | UIF | [[CU-41 Detectar umbral y registrar formulario PCC-01]] |
| R-UIF-02 | Superar un umbral genera registro obligatorio | UIF arts. 52 y 53 | [[CU-41 Detectar umbral y registrar formulario PCC-01]] |
| R-UIF-03 | La ventana de acumulación reinicia tras superar el umbral | UIF | [[CU-41 Detectar umbral y registrar formulario PCC-01]] |
| R-UIF-04 | Se guarda el tipo de cambio aplicado | Reproducibilidad | [[CU-41 Detectar umbral y registrar formulario PCC-01]] |
| R-UIF-05 | Cada registro pertenece a un período de remisión | UIF (día 15) | [[CU-43 Remitir los reportes mensuales a la UIF]] |
| R-UIF-06 | Si no hubo operaciones, se informa en cero | UIF | [[CU-43 Remitir los reportes mensuales a la UIF]] |
| R-UIF-07 | Una alerta no se cierra sin conclusión | UIF | [[CU-44 De alerta de monitoreo a reporte de operación sospechosa]] |
| R-UIF-08 | Todo caso e investigación tiene plazo guardado | UIF | [[CU-44 De alerta de monitoreo a reporte de operación sospechosa]] |
| R-UIF-09 | No se opera sin debida diligencia vigente | UIF | [[CU-02 Elevar nivel de debida diligencia]] |
| R-UIF-10 | Un PEP exige diligencia reforzada y doble revisión | UIF | [[CU-03 Declaración PEP y beneficiario final]] |
| R-UIF-11 | Una sola calificación de riesgo vigente por cliente | UIF | [[CU-02 Elevar nivel de debida diligencia]] |

```sql
-- R-UIF-01 · umbrales versionados con su cita normativa
ALTER TABLE umbral_reporte_uif
  ADD CONSTRAINT ck_umbral_base_normativa CHECK (length(trim(base_normativa)) > 0),
  ADD CONSTRAINT ck_umbral_ventana CHECK (
      (es_acumulado AND ventana_dias_calendario IS NOT NULL)
   OR (NOT es_acumulado AND ventana_dias_calendario IS NULL)
  );

ALTER TABLE umbral_reporte_uif
  ADD CONSTRAINT ex_umbral_vigencia
  EXCLUDE USING gist (
    formulario WITH =, concepto_operacion WITH =, es_acumulado WITH =,
    daterange(vigente_desde, vigente_hasta, '[]') WITH &&
  ) WHERE (activo);

-- R-UIF-03 y R-UIF-04 · coherencia del registro por umbral
ALTER TABLE registro_operacion_relevante
  ADD CONSTRAINT ck_operelev_ventana CHECK (
      (es_acumulada AND ventana_desde IS NOT NULL AND ventana_hasta IS NOT NULL)
   OR (NOT es_acumulada AND ventana_desde IS NULL)
  ),
  ADD CONSTRAINT ck_operelev_tipo_cambio CHECK (
      moneda = 'USD' OR tipo_cambio_aplicado > 0
  ),
  ADD CONSTRAINT ck_operelev_declaracion CHECK (
      exento
   OR formulario <> 'PCC-01'
   OR (origen_declarado IS NOT NULL AND destino_declarado IS NOT NULL)
   OR motivo_exencion IS NOT NULL
  ),
  ADD CONSTRAINT ck_operelev_periodo CHECK (periodo_remision ~ '^\d{4}-\d{2}$');

-- R-UIF-04 · conversión reproducible a dólares
CREATE OR REPLACE FUNCTION fn_fx_a_usd(p_monto NUMERIC, p_moneda CHAR(3), p_fecha DATE,
                                       OUT monto_usd NUMERIC, OUT tipo_cambio NUMERIC)
AS $$
BEGIN
  IF p_moneda = 'USD' THEN
    monto_usd := p_monto; tipo_cambio := 1; RETURN;
  END IF;
  SELECT tc.tipo_cambio INTO tipo_cambio
    FROM tipo_cambio tc
   WHERE tc.moneda_origen = p_moneda AND tc.moneda_destino = 'USD'
     AND tc.fecha <= p_fecha
   ORDER BY tc.fecha DESC LIMIT 1;
  IF tipo_cambio IS NULL THEN
    RAISE EXCEPTION 'R-UIF-04: no hay tipo de cambio % -> USD al %', p_moneda, p_fecha;
  END IF;
  monto_usd := round(p_monto * tipo_cambio, 2);
END $$ LANGUAGE plpgsql STABLE;

-- Mapeo del tipo de transacción al concepto de operación del instructivo
CREATE OR REPLACE FUNCTION fn_uif_concepto(p_tipo TEXT) RETURNS TEXT AS $$
BEGIN
  RETURN CASE p_tipo
    WHEN 'RECARGA'           THEN 'CARGA_BILLETERA'
    WHEN 'RETIRO'            THEN 'RETIRO_BILLETERA'
    WHEN 'TRANSFERENCIA_P2P' THEN 'TRANSFERENCIA_BILLETERA'
    WHEN 'APORTE_A_GRUPO'    THEN 'TRANSFERENCIA_BILLETERA'
    ELSE 'ELECTRONICA'
  END;
END $$ LANGUAGE plpgsql IMMUTABLE;

-- Titular de la operación: dueño de la cuenta debitada
CREATE OR REPLACE FUNCTION fn_uif_titular(p_transaccion UUID) RETURNS UUID AS $$
DECLARE v_usuario UUID;
BEGIN
  SELECT c.usuario_id INTO v_usuario
    FROM movimiento_billetera m
    JOIN cuenta_billetera c ON c.id = m.cuenta_billetera_id
   WHERE m.transaccion_id = p_transaccion AND c.usuario_id IS NOT NULL
   ORDER BY (m.sentido = 'DEBITO') DESC, m.orden
   LIMIT 1;
  RETURN v_usuario;
END $$ LANGUAGE plpgsql STABLE;

-- R-UIF-03 · acumulado desde el reinicio de la ventana
CREATE OR REPLACE FUNCTION fn_uif_acumulado(
    p_usuario UUID, p_umbral UUID, p_fecha DATE,
    OUT monto NUMERIC, OUT desde DATE, OUT inicio_id UUID) AS $$
DECLARE v_u RECORD; v_ultimo TIMESTAMPTZ;
BEGIN
  SELECT * INTO v_u FROM umbral_reporte_uif WHERE id = p_umbral;
  -- la ventana arranca después de la última operación que superó el umbral
  SELECT max(r.fecha_operacion) INTO v_ultimo
    FROM registro_operacion_relevante r
   WHERE r.usuario_id = p_usuario AND r.umbral_reporte_id = p_umbral;
  desde := greatest(COALESCE(v_ultimo::date + 1, p_fecha - (v_u.ventana_dias_calendario - 1)),
                    p_fecha - (v_u.ventana_dias_calendario - 1));
  SELECT COALESCE(sum(x.usd), 0), min(x.id)
    INTO monto, inicio_id
    FROM (SELECT t.id,
                 (fn_fx_a_usd(t.monto_total, t.moneda, t.ocurrida_en::date)).monto_usd AS usd
            FROM transaccion_billetera t
           WHERE t.estado = 'APLICADA'
             AND fn_uif_concepto(t.tipo) = v_u.concepto_operacion
             AND fn_uif_titular(t.id) = p_usuario
             AND t.ocurrida_en::date BETWEEN desde AND p_fecha) x;
END $$ LANGUAGE plpgsql STABLE;

-- R-UIF-02 · registra la operación relevante en la misma transacción del hecho
CREATE OR REPLACE FUNCTION fn_uif_registrar_operacion(p_transaccion UUID)
RETURNS INTEGER AS $$
DECLARE
  v_tx RECORD; v_u RECORD; v_usuario UUID;
  v_usd NUMERIC; v_tc NUMERIC; v_acum NUMERIC; v_desde DATE; v_inicio UUID;
  v_creados INTEGER := 0;
BEGIN
  SELECT * INTO v_tx FROM transaccion_billetera WHERE id = p_transaccion;
  IF v_tx.estado <> 'APLICADA' THEN RETURN 0; END IF;

  v_usuario := fn_uif_titular(p_transaccion);
  IF v_usuario IS NULL THEN RETURN 0; END IF;   -- operativa propia: exenta

  SELECT monto_usd, tipo_cambio INTO v_usd, v_tc
    FROM fn_fx_a_usd(v_tx.monto_total, v_tx.moneda, v_tx.ocurrida_en::date);

  FOR v_u IN
      SELECT * FROM umbral_reporte_uif
       WHERE activo
         AND concepto_operacion = fn_uif_concepto(v_tx.tipo)
         AND vigente_desde <= v_tx.ocurrida_en::date
         AND (vigente_hasta IS NULL OR vigente_hasta >= v_tx.ocurrida_en::date)
  LOOP
    IF v_u.es_acumulado THEN
      SELECT monto, desde, inicio_id INTO v_acum, v_desde, v_inicio
        FROM fn_uif_acumulado(v_usuario, v_u.id, v_tx.ocurrida_en::date);
    ELSE
      v_acum := v_usd; v_desde := NULL; v_inicio := NULL;
    END IF;

    CONTINUE WHEN v_acum < v_u.umbral_usd;

    INSERT INTO registro_operacion_relevante (
        usuario_id, transaccion_id, umbral_reporte_id, operacion_inicio_ventana_id,
        formulario, concepto_operacion, es_acumulada, ventana_desde, ventana_hasta,
        monto, moneda, monto_acumulado_ventana, tipo_cambio_aplicado,
        monto_equivalente_usd, umbral_aplicado_usd, exento,
        periodo_remision, fecha_operacion, registrada_en)
    VALUES (
        v_usuario, p_transaccion, v_u.id, v_inicio,
        v_u.formulario, v_u.concepto_operacion, v_u.es_acumulado,
        v_desde, CASE WHEN v_u.es_acumulado THEN v_tx.ocurrida_en::date END,
        v_tx.monto_total, v_tx.moneda, v_acum, v_tc,
        v_usd, v_u.umbral_usd, FALSE,
        to_char(v_tx.ocurrida_en, 'YYYY-MM'), v_tx.ocurrida_en, now())
    ON CONFLICT (transaccion_id, umbral_reporte_id) DO NOTHING;

    v_creados := v_creados + 1;
  END LOOP;
  RETURN v_creados;
END $$ LANGUAGE plpgsql;

-- R-UIF-13 · un registro por transacción y umbral (hace idempotente el motor)
ALTER TABLE registro_operacion_relevante
  ADD CONSTRAINT uq_operelev_tx_umbral UNIQUE (transaccion_id, umbral_reporte_id);

-- El motor se invoca al aplicar la transacción, cuando ya existen sus movimientos
CREATE OR REPLACE FUNCTION fn_uif_disparar_registro() RETURNS trigger AS $$
BEGIN
  PERFORM fn_uif_registrar_operacion(NEW.transaccion_id);
  RETURN NULL;
END $$ LANGUAGE plpgsql;

CREATE CONSTRAINT TRIGGER tg_movimiento_umbrales_uif
  AFTER INSERT ON movimiento_billetera
  DEFERRABLE INITIALLY DEFERRED
  FOR EACH ROW EXECUTE FUNCTION fn_uif_disparar_registro();

-- R-UIF-06 · reporte en cero coherente
ALTER TABLE reporte_regulatorio
  ADD CONSTRAINT ck_reporte_en_cero CHECK (
      reporte_en_cero = (cantidad_registros = 0)
  ),
  ADD CONSTRAINT uq_reporte_catalogo_periodo UNIQUE (catalogo_reporte_id, periodo);

-- R-UIF-07 · no se cierra una alerta sin conclusión
ALTER TABLE alerta_monitoreo_lft
  ADD CONSTRAINT ck_alerta_conclusion CHECK (
      estado NOT IN ('DESCARTADA','ESCALADA')
   OR (conclusion IS NOT NULL AND length(trim(conclusion)) >= 20)
  );

-- R-UIF-08 · el caso tiene plazo y revisor distinto del analista
ALTER TABLE caso_investigacion_lft
  ADD CONSTRAINT ck_caso_plazo CHECK (plazo_limite > abierto_en),
  ADD CONSTRAINT ck_caso_revision CHECK (
      revisado_por IS NULL OR revisado_por <> analista_id
  ),
  ADD CONSTRAINT ck_caso_reporte CHECK (
      decision <> 'REPORTAR' OR reporte_operacion_sospechosa_id IS NOT NULL
  );

-- R-UIF-09 · no operar sin diligencia vigente
CREATE OR REPLACE FUNCTION fn_uif_exigir_ddd(p_usuario UUID) RETURNS VOID AS $$
DECLARE v_ok BOOLEAN;
BEGIN
  SELECT EXISTS (
    SELECT 1 FROM debida_diligencia
     WHERE usuario_id = p_usuario AND estado = 'COMPLETA'
       AND (vence_en IS NULL OR vence_en > now())
  ) INTO v_ok;
  IF NOT v_ok THEN
    RAISE EXCEPTION 'R-UIF-09: el cliente no tiene debida diligencia vigente';
  END IF;
END $$ LANGUAGE plpgsql;

-- R-UIF-10 · PEP con diligencia reforzada y cuatro ojos
CREATE OR REPLACE FUNCTION fn_uif_validar_pep() RETURNS trigger AS $$
DECLARE v_pep BOOLEAN;
BEGIN
  SELECT COALESCE(bool_or(es_pep), FALSE) INTO v_pep
    FROM declaracion_pep
   WHERE usuario_id = NEW.usuario_id AND (hasta IS NULL OR hasta >= current_date);
  IF v_pep THEN
    IF NEW.tipo <> 'REFORZADA' THEN
      RAISE EXCEPTION 'R-UIF-10: un PEP exige debida diligencia REFORZADA';
    END IF;
    IF NEW.estado = 'COMPLETA'
       AND (NEW.segunda_revision_por IS NULL
            OR NEW.segunda_revision_por = NEW.aprobada_por) THEN
      RAISE EXCEPTION 'R-UIF-10: falta segunda revisión independiente';
    END IF;
  END IF;
  RETURN NEW;
END $$ LANGUAGE plpgsql;

CREATE TRIGGER tg_ddd_pep
  BEFORE INSERT OR UPDATE ON debida_diligencia
  FOR EACH ROW EXECUTE FUNCTION fn_uif_validar_pep();

-- R-UIF-11 · una calificación vigente por cliente
ALTER TABLE calificacion_riesgo_cliente
  ADD CONSTRAINT ex_calificacion_vigente
  EXCLUDE USING gist (
    usuario_id WITH =,
    tstzrange(vigente_desde, vigente_hasta, '[)') WITH &&
  );
```

---

## R-CON — Consumidor financiero

| Código | Regla | Obliga | Se verifica en |
| --- | --- | --- | --- |
| R-CON-01 | El plazo de respuesta se calcula al ingresar y se guarda | ASFI Libro 4 Título I | [[CU-52 Atender un reclamo en plazo]] |
| R-CON-02 | La prórroga no excede el máximo y se comunica al cliente | ASFI | [[CU-52 Atender un reclamo en plazo]] |
| R-CON-03 | Superar el máximo exige comunicación escrita al organismo | ASFI | [[CU-52 Atender un reclamo en plazo]] |
| R-CON-04 | Reclamo favorable con monto exige reparación asociada | ASFI | [[CU-33 Devolver comisión y emitir nota de crédito]] |
| R-CON-05 | Los reclamos se conservan diez años | ASFI · Ley 393 | [[CU-52 Atender un reclamo en plazo]] |
| R-CON-06 | No se opera sin contrato de adhesión aceptado | ASFI | [[CU-05 Aceptar contrato de adhesión y tarifario]] |
| R-CON-07 | Debe existir tarifario publicado vigente | ASFI | [[CU-34 Publicar un tarifario nuevo con preaviso]] |
| R-CON-08 | Los extractos se archivan con hash | ASFI | [[CU-15 Emitir extracto y certificado de saldo]] |

```sql
-- R-CON-01 · plazo guardado, nunca recalculado
ALTER TABLE reclamo_cliente
  ADD CONSTRAINT ck_reclamo_plazo CHECK (plazo_respuesta > fecha_ingreso),
  ADD CONSTRAINT ck_reclamo_dias CHECK (dias_habiles_plazo BETWEEN 1 AND 5),
  ADD CONSTRAINT uq_reclamo_codigo UNIQUE (codigo);

-- R-CON-02 y R-CON-03 · prórroga acotada y comunicada
ALTER TABLE reclamo_cliente
  ADD CONSTRAINT ck_reclamo_prorroga CHECK (
      plazo_prorrogado_hasta IS NULL
   OR (plazo_prorrogado_hasta > plazo_respuesta
       AND prorroga_comunicada_al_cliente_en IS NOT NULL
       AND prorroga_comunicada_al_cliente_en <= plazo_respuesta)
  ),
  ADD CONSTRAINT ck_reclamo_prorroga_extendida CHECK (
      plazo_prorrogado_hasta IS NULL
   OR plazo_prorrogado_hasta <= fecha_ingreso + interval '10 days'
   OR (prorroga_comunicada_al_organismo_en IS NOT NULL
       AND justificacion_prorroga IS NOT NULL)
  );

-- R-CON-04 · un reclamo favorable con monto exige reparación
ALTER TABLE reclamo_cliente
  ADD CONSTRAINT ck_reclamo_reparacion CHECK (
      estado <> 'CERRADO'
   OR resultado <> 'FAVORABLE'
   OR monto_reclamado IS NULL
   OR devolucion_comision_id IS NOT NULL
  );

-- R-CON-05 · conservación
ALTER TABLE reclamo_cliente
  ADD CONSTRAINT ck_reclamo_conservacion CHECK (
      conservar_hasta >= (fecha_ingreso + interval '10 years')::date
  );

-- R-CON-06 · no operar sin contrato aceptado
CREATE OR REPLACE FUNCTION fn_con_exigir_contrato(p_usuario UUID, p_tipo TEXT)
RETURNS VOID AS $$
DECLARE v_ok BOOLEAN;
BEGIN
  SELECT EXISTS (
    SELECT 1 FROM aceptacion_contrato a
      JOIN contrato_adhesion c ON c.id = a.contrato_adhesion_id
     WHERE a.usuario_id = p_usuario AND c.tipo = p_tipo
       AND a.version_aceptada = c.version AND c.estado = 'VIGENTE'
  ) INTO v_ok;
  IF NOT v_ok THEN
    RAISE EXCEPTION 'R-CON-06: falta aceptación vigente del contrato %', p_tipo;
  END IF;
END $$ LANGUAGE plpgsql;

-- R-CON-07 · tarifario publicado
ALTER TABLE tarifario
  ADD CONSTRAINT ck_tarifario_publicado CHECK (
      estado <> 'VIGENTE'
   OR (publicado_en IS NOT NULL AND url_publicacion IS NOT NULL
       AND hash_documento IS NOT NULL)
  );

-- R-CON-08 · extractos con integridad verificable
ALTER TABLE estado_cuenta_billetera
  ADD CONSTRAINT ck_extracto_hash CHECK (length(hash_archivo) = 64),
  ADD CONSTRAINT ck_extracto_cuadra CHECK (
      saldo_final = saldo_inicial + total_creditos - total_debitos
  );
```

---

## R-SEG — Seguridad y datos personales

| Código | Regla | Obliga | Se verifica en |
| --- | --- | --- | --- |
| R-SEG-01 | Nunca se persiste el número completo de tarjeta o cuenta en claro | PCI DSS · ISO 27001 | [[CU-01 Registro y apertura de billetera]] |
| R-SEG-02 | Todo acceso a datos sensibles queda registrado con justificación | ASFI · ISO 27001 A.8.15 | [[CU-45 Atender un requerimiento de autoridad]] |
| R-SEG-03 | Un usuario solo ve sus propios datos (RLS) | Protección de datos | todos |
| R-SEG-04 | Segregación de funciones: quien autoriza no ejecuta | Control interno | [[CU-22 Liquidar y entregar el fondo]] |
| R-SEG-05 | Los incidentes guardan su plazo de reporte | ASFI Seguridad de la Información | [[CU-55 Gestionar un incidente de seguridad]] |
| R-SEG-06 | La anonimización respeta la retención legal | Ley 393 vs. derecho de supresión | [[CU-07 Ejercer derechos sobre datos personales]] |

```sql
-- R-SEG-01 · solo hash, token y enmascarado
ALTER TABLE instrumento_fondeo
  ADD CONSTRAINT ck_instrumento_sin_pan CHECK (
      enmascarado !~ '[0-9]{9,}' AND length(hash_identificador) = 64
  );
ALTER TABLE cuenta_bancaria_beneficiario
  ADD CONSTRAINT ck_cuenta_bancaria_sin_claro CHECK (
      numero_enmascarado !~ '[0-9]{9,}' AND length(hash_numero_cuenta) = 64
  );

-- R-SEG-02 · el acceso a datos sensibles exige justificación
ALTER TABLE registro_acceso_datos
  ADD CONSTRAINT ck_acceso_justificacion
  CHECK (length(trim(justificacion)) >= 10);

-- R-SEG-03 · seguridad a nivel de fila
ALTER TABLE cuenta_billetera ENABLE ROW LEVEL SECURITY;
CREATE POLICY pol_cuenta_propia ON cuenta_billetera
  FOR SELECT TO rol_aplicacion
  USING (usuario_id = current_setting('app.usuario_id', true)::uuid
         OR current_setting('app.rol', true) IN ('BACKOFFICE','CUMPLIMIENTO'));

ALTER TABLE movimiento_billetera ENABLE ROW LEVEL SECURITY;
CREATE POLICY pol_movimiento_propio ON movimiento_billetera
  FOR SELECT TO rol_aplicacion
  USING (EXISTS (SELECT 1 FROM cuenta_billetera c
                  WHERE c.id = movimiento_billetera.cuenta_billetera_id
                    AND (c.usuario_id = current_setting('app.usuario_id', true)::uuid
                         OR current_setting('app.rol', true) IN ('BACKOFFICE','CUMPLIMIENTO'))));

-- R-SEG-04 · cuatro ojos donde importa
ALTER TABLE entrega_fondo
  ADD CONSTRAINT ck_entrega_segregacion CHECK (
      autorizada_por IS NULL OR ejecutada_por IS NULL
   OR autorizada_por <> ejecutada_por
  );
ALTER TABLE reverso_transaccion
  ADD CONSTRAINT ck_reverso_segregacion CHECK (autorizada_por IS NOT NULL);
ALTER TABLE reporte_regulatorio
  ADD CONSTRAINT ck_reporte_segregacion CHECK (
      estado <> 'ENVIADO'
   OR (aprobado_por IS NOT NULL AND aprobado_por <> generado_por)
  );

-- R-SEG-05 · plazo de reporte guardado
ALTER TABLE incidente_seguridad
  ADD CONSTRAINT ck_incidente_plazo CHECK (plazo_reporte > detectado_en),
  ADD CONSTRAINT ck_incidente_notificacion CHECK (
      NOT datos_personales_afectados
   OR estado <> 'CERRADO'
   OR notificado_a_titulares_en IS NOT NULL
  );

-- R-SEG-06 · no anonimizar antes de tiempo
CREATE OR REPLACE FUNCTION fn_seg_validar_anonimizacion() RETURNS trigger AS $$
DECLARE v_retencion DATE;
BEGIN
  SELECT retencion_hasta INTO v_retencion
    FROM expediente_cliente WHERE usuario_id = NEW.usuario_id;
  IF NEW.estrategia = 'BORRADO_FISICO' AND v_retencion > current_date THEN
    RAISE EXCEPTION 'R-SEG-06: retención legal vigente hasta %; use seudonimización', v_retencion;
  END IF;
  RETURN NEW;
END $$ LANGUAGE plpgsql;

CREATE TRIGGER tg_anonimizacion_retencion
  BEFORE INSERT OR UPDATE ON proceso_anonimizacion
  FOR EACH ROW EXECUTE FUNCTION fn_seg_validar_anonimizacion();
```

---

## R-LIC — Licencia y gobierno

| Código | Regla | Obliga | Se verifica en |
| --- | --- | --- | --- |
| R-LIC-01 | No se habilita un servicio fuera del alcance autorizado | ASFI Res. 540/2025 | [[CU-46 Verificar el alcance de la licencia]] |
| R-LIC-02 | El sandbox opera dentro de sus límites | ASFI | [[CU-46 Verificar el alcance de la licencia]] |
| R-LIC-03 | Toda política vigente tiene acta de aprobación | ASFI riesgo operativo | [[CU-56 Ejecutar una prueba de continuidad]] |

```sql
-- R-LIC-01 · alcance autorizado como condición de servicio
CREATE OR REPLACE FUNCTION fn_lic_servicio_habilitado(p_servicio TEXT)
RETURNS BOOLEAN AS $$
DECLARE v_ok BOOLEAN;
BEGIN
  SELECT EXISTS (
    SELECT 1 FROM licencia_regulatoria
     WHERE estado = 'OTORGADA'
       AND (vigente_hasta IS NULL OR vigente_hasta >= current_date)
       AND alcance_autorizado @> to_jsonb(ARRAY[p_servicio])
  ) OR EXISTS (
    SELECT 1 FROM entorno_prueba_regulado
     WHERE estado = 'ACTIVO' AND servicio_en_prueba = p_servicio
       AND current_date BETWEEN fecha_inicio AND fecha_fin
  ) INTO v_ok;
  RETURN v_ok;
END $$ LANGUAGE plpgsql;

-- R-LIC-02 · el sandbox tiene límites obligatorios
ALTER TABLE entorno_prueba_regulado
  ADD CONSTRAINT ck_sandbox_limites CHECK (
      estado <> 'ACTIVO'
   OR (limite_usuarios IS NOT NULL AND limite_monto_operacion IS NOT NULL
       AND fecha_fin > fecha_inicio)
  );

-- R-LIC-03 · política vigente exige acta
ALTER TABLE politica_interna
  ADD CONSTRAINT ck_politica_acta CHECK (
      estado <> 'VIGENTE'
   OR (aprobada_por_directorio AND acta_comite_id IS NOT NULL)
  ),
  ADD CONSTRAINT ck_politica_revision CHECK (proxima_revision > vigente_desde);
```

---

## R-GRP — Circuito del pasanaku

| Código | Regla | Obliga | Se verifica en |
| --- | --- | --- | --- |
| R-GRP-01 | Un turno se entrega una sola vez | Integridad del juego | [[CU-22 Liquidar y entregar el fondo]] |
| R-GRP-02 | El neto es la bolsa menos las deducciones y nunca negativo | Transparencia | [[CU-22 Liquidar y entregar el fondo]] |
| R-GRP-03 | Una obligación de aporte por período y cupo | Integridad | [[CU-21 Cobrar el aporte del período]] |
| R-GRP-04 | La cuenta del grupo no tiene titular persona | RN-18 · separación | [[CU-20 Crear grupo y congelar tarifario]] |

```sql
-- R-GRP-01 · una entrega por turno y por período
ALTER TABLE entrega_fondo
  ADD CONSTRAINT uq_entrega_turno UNIQUE (turno_id),
  ADD CONSTRAINT uq_entrega_periodo UNIQUE (periodo_id);

-- R-GRP-02 · aritmética de la liquidación
ALTER TABLE entrega_fondo
  ADD CONSTRAINT ck_entrega_neto CHECK (
      monto_neto_a_entregar = monto_bolsa_bruto - total_deducciones
  ),
  ADD CONSTRAINT ck_entrega_neto_no_negativo CHECK (monto_neto_a_entregar >= 0);

CREATE OR REPLACE FUNCTION fn_grp_recalcular_deducciones() RETURNS trigger AS $$
DECLARE v_total NUMERIC(14,2); v_entrega UUID;
BEGIN
  v_entrega := COALESCE(NEW.entrega_id, OLD.entrega_id);
  SELECT COALESCE(SUM(monto),0) INTO v_total
    FROM deduccion_entrega
   WHERE entrega_id = v_entrega AND revertida_en IS NULL;
  UPDATE entrega_fondo
     SET total_deducciones = v_total,
         monto_neto_a_entregar = monto_bolsa_bruto - v_total
   WHERE id = v_entrega;
  RETURN NULL;
END $$ LANGUAGE plpgsql;

CREATE TRIGGER tg_deduccion_recalcula
  AFTER INSERT OR UPDATE OR DELETE ON deduccion_entrega
  FOR EACH ROW EXECUTE FUNCTION fn_grp_recalcular_deducciones();

-- R-GRP-03 · una obligación periódica por cupo
CREATE UNIQUE INDEX uq_obligacion_periodo_cupo
  ON obligacion_aporte (periodo_id, cupo_id)
  WHERE tipo = 'APORTE_PERIODICO' AND estado <> 'ANULADO';

-- R-GRP-04 · el grupo es el titular, nunca una persona
--   (cubierto por ck_cuenta_titularidad de R-BIL-05; se refuerza el egreso)
CREATE OR REPLACE FUNCTION fn_grp_validar_retiro_grupo() RETURNS trigger AS $$
DECLARE v_tipo TEXT;
BEGIN
  SELECT tipo INTO v_tipo FROM cuenta_billetera WHERE id = NEW.cuenta_billetera_id;
  IF v_tipo = 'GRUPO' THEN
    RAISE EXCEPTION 'R-GRP-04: la cuenta de un grupo no admite retiros directos; use entrega_fondo';
  END IF;
  RETURN NEW;
END $$ LANGUAGE plpgsql;

CREATE TRIGGER tg_retiro_no_grupo
  BEFORE INSERT ON orden_retiro
  FOR EACH ROW EXECUTE FUNCTION fn_grp_validar_retiro_grupo();
```

---

## R-RIS — Riesgo operativo y continuidad

| Código | Regla | Obliga | Se verifica en |
| --- | --- | --- | --- |
| R-RIS-01 | Todo evento de riesgo lleva categoría y factor de la taxonomía | ASFI Libro 3 Título V | [[CU-54 Registrar un evento de riesgo operativo]] |
| R-RIS-02 | La pérdida neta se deriva y las recuperaciones no la editan | ASFI | [[CU-54 Registrar un evento de riesgo operativo]] |
| R-RIS-03 | Todo proceso crítico tiene plan con RTO/RPO y prueba vigente | ASFI · ISO 22301 | [[CU-56 Ejecutar una prueba de continuidad]] |

```sql
-- R-RIS-01 · taxonomía cerrada
ALTER TABLE evento_riesgo_operativo
  ADD CONSTRAINT ck_evento_categoria CHECK (categoria_evento IN (
      'FRAUDE_INTERNO','FRAUDE_EXTERNO','RELACIONES_LABORALES',
      'CLIENTES_PRODUCTOS_PRACTICAS','DANOS_ACTIVOS','FALLAS_SISTEMAS')),
  ADD CONSTRAINT ck_evento_factor CHECK (factor_riesgo IN (
      'PROCESOS_INTERNOS','PERSONAS','TECNOLOGIA_INFORMACION',
      'EVENTOS_EXTERNOS','INFRAESTRUCTURA')),
  ADD CONSTRAINT ck_evento_fechas CHECK (fecha_deteccion >= fecha_ocurrencia);

-- R-RIS-02 · pérdida neta derivada
--   perdida_neta GENERATED ALWAYS AS (perdida_bruta - recuperacion) STORED
ALTER TABLE evento_riesgo_operativo
  ADD CONSTRAINT ck_evento_recuperacion CHECK (recuperacion <= perdida_bruta);

-- R-RIS-03 · continuidad con objetivos y prueba
ALTER TABLE plan_continuidad
  ADD CONSTRAINT ck_plan_objetivos CHECK (rto_minutos > 0 AND rpo_minutos >= 0),
  ADD CONSTRAINT ck_plan_prueba CHECK (proxima_prueba > vigente_desde);

ALTER TABLE prueba_continuidad
  ADD CONSTRAINT ck_prueba_resultado CHECK (
      resultado <> 'EXITOSA'
   OR (rto_obtenido_minutos IS NOT NULL AND acta_comite_id IS NOT NULL)
  );
```

---

## Roles de base de datos

```sql
-- rol_aplicacion   : la API
-- rol_backoffice   : soporte y operaciones
-- rol_cumplimiento : oficial de cumplimiento y analistas
-- rol_auditor      : solo lectura, incluso de tablas selladas
-- rol_migracion    : DDL, sin acceso a datos de producción
DO $$
DECLARE r TEXT;
BEGIN
  FOREACH r IN ARRAY ARRAY['rol_aplicacion','rol_backoffice','rol_cumplimiento',
                           'rol_auditor','rol_migracion'] LOOP
    IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = r) THEN
      EXECUTE format('CREATE ROLE %I NOLOGIN', r);
    END IF;
  END LOOP;
END $$;

GRANT SELECT ON ALL TABLES IN SCHEMA public TO rol_auditor;
REVOKE INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public FROM rol_auditor;

-- El rol de aplicación no puede tocar catálogos regulatorios
REVOKE INSERT, UPDATE, DELETE ON
    umbral_reporte_uif, limite_operativo_billetera, catalogo_reporte_regulatorio,
    impuesto, tarifario, concepto_tarifa, regla_tarifa, licencia_regulatoria,
    politica_interna, matriz_riesgo_lft, regla_monitoreo_lft
FROM rol_aplicacion;
```

> [!important] Por qué el rol de la aplicación no edita los catálogos
> Si la API pudiera cambiar un umbral, un límite o un tarifario, un bug o un
> atacante podrían apagar el cumplimiento sin dejar rastro. Esos catálogos se
> cargan por **seeder versionado en el repositorio**, con revisión, no desde la
> aplicación.

## Índices que sostienen los controles

```sql
-- Vencimientos: tableros de control diario
CREATE INDEX ix_reclamo_vencidos ON reclamo_cliente (plazo_respuesta)
  WHERE estado IN ('INGRESADO','EN_ANALISIS');
CREATE INDEX ix_caso_vencidos ON caso_investigacion_lft (plazo_limite)
  WHERE estado <> 'CERRADO';
CREATE INDEX ix_requerimiento_vencidos ON requerimiento_autoridad (plazo_respuesta)
  WHERE estado <> 'RESPONDIDO';
CREATE INDEX ix_reporte_vencidos ON reporte_regulatorio (fecha_limite)
  WHERE estado <> 'ENVIADO';
CREATE INDEX ix_revision_kyc_vencidas ON revision_periodica_kyc (fecha_programada)
  WHERE estado <> 'EJECUTADA';
CREATE INDEX ix_ddd_por_vencer ON debida_diligencia (vence_en)
  WHERE estado = 'COMPLETA';

-- Extracto y auditoría de dinero
CREATE INDEX ix_movimiento_cuenta_fecha
  ON movimiento_billetera (cuenta_billetera_id, registrado_en DESC);
CREATE INDEX ix_transaccion_ocurrida ON transaccion_billetera USING brin (ocurrida_en);

-- Motor de umbrales
CREATE INDEX ix_operelev_periodo ON registro_operacion_relevante (periodo_remision, formulario)
  WHERE NOT exento;
CREATE INDEX ix_operelev_usuario_fecha
  ON registro_operacion_relevante (usuario_id, fecha_operacion DESC);
```

## Consultas de verificación

Se corren en cada despliegue y en el control diario. **Todas deben devolver cero
filas.**

```sql
-- 1) Transacciones descuadradas
SELECT t.id FROM transaccion_billetera t
  JOIN movimiento_billetera m ON m.transaccion_id = t.id
 WHERE t.estado = 'APLICADA'
 GROUP BY t.id
HAVING SUM(CASE WHEN m.sentido='DEBITO' THEN m.monto ELSE -m.monto END) <> 0;

-- 2) Saldo cacheado que no coincide con el libro
SELECT c.id, c.saldo_disponible, SUM(CASE WHEN m.sentido='CREDITO' THEN m.monto
                                          ELSE -m.monto END) AS calculado
  FROM cuenta_billetera c
  LEFT JOIN movimiento_billetera m ON m.cuenta_billetera_id = c.id
 GROUP BY c.id, c.saldo_disponible
HAVING c.saldo_disponible + c.saldo_retenido
     <> COALESCE(SUM(CASE WHEN m.sentido='CREDITO' THEN m.monto ELSE -m.monto END),0);

-- 3) Días con encaje incumplido
SELECT fecha, ratio_cobertura FROM conciliacion_custodia WHERE NOT cumple_encaje;

-- 4) Obligaciones de reporte vencidas
SELECT codigo, periodo, fecha_limite FROM reporte_regulatorio r
  JOIN catalogo_reporte_regulatorio c ON c.id = r.catalogo_reporte_id
 WHERE r.estado <> 'ENVIADO' AND r.fecha_limite < current_date;

-- 5) Entregas con comisión no trazable al tarifario
SELECT d.id FROM deduccion_entrega d
  LEFT JOIN cargo_comision cc ON cc.deduccion_entrega_id = d.id
 WHERE d.tipo = 'COMISION_PLATAFORMA' AND cc.id IS NULL;

-- 6) Reclamos cerrados favorables sin reparación
SELECT codigo FROM reclamo_cliente
 WHERE estado='CERRADO' AND resultado='FAVORABLE'
   AND monto_reclamado IS NOT NULL AND devolucion_comision_id IS NULL;
```

## Cómo se aplica

El SQL de este documento se extrae a archivos ejecutables:

```bash
python3 scripts/generar_ddl.py     # esquema completo + catálogo + verificaciones
```

- `sql/40_reglas/restricciones.sql` — las restricciones de este documento
- `sql/50_verificacion/verificaciones.sql` — las consultas de control
- `sql/35_append_only/append_only.sql` — el sellado de las tablas append-only,
  emitido desde la lista `APPEND_ONLY` del modelo

El documento es la fuente de verdad; los `.sql` son derivados. Si hay que cambiar
una restricción, **se edita acá** y se regenera.

> [!tip] Verificado contra PostgreSQL
> El esquema completo aplica sin errores sobre PostgreSQL 16 y
> `sql/50_verificacion/prueba_humo.sql` comprueba que las restricciones
> **rechazan efectivamente** lo que deben rechazar: 65 comprobaciones, incluidas
> saldo negativo, transacción descuadrada, doble idempotencia, `UPDATE` sobre
> tablas selladas, retención sin vencimiento, umbral sin cita normativa y
> vigencias solapadas.

## Ver también

[[Cumplimiento]] — qué norma obliga cada regla ·
[[_CasosDeUso]] — dónde se ejercita ·
[[_Entidades]] · [[Index]]
