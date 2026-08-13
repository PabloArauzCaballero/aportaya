-- Índices y restricciones de unicidad del módulo 10 — Billetera, Custodia y Dinero Electrónico
-- Generado por scripts/generar_ddl.py — no editar a mano.

CREATE UNIQUE INDEX IF NOT EXISTS uq_politica_billetera_codigo
  ON politica_billetera (codigo);

CREATE UNIQUE INDEX IF NOT EXISTS uq_cuenta_billetera_numero_cuenta
  ON cuenta_billetera (numero_cuenta);

CREATE INDEX IF NOT EXISTS ix_cuenta_billetera_tipo
  ON cuenta_billetera (tipo);

CREATE INDEX IF NOT EXISTS ix_cuenta_billetera_usuario_id
  ON cuenta_billetera (usuario_id);

CREATE INDEX IF NOT EXISTS ix_cuenta_billetera_grupo_id
  ON cuenta_billetera (grupo_id);

CREATE INDEX IF NOT EXISTS ix_cuenta_billetera_estado
  ON cuenta_billetera (estado);

CREATE INDEX IF NOT EXISTS ix_saldo_diario_billetera_cuenta_billetera_id
  ON saldo_diario_billetera (cuenta_billetera_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_saldo_diario_billetera_cuenta_billetera_id_fecha
  ON saldo_diario_billetera (cuenta_billetera_id, fecha);

CREATE UNIQUE INDEX IF NOT EXISTS uq_transaccion_billetera_secuencia
  ON transaccion_billetera (secuencia);

CREATE INDEX IF NOT EXISTS ix_transaccion_billetera_tipo
  ON transaccion_billetera (tipo);

CREATE INDEX IF NOT EXISTS ix_transaccion_billetera_estado
  ON transaccion_billetera (estado);

CREATE INDEX IF NOT EXISTS ix_transaccion_billetera_grupo_id
  ON transaccion_billetera (grupo_id);

CREATE INDEX IF NOT EXISTS ix_transaccion_billetera_origen_id
  ON transaccion_billetera (origen_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_transaccion_billetera_clave_idempotencia
  ON transaccion_billetera (clave_idempotencia);

CREATE INDEX IF NOT EXISTS ix_transaccion_billetera_ocurrida_en
  ON transaccion_billetera (ocurrida_en);

CREATE INDEX IF NOT EXISTS ix_movimiento_billetera_transaccion_id
  ON movimiento_billetera (transaccion_id);

CREATE INDEX IF NOT EXISTS ix_movimiento_billetera_cuenta_billetera_id
  ON movimiento_billetera (cuenta_billetera_id);

CREATE INDEX IF NOT EXISTS ix_movimiento_billetera_registrado_en
  ON movimiento_billetera (registrado_en);

CREATE INDEX IF NOT EXISTS ix_retencion_saldo_cuenta_billetera_id
  ON retencion_saldo (cuenta_billetera_id);

CREATE INDEX IF NOT EXISTS ix_retencion_saldo_motivo
  ON retencion_saldo (motivo);

CREATE INDEX IF NOT EXISTS ix_retencion_saldo_estado
  ON retencion_saldo (estado);

CREATE INDEX IF NOT EXISTS ix_retencion_saldo_expira_en
  ON retencion_saldo (expira_en);

CREATE INDEX IF NOT EXISTS ix_reverso_transaccion_transaccion_original_id
  ON reverso_transaccion (transaccion_original_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_reverso_transaccion_transaccion_reverso_id
  ON reverso_transaccion (transaccion_reverso_id);

CREATE INDEX IF NOT EXISTS ix_instrumento_fondeo_usuario_id
  ON instrumento_fondeo (usuario_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_instrumento_fondeo_usuario_id_hash_identificador
  ON instrumento_fondeo (usuario_id, hash_identificador);

CREATE UNIQUE INDEX IF NOT EXISTS uq_punto_atencion_codigo
  ON punto_atencion (codigo);

CREATE INDEX IF NOT EXISTS ix_punto_atencion_estado
  ON punto_atencion (estado);

CREATE INDEX IF NOT EXISTS ix_arqueo_punto_atencion_punto_atencion_id
  ON arqueo_punto_atencion (punto_atencion_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_arqueo_punto_atencion_punto_atencion_id_fecha
  ON arqueo_punto_atencion (punto_atencion_id, fecha);

CREATE INDEX IF NOT EXISTS ix_orden_recarga_cuenta_billetera_id
  ON orden_recarga (cuenta_billetera_id);

CREATE INDEX IF NOT EXISTS ix_orden_recarga_estado
  ON orden_recarga (estado);

CREATE UNIQUE INDEX IF NOT EXISTS uq_orden_recarga_referencia_externa
  ON orden_recarga (referencia_externa);

CREATE UNIQUE INDEX IF NOT EXISTS uq_orden_recarga_clave_idempotencia
  ON orden_recarga (clave_idempotencia);

CREATE INDEX IF NOT EXISTS ix_orden_retiro_cuenta_billetera_id
  ON orden_retiro (cuenta_billetera_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_orden_retiro_retencion_id
  ON orden_retiro (retencion_id);

CREATE INDEX IF NOT EXISTS ix_orden_retiro_estado
  ON orden_retiro (estado);

CREATE UNIQUE INDEX IF NOT EXISTS uq_orden_retiro_referencia_proveedor
  ON orden_retiro (referencia_proveedor);

CREATE UNIQUE INDEX IF NOT EXISTS uq_orden_retiro_clave_idempotencia
  ON orden_retiro (clave_idempotencia);

CREATE UNIQUE INDEX IF NOT EXISTS uq_transferencia_p2p_transaccion_id
  ON transferencia_p2p (transaccion_id);

CREATE INDEX IF NOT EXISTS ix_transferencia_p2p_cuenta_billetera_origen_id
  ON transferencia_p2p (cuenta_billetera_origen_id);

CREATE INDEX IF NOT EXISTS ix_transferencia_p2p_cuenta_billetera_destino_id
  ON transferencia_p2p (cuenta_billetera_destino_id);

CREATE INDEX IF NOT EXISTS ix_movimiento_custodia_cuenta_custodia_id
  ON movimiento_custodia (cuenta_custodia_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_movimiento_custodia_movimiento_bancario_id
  ON movimiento_custodia (movimiento_bancario_id);

CREATE INDEX IF NOT EXISTS ix_movimiento_custodia_fecha_valor
  ON movimiento_custodia (fecha_valor);

CREATE UNIQUE INDEX IF NOT EXISTS uq_movimiento_custodia_referencia_bancaria
  ON movimiento_custodia (referencia_bancaria);

CREATE INDEX IF NOT EXISTS ix_movimiento_custodia_conciliado
  ON movimiento_custodia (conciliado);

CREATE INDEX IF NOT EXISTS ix_conciliacion_custodia_cuenta_custodia_id
  ON conciliacion_custodia (cuenta_custodia_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_conciliacion_custodia_cuenta_custodia_id_fecha
  ON conciliacion_custodia (cuenta_custodia_id, fecha);

CREATE INDEX IF NOT EXISTS ix_conciliacion_custodia_cumple_encaje
  ON conciliacion_custodia (cumple_encaje);

CREATE INDEX IF NOT EXISTS ix_conciliacion_custodia_estado
  ON conciliacion_custodia (estado);

CREATE INDEX IF NOT EXISTS ix_descuadre_custodia_conciliacion_custodia_id
  ON descuadre_custodia (conciliacion_custodia_id);

CREATE INDEX IF NOT EXISTS ix_descuadre_custodia_severidad
  ON descuadre_custodia (severidad);

CREATE INDEX IF NOT EXISTS ix_descuadre_custodia_estado
  ON descuadre_custodia (estado);

CREATE UNIQUE INDEX IF NOT EXISTS uq_limite_operativo_billetera_nivel_debida_diligencia__1da859
  ON limite_operativo_billetera (nivel_debida_diligencia, ventana, concepto);

CREATE INDEX IF NOT EXISTS ix_consumo_limite_cuenta_billetera_id
  ON consumo_limite (cuenta_billetera_id);

CREATE INDEX IF NOT EXISTS ix_consumo_limite_limite_id
  ON consumo_limite (limite_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_consumo_limite_cuenta_billetera_id_limite_id_ventana_inicio
  ON consumo_limite (cuenta_billetera_id, limite_id, ventana_inicio);

CREATE UNIQUE INDEX IF NOT EXISTS uq_regla_antifraude_codigo
  ON regla_antifraude (codigo);

CREATE INDEX IF NOT EXISTS ix_regla_antifraude_activa
  ON regla_antifraude (activa);

CREATE INDEX IF NOT EXISTS ix_evaluacion_antifraude_transaccion_id
  ON evaluacion_antifraude (transaccion_id);

CREATE INDEX IF NOT EXISTS ix_evaluacion_antifraude_cuenta_billetera_id
  ON evaluacion_antifraude (cuenta_billetera_id);

CREATE INDEX IF NOT EXISTS ix_evaluacion_antifraude_puntaje_riesgo
  ON evaluacion_antifraude (puntaje_riesgo);

CREATE INDEX IF NOT EXISTS ix_evaluacion_antifraude_decision
  ON evaluacion_antifraude (decision);

CREATE INDEX IF NOT EXISTS ix_evaluacion_antifraude_evaluada_en
  ON evaluacion_antifraude (evaluada_en);

CREATE INDEX IF NOT EXISTS ix_bloqueo_saldo_cuenta_billetera_id
  ON bloqueo_saldo (cuenta_billetera_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_bloqueo_saldo_numero_oficio
  ON bloqueo_saldo (numero_oficio);

CREATE INDEX IF NOT EXISTS ix_bloqueo_saldo_estado
  ON bloqueo_saldo (estado);

CREATE INDEX IF NOT EXISTS ix_estado_cuenta_billetera_cuenta_billetera_id
  ON estado_cuenta_billetera (cuenta_billetera_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_estado_cuenta_billetera_cuenta_billetera_id_periodo_90febd
  ON estado_cuenta_billetera (cuenta_billetera_id, periodo_hasta, periodo_desde);

CREATE INDEX IF NOT EXISTS ix_certificado_saldo_cuenta_billetera_id
  ON certificado_saldo (cuenta_billetera_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_certificado_saldo_folio
  ON certificado_saldo (folio);

CREATE UNIQUE INDEX IF NOT EXISTS uq_solicitud_cierre_billetera_cuenta_billetera_id
  ON solicitud_cierre_billetera (cuenta_billetera_id);

CREATE INDEX IF NOT EXISTS ix_solicitud_cierre_billetera_estado
  ON solicitud_cierre_billetera (estado);
