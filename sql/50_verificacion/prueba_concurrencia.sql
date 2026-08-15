-- Prueba de concurrencia — se corre con dos conexiones simultáneas.
--   scripts/probar_concurrencia.sh
--
-- Es la prueba que no existía y que habría detectado P0-1, P0-3 y P1-6 de
-- docs/Auditoria-Robustez.md. Un solo hilo nunca reproduce estos defectos: hay
-- que abrir dos transacciones a la vez y hacerlas competir por la misma fila.
--
-- No forma parte de sql/aplicar.sql.

-- --------------------------------------------------------------------
-- Escenario: cuenta con 100 de saldo, dos débitos simultáneos de 100.
-- Correcto: uno pasa y el otro es rechazado por ck_cuenta_saldo_no_negativo.
-- Con el defecto: los dos pasan y la cuenta queda en -100.
-- --------------------------------------------------------------------

-- La cuenta puente es la contrapartida de todo movimiento: sin ella no se puede
-- escribir una sola línea, porque R-BIL-01 exige que débitos y créditos cuadren.
-- Admite saldo negativo por ser una cuenta técnica de sistema.
CREATE OR REPLACE FUNCTION prueba_cuenta_puente() RETURNS UUID AS $$
DECLARE v_puente UUID;
BEGIN
  SELECT id INTO v_puente FROM cuenta_billetera
   WHERE tipo = 'PUENTE_CUSTODIA' AND moneda = 'BOB' AND estado = 'ACTIVA';
  IF v_puente IS NULL THEN
    INSERT INTO cuenta_billetera (numero_cuenta, tipo, moneda, estado,
          nivel_debida_diligencia, permite_saldo_negativo, fecha_apertura)
    VALUES ('PUENTE-BOB-PRUEBA', 'PUENTE_CUSTODIA', 'BOB', 'ACTIVA',
            'ESTANDAR', TRUE, now())
    RETURNING id INTO v_puente;
  END IF;
  RETURN v_puente;
END $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION prueba_preparar_cuenta() RETURNS UUID AS $$
DECLARE v_cuenta UUID; v_usuario UUID; v_tx UUID; v_puente UUID;
BEGIN
  v_puente := prueba_cuenta_puente();
  INSERT INTO usuario (codigo_publico, nombres, apellidos, telefono_e164,
                       fecha_nacimiento, estado, nivel_kyc, idioma, zona_horaria,
                       fecha_registro)
  VALUES ('PRB' || substr(md5(random()::text), 1, 9), 'Prueba', 'Concurrencia',
          '+591' || (70000000 + floor(random() * 9999999))::bigint,
          '1990-01-01', 'ACTIVO', 'COMPLETO', 'es', 'America/La_Paz', now())
  RETURNING id INTO v_usuario;

  INSERT INTO cuenta_billetera (numero_cuenta, tipo, usuario_id, moneda, estado,
                                nivel_debida_diligencia, fecha_apertura)
  VALUES (substr(md5(random()::text), 1, 20), 'USUARIO', v_usuario, 'BOB',
          'ACTIVA', 'ESTANDAR', now())
  RETURNING id INTO v_cuenta;

  -- Crédito inicial de 100, con su contrapartida en la cuenta puente.
  INSERT INTO transaccion_billetera (tipo, estado, moneda, monto_total,
        origen_tipo, origen_id, canal, clave_idempotencia, hash_registro)
  VALUES ('RECARGA', 'APLICADA', 'BOB', 100, 'ORDEN_RECARGA', gen_random_uuid(),
          'BATCH', 'prb-' || gen_random_uuid(), '')
  RETURNING id INTO v_tx;

  INSERT INTO movimiento_billetera (transaccion_id, cuenta_billetera_id, orden,
        sentido, monto, glosa)
  VALUES (v_tx, v_cuenta, 1, 'CREDITO', 100, 'saldo inicial de prueba'),
         (v_tx, v_puente, 2, 'DEBITO',  100, 'contrapartida de custodia');

  RETURN v_cuenta;
END $$ LANGUAGE plpgsql;

-- Débito que cada conexión intenta en paralelo.
CREATE OR REPLACE FUNCTION prueba_debitar(p_cuenta UUID, p_monto NUMERIC)
RETURNS VOID AS $$
DECLARE v_tx UUID; v_puente UUID;
BEGIN
  v_puente := prueba_cuenta_puente();

  INSERT INTO transaccion_billetera (tipo, estado, moneda, monto_total,
        origen_tipo, origen_id, canal, clave_idempotencia, hash_registro)
  VALUES ('RETIRO', 'APLICADA', 'BOB', p_monto, 'ORDEN_RETIRO',
          gen_random_uuid(), 'APP', 'prb-' || gen_random_uuid(), '')
  RETURNING id INTO v_tx;

  INSERT INTO movimiento_billetera (transaccion_id, cuenta_billetera_id, orden,
        sentido, monto, glosa)
  VALUES (v_tx, p_cuenta, 1, 'DEBITO',  p_monto, 'débito concurrente'),
         (v_tx, v_puente, 2, 'CREDITO', p_monto, 'contrapartida de custodia');
END $$ LANGUAGE plpgsql;

-- --------------------------------------------------------------------
-- Veredicto: se corre después de las dos conexiones.
-- --------------------------------------------------------------------
CREATE OR REPLACE FUNCTION prueba_veredicto(p_cuenta UUID)
RETURNS TABLE (control TEXT, resultado TEXT) AS $$
BEGIN
  RETURN QUERY
  SELECT 'P0-1 · saldo no negativo tras débitos concurrentes'::TEXT,
         CASE WHEN (SELECT saldo_disponible FROM cuenta_billetera WHERE id = p_cuenta) >= 0
              THEN 'PASA' ELSE 'FALLA · sobregiro' END;

  RETURN QUERY
  SELECT 'P0-1 · el saldo coincide con el libro'::TEXT,
         CASE WHEN (SELECT c.saldo_disponible + c.saldo_retenido
                      FROM cuenta_billetera c WHERE c.id = p_cuenta)
                 = (SELECT COALESCE(SUM(CASE WHEN sentido='CREDITO' THEN monto
                                             ELSE -monto END), 0)
                      FROM movimiento_billetera WHERE cuenta_billetera_id = p_cuenta)
              THEN 'PASA' ELSE 'FALLA · movimiento perdido' END;

  RETURN QUERY
  SELECT 'P0-3 · cadena de transacciones sin bifurcaciones'::TEXT,
         CASE WHEN NOT EXISTS (
              SELECT 1 FROM transaccion_billetera t
                LEFT JOIN LATERAL (SELECT p.hash_registro FROM transaccion_billetera p
                                    WHERE p.secuencia < t.secuencia
                                    ORDER BY p.secuencia DESC LIMIT 1) prev ON TRUE
               WHERE t.hash_anterior IS DISTINCT FROM prev.hash_registro)
              THEN 'PASA' ELSE 'FALLA · eslabones hermanos' END;

  RETURN QUERY
  SELECT 'P0-3 · ningún hash_registro repetido'::TEXT,
         CASE WHEN (SELECT count(*) FROM transaccion_billetera)
                 = (SELECT count(DISTINCT hash_registro) FROM transaccion_billetera)
              THEN 'PASA' ELSE 'FALLA · hash duplicado' END;
END $$ LANGUAGE plpgsql;
