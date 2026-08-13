-- =====================================================================
--  Prueba de humo de las restricciones críticas
--    psql -d pasanaku -f sql/50_verificacion/prueba_humo.sql
--
--  Cada línea debe empezar con OK. Una línea FALLA significa que una regla
--  que debería ser imposible de violar no está protegiendo nada.
--
--  Funciona igual con la base recién creada o ya sembrada: usa códigos y
--  monedas propios que no colisionan con los catálogos de seeders/.
--
--  Este archivo está escrito a mano (el resto de sql/ es generado).
-- =====================================================================
\set QUIET on
\set ON_ERROR_STOP off
\pset tuples_only on
\pset format unaligned

CREATE OR REPLACE FUNCTION pg_temp.debe_fallar(p_caso TEXT, p_sql TEXT)
RETURNS TEXT AS $$
BEGIN
  BEGIN
    EXECUTE p_sql;
  EXCEPTION WHEN others THEN
    RETURN 'OK    · ' || p_caso || ' → rechazado';
  END;
  RETURN 'FALLA · ' || p_caso || ' → la base lo permitió';
END $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION pg_temp.debe_pasar(p_caso TEXT, p_sql TEXT)
RETURNS TEXT AS $$
BEGIN
  EXECUTE p_sql;
  RETURN 'OK    · ' || p_caso;
EXCEPTION WHEN others THEN
  RETURN 'FALLA · ' || p_caso || ' → ' || left(SQLERRM, 90);
END $$ LANGUAGE plpgsql;

-- --- preparación ------------------------------------------------------
SELECT pg_temp.debe_pasar('alta de cuenta de plataforma', $q$
  INSERT INTO cuenta_billetera (id, numero_cuenta, tipo, moneda, estado,
      nivel_debida_diligencia, fecha_apertura)
  VALUES ('11111111-1111-1111-1111-111111111111', 'PLT-0001',
          'PLATAFORMA_INGRESOS', 'BOB', 'ACTIVA', 'ESTANDAR', now())
$q$);

-- La cuenta puente es contrapartida del sistema: por diseño opera en negativo
SELECT pg_temp.debe_pasar('alta de cuenta técnica de custodia', $q$
  INSERT INTO cuenta_billetera (id, numero_cuenta, tipo, moneda, estado,
      nivel_debida_diligencia, fecha_apertura, permite_saldo_negativo)
  VALUES ('22222222-2222-2222-2222-222222222222', 'PUE-0001',
          'PUENTE_CUSTODIA', 'BOB', 'ACTIVA', 'ESTANDAR', now(), TRUE)
$q$);

-- --- R-BIL-05 · titularidad coherente con el tipo ---------------------
SELECT pg_temp.debe_fallar('R-BIL-05 cuenta USUARIO sin titular', $q$
  INSERT INTO cuenta_billetera (numero_cuenta, tipo, moneda, estado,
      nivel_debida_diligencia, fecha_apertura)
  VALUES ('USR-0001', 'USUARIO', 'BOB', 'ACTIVA', 'SIMPLIFICADA', now())
$q$);

-- --- R-BIL-02 · el saldo disponible no puede ser negativo -------------
SELECT pg_temp.debe_fallar('R-BIL-02 saldo negativo', $q$
  UPDATE cuenta_billetera SET saldo_disponible = -1
   WHERE numero_cuenta = 'PLT-0001'
$q$);

-- --- enumerado cerrado ------------------------------------------------
SELECT pg_temp.debe_fallar('CHECK de enumerado en estado', $q$
  UPDATE cuenta_billetera SET estado = 'INVENTADO'
   WHERE numero_cuenta = 'PLT-0001'
$q$);

-- --- R-BIL-03 · saldo_total es derivado, no se escribe ----------------
SELECT pg_temp.debe_fallar('R-BIL-03 escribir el saldo total', $q$
  UPDATE cuenta_billetera SET saldo_total = 999
   WHERE numero_cuenta = 'PLT-0001'
$q$);

-- --- R-BIL-01 · transacción sin contrapartida: se rechaza al COMMIT ---
BEGIN;
INSERT INTO transaccion_billetera (id, tipo, estado, moneda, monto_total,
    origen_tipo, origen_id, canal, clave_idempotencia, hash_registro,
    ocurrida_en, registrada_en)
VALUES ('33333333-3333-3333-3333-333333333333', 'RECARGA', 'APLICADA', 'BOB',
        100, 'ORDEN_RECARGA', gen_random_uuid(), 'APP', 'idem-descuadre',
        '', now(), now());
INSERT INTO movimiento_billetera (transaccion_id, cuenta_billetera_id, orden,
    sentido, monto, saldo_disponible_posterior, saldo_retenido_posterior, glosa)
VALUES ('33333333-3333-3333-3333-333333333333',
        '11111111-1111-1111-1111-111111111111', 1, 'CREDITO', 100, 100, 0,
        'solo el credito, sin debito');
COMMIT;
SELECT CASE WHEN count(*) = 0
            THEN 'OK    · R-BIL-01 transacción descuadrada → rechazada al COMMIT'
            ELSE 'FALLA · R-BIL-01 transacción descuadrada → quedó registrada' END
  FROM transaccion_billetera WHERE clave_idempotencia = 'idem-descuadre';

-- --- transacción cuadrada: debe pasar ---------------------------------
BEGIN;
INSERT INTO transaccion_billetera (id, tipo, estado, moneda, monto_total,
    origen_tipo, origen_id, canal, clave_idempotencia, hash_registro,
    ocurrida_en, registrada_en)
VALUES ('44444444-4444-4444-4444-444444444444', 'RECARGA', 'APLICADA', 'BOB',
        100, 'ORDEN_RECARGA', gen_random_uuid(), 'APP', 'idem-ok', '',
        now(), now());
INSERT INTO movimiento_billetera (transaccion_id, cuenta_billetera_id, orden,
    sentido, monto, saldo_disponible_posterior, saldo_retenido_posterior, glosa)
VALUES ('44444444-4444-4444-4444-444444444444',
        '11111111-1111-1111-1111-111111111111', 1, 'CREDITO', 100, 100, 0, 'credito'),
       ('44444444-4444-4444-4444-444444444444',
        '22222222-2222-2222-2222-222222222222', 2, 'DEBITO', 100, 0, 0, 'debito');
COMMIT;
SELECT CASE WHEN count(*) = 1
            THEN 'OK    · R-BIL-01 transacción cuadrada aceptada'
            ELSE 'FALLA · R-BIL-01 transacción cuadrada rechazada' END
  FROM transaccion_billetera WHERE clave_idempotencia = 'idem-ok';

-- --- R-AUD-03 · la cadena de hash la calcula la base ------------------
SELECT CASE WHEN length(hash_registro) = 64
            THEN 'OK    · R-AUD-03 hash encadenado calculado por la base'
            ELSE 'FALLA · R-AUD-03 hash no calculado' END
  FROM transaccion_billetera WHERE clave_idempotencia = 'idem-ok';

-- --- R-BIL-06 · idempotencia ------------------------------------------
SELECT pg_temp.debe_fallar('R-BIL-06 clave de idempotencia repetida', $q$
  INSERT INTO transaccion_billetera (tipo, estado, moneda, monto_total,
      origen_tipo, origen_id, canal, clave_idempotencia, hash_registro,
      ocurrida_en, registrada_en)
  VALUES ('RECARGA', 'INICIADA', 'BOB', 50, 'ORDEN_RECARGA', gen_random_uuid(),
          'APP', 'idem-ok', '', now(), now())
$q$);

-- --- R-AUD-01 · append-only -------------------------------------------
SELECT pg_temp.debe_fallar('R-AUD-01 UPDATE sobre movimiento_billetera', $q$
  UPDATE movimiento_billetera SET monto = 1
   WHERE transaccion_id = '44444444-4444-4444-4444-444444444444'
$q$);

SELECT pg_temp.debe_fallar('R-AUD-01 DELETE sobre transaccion_billetera', $q$
  DELETE FROM transaccion_billetera WHERE clave_idempotencia = 'idem-ok'
$q$);

-- todas las tablas append-only del modelo tienen que estar selladas
SELECT CASE WHEN count(*) = 19
            THEN 'OK    · R-AUD-01 las 19 tablas append-only están selladas'
            ELSE 'FALLA · R-AUD-01 solo ' || count(*) || ' de 19 tablas selladas' END
  FROM pg_trigger WHERE NOT tgisinternal AND tgname LIKE '%append\_only';

-- --- R-BIL-08 · toda retención expira salvo orden de autoridad --------
SELECT pg_temp.debe_fallar('R-BIL-08 retención sin vencimiento', $q$
  INSERT INTO retencion_saldo (cuenta_billetera_id, motivo, monto, estado, creada_en)
  VALUES ('11111111-1111-1111-1111-111111111111', 'APORTE_PROGRAMADO', 10,
          'VIGENTE', now())
$q$);

SELECT pg_temp.debe_pasar('R-BIL-08 retención de autoridad sin vencimiento', $q$
  INSERT INTO retencion_saldo (cuenta_billetera_id, motivo, monto, estado, creada_en)
  VALUES ('11111111-1111-1111-1111-111111111111', 'ORDEN_AUTORIDAD', 10,
          'VIGENTE', now())
$q$);

-- --- R-BIL-07 y R-BIL-16 · los saldos se derivan del libro ------------
SELECT CASE WHEN saldo_retenido = 10 AND saldo_disponible = 90 AND saldo_total = 100
            THEN 'OK    · R-BIL-07/16 saldos derivados por trigger (100 = 90 + 10)'
            ELSE 'FALLA · R-BIL-07/16 disponible=' || saldo_disponible
                 || ' retenido=' || saldo_retenido || ' total=' || saldo_total END
  FROM cuenta_billetera WHERE numero_cuenta = 'PLT-0001';

SELECT CASE WHEN saldo_disponible = -100
            THEN 'OK    · R-BIL-16 la cuenta puente refleja el débito del libro'
            ELSE 'FALLA · R-BIL-16 cuenta puente con saldo ' || saldo_disponible END
  FROM cuenta_billetera WHERE numero_cuenta = 'PUE-0001';

SELECT CASE WHEN count(*) = 0
            THEN 'OK    · R-BIL-16 ninguna caché de saldo difiere del libro'
            ELSE 'FALLA · R-BIL-16 ' || count(*) || ' cuenta(s) con saldo divergente' END
  FROM (SELECT c.id FROM cuenta_billetera c
          LEFT JOIN movimiento_billetera m ON m.cuenta_billetera_id = c.id
         GROUP BY c.id, c.saldo_disponible, c.saldo_retenido
        HAVING c.saldo_disponible + c.saldo_retenido
             <> COALESCE(SUM(CASE WHEN m.sentido='CREDITO' THEN m.monto
                                  ELSE -m.monto END), 0)) x;

-- --- R-UIF-01 · umbrales como dato, con cita normativa y sin solape ---
-- Se usa PCC-01 + ELECTRONICA: combinación que los seeders no ocupan, para
-- que la prueba corra igual sobre una base ya sembrada.
SELECT pg_temp.debe_fallar('R-UIF-01 umbral sin cita normativa', $q$
  INSERT INTO umbral_reporte_uif (formulario, inciso, concepto_operacion,
      es_acumulado, umbral_usd, ventana_dias_calendario,
      exige_declaracion_origen_destino, reinicia_tras_superar, base_normativa,
      vigente_desde, activo)
  VALUES ('PCC-01', 'z', 'ELECTRONICA', TRUE, 1000, 3, TRUE, TRUE, '   ',
          current_date, TRUE)
$q$);

SELECT pg_temp.debe_pasar('R-UIF-01 umbral con cita normativa', $q$
  INSERT INTO umbral_reporte_uif (formulario, inciso, concepto_operacion,
      es_acumulado, umbral_usd, ventana_dias_calendario,
      exige_declaracion_origen_destino, reinicia_tras_superar, base_normativa,
      vigente_desde, activo)
  VALUES ('PCC-01', 'z', 'ELECTRONICA', TRUE, 1000, 3, TRUE, TRUE,
          'Prueba de humo — inciso ficticio', current_date, TRUE)
$q$);

SELECT pg_temp.debe_fallar('R-UIF-01 vigencias solapadas del mismo umbral', $q$
  INSERT INTO umbral_reporte_uif (formulario, inciso, concepto_operacion,
      es_acumulado, umbral_usd, ventana_dias_calendario,
      exige_declaracion_origen_destino, reinicia_tras_superar, base_normativa,
      vigente_desde, activo)
  VALUES ('PCC-01', 'z', 'ELECTRONICA', TRUE, 500, 3, TRUE, TRUE,
          'duplicado que se solapa', current_date, TRUE)
$q$);

SELECT pg_temp.debe_fallar('R-UIF-01 umbral acumulado sin ventana', $q$
  INSERT INTO umbral_reporte_uif (formulario, inciso, concepto_operacion,
      es_acumulado, umbral_usd, ventana_dias_calendario,
      exige_declaracion_origen_destino, reinicia_tras_superar, base_normativa,
      vigente_desde, activo)
  VALUES ('ROG-03', 'z', 'ACTIVO_VIRTUAL', TRUE, 1000, NULL, FALSE,
          TRUE, 'Prueba de humo — acumulado sin ventana', current_date, TRUE)
$q$);

-- --- R-UIF-04 · sin tipo de cambio no hay conversión reproducible -----
-- XTS es el código ISO reservado para pruebas: nunca lo siembra un catálogo.
SELECT pg_temp.debe_fallar('R-UIF-04 conversión sin tipo de cambio cargado', $q$
  SELECT (fn_fx_a_usd(100, 'XTS', current_date)).monto_usd
$q$);

SELECT pg_temp.debe_pasar('R-UIF-04 conversión con tipo de cambio cargado', $q$
  INSERT INTO tipo_cambio (moneda_origen, moneda_destino, fecha, tipo_cambio,
      fuente, cargado_en)
  VALUES ('XTS', 'USD', current_date, 0.500000, 'MANUAL', now());
  SELECT (fn_fx_a_usd(100, 'XTS', current_date)).monto_usd;
$q$);

-- --- R-UIF-06 · el reporte en cero tiene que ser coherente ------------
SELECT pg_temp.debe_fallar('R-UIF-06 reporte en cero con registros', $q$
  INSERT INTO catalogo_reporte_regulatorio (id, codigo, organismo, nombre,
      periodicidad, formato, plazo_dias, base_normativa, obligatorio, activo)
  VALUES ('55555555-5555-5555-5555-555555555555', 'PCC-01', 'UIF',
          'Formularios PCC-01 del mes', 'MENSUAL', 'CSV', 15,
          'Instructivo EIF art. 52', TRUE, TRUE);
  INSERT INTO reporte_regulatorio (catalogo_reporte_id, periodo, fecha_corte,
      estado, cantidad_registros, reporte_en_cero, monto_total, fecha_limite)
  VALUES ('55555555-5555-5555-5555-555555555555', '2026-07', current_date,
          'GENERADO', 12, TRUE, 0, current_date)
$q$);

-- --- R-UIF-07 · una alerta no se cierra sin conclusión ----------------
SELECT pg_temp.debe_fallar('R-UIF-07 alerta descartada sin conclusión', $q$
  INSERT INTO alerta_monitoreo_lft (regla_monitoreo_id, usuario_id,
      monto_involucrado, detalle, severidad, estado, detectada_en)
  VALUES (NULL, NULL, 0, '{}'::jsonb, 'ALTA', 'DESCARTADA', now())
$q$);

-- --- R-LIM-01 · denegar por omisión y respeto del techo ---------------
SELECT pg_temp.debe_fallar('R-LIM-01 concepto sin límite configurado', $q$
  SELECT fn_lim_evaluar('11111111-1111-1111-1111-111111111111',
                        'CONCEPTO_SIN_LIMITE', 100)
$q$);

-- Con los catálogos sembrados, el techo tiene que hacerse cumplir; sin ellos,
-- la misma llamada se rechaza por omisión. Las dos respuestas son correctas.
SELECT CASE WHEN EXISTS (SELECT 1 FROM limite_operativo_billetera
                          WHERE concepto = 'RETIRO' AND activo)
            THEN pg_temp.debe_fallar('R-LIM-01 retiro que supera el techo del nivel', $q$
                   SELECT fn_lim_evaluar('11111111-1111-1111-1111-111111111111',
                                         'RETIRO', 9999999)
                 $q$)
            ELSE 'OK    · R-LIM-01 sin catálogo de límites: se deniega por omisión'
       END;

-- --- R-LIC-01 · servicio no autorizado --------------------------------
SELECT CASE WHEN fn_lic_servicio_habilitado('BILLETERA') = FALSE
            THEN 'OK    · R-LIC-01 sin licencia cargada, el servicio no se habilita'
            ELSE 'FALLA · R-LIC-01 habilitó un servicio sin licencia' END;

-- --- restricciones que exigen datos de varios módulos: se verifica que
--     existan y estén activas, sin simular el flujo completo ----------
WITH esperadas(codigo, objeto) AS (VALUES
      ('R-CON-01 ck_reclamo_plazo',              'ck_reclamo_plazo'),
      ('R-CON-02 ck_reclamo_prorroga',           'ck_reclamo_prorroga'),
      ('R-CON-03 ck_reclamo_prorroga_extendida', 'ck_reclamo_prorroga_extendida'),
      ('R-CON-04 ck_reclamo_reparacion',         'ck_reclamo_reparacion'),
      ('R-CON-05 ck_reclamo_conservacion',       'ck_reclamo_conservacion'),
      ('R-GRP-01 uq_entrega_turno',              'uq_entrega_turno'),
      ('R-GRP-02 ck_entrega_neto',               'ck_entrega_neto'),
      ('R-GRP-02 ck_entrega_neto_no_negativo',   'ck_entrega_neto_no_negativo'),
      ('R-GRP-03 uq_obligacion_periodo_cupo',    'uq_obligacion_periodo_cupo'),
      ('R-GRP-04 tg_retiro_no_grupo',            'tg_retiro_no_grupo'),
      ('R-TAR-01 ex_tarifario_vigente',          'ex_tarifario_vigente'),
      ('R-TAR-04 uq_devengo_hecho',              'uq_devengo_hecho'),
      ('R-TAR-06 uq_cargo_deduccion',            'uq_cargo_deduccion'),
      ('R-TAR-08 tg_tarifario_preaviso',         'tg_tarifario_preaviso'),
      ('R-TAR-09 uq_factura_cuf',                'uq_factura_cuf'),
      ('R-TAR-10 tg_factura_inmutable',          'tg_factura_inmutable'),
      ('R-TAR-11 tg_devolucion_maxima',          'tg_devolucion_maxima'),
      ('R-TAR-13 ck_factura_offline_evento',     'ck_factura_offline_evento'),
      ('R-UIF-10 tg_ddd_pep',                    'tg_ddd_pep'),
      ('R-UIF-11 ex_calificacion_vigente',       'ex_calificacion_vigente'),
      ('R-UIF-13 uq_operelev_tx_umbral',         'uq_operelev_tx_umbral'),
      ('R-SEG-01 ck_instrumento_sin_pan',        'ck_instrumento_sin_pan'),
      ('R-SEG-02 ck_acceso_justificacion',       'ck_acceso_justificacion'),
      ('R-SEG-04 ck_entrega_segregacion',        'ck_entrega_segregacion'),
      ('R-SEG-05 ck_incidente_plazo',            'ck_incidente_plazo'),
      ('R-SEG-06 tg_anonimizacion_retencion',    'tg_anonimizacion_retencion'),
      ('R-BIL-11 uq_conciliacion_cuenta_fecha',  'uq_conciliacion_cuenta_fecha'),
      ('R-BIL-12 tg_cierre_diario_valido',       'tg_cierre_diario_valido'),
      ('R-BIL-13 tg_cuenta_cierre_valido',       'tg_cuenta_cierre_valido'),
      ('R-BIL-14 uq_bloqueo_oficio',             'uq_bloqueo_oficio'),
      ('R-BIL-15 uq_reverso_original',           'uq_reverso_original'),
      ('R-LIM-02 uq_consumo_ventana',            'uq_consumo_ventana'),
      ('R-LIM-03 ex_limite_vigencia',            'ex_limite_vigencia'),
      ('R-RIS-01 ck_evento_categoria',           'ck_evento_categoria'),
      ('R-RIS-03 ck_plan_objetivos',             'ck_plan_objetivos'),
      ('R-LIC-02 ck_sandbox_limites',            'ck_sandbox_limites'),
      ('R-LIC-03 ck_politica_acta',              'ck_politica_acta'),
      ('R-AUD-05 tg_asiento_cuadrado',           'tg_asiento_cuadrado'),
      ('R-AUD-07 uq_saldo_diario_cuenta_fecha',  'uq_saldo_diario_cuenta_fecha')
)
SELECT CASE WHEN EXISTS (SELECT 1 FROM pg_constraint WHERE conname = objeto)
              OR EXISTS (SELECT 1 FROM pg_class WHERE relname = objeto AND relkind = 'i')
              OR EXISTS (SELECT 1 FROM pg_trigger WHERE tgname = objeto)
            THEN 'OK    · ' || codigo || ' presente'
            ELSE 'FALLA · ' || codigo || ' NO existe en la base' END
  FROM esperadas ORDER BY codigo;

\echo ''
\echo 'Prueba de humo terminada: toda línea debe empezar con OK.'
