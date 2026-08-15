-- Índices y restricciones de unicidad del módulo 03 — Aportes, Pagos QR y Conciliación
-- Generado por scripts/generar_ddl.py — no editar a mano.

CREATE INDEX IF NOT EXISTS ix_obligacion_aporte_grupo_id
  ON obligacion_aporte (grupo_id);

CREATE INDEX IF NOT EXISTS ix_obligacion_aporte_periodo_id
  ON obligacion_aporte (periodo_id);

CREATE INDEX IF NOT EXISTS ix_obligacion_aporte_cupo_id
  ON obligacion_aporte (cupo_id);

CREATE INDEX IF NOT EXISTS ix_obligacion_aporte_participante_id
  ON obligacion_aporte (participante_id);

CREATE INDEX IF NOT EXISTS ix_obligacion_aporte_estado
  ON obligacion_aporte (estado);

CREATE INDEX IF NOT EXISTS ix_obligacion_aporte_fecha_vencimiento
  ON obligacion_aporte (fecha_vencimiento);

CREATE INDEX IF NOT EXISTS ix_plan_regularizacion_participante_id
  ON plan_regularizacion (participante_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_proveedor_pago_codigo
  ON proveedor_pago (codigo);

CREATE INDEX IF NOT EXISTS ix_orden_cobro_obligacion_id
  ON orden_cobro (obligacion_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_orden_cobro_referencia_unica
  ON orden_cobro (referencia_unica);

CREATE INDEX IF NOT EXISTS ix_orden_cobro_estado
  ON orden_cobro (estado);

CREATE INDEX IF NOT EXISTS ix_orden_cobro_expira_en
  ON orden_cobro (expira_en);

CREATE UNIQUE INDEX IF NOT EXISTS uq_qr_cobro_orden_cobro_id
  ON qr_cobro (orden_cobro_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_enlace_pago_rapido_orden_cobro_id
  ON enlace_pago_rapido (orden_cobro_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_enlace_pago_rapido_token_id
  ON enlace_pago_rapido (token_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_enlace_pago_rapido_url_corta
  ON enlace_pago_rapido (url_corta);

CREATE INDEX IF NOT EXISTS ix_intento_pago_orden_cobro_id
  ON intento_pago (orden_cobro_id);

CREATE INDEX IF NOT EXISTS ix_pago_obligacion_id
  ON pago (obligacion_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_pago_intento_pago_id
  ON pago (intento_pago_id);

CREATE INDEX IF NOT EXISTS ix_pago_proveedor_id
  ON pago (proveedor_id);

CREATE INDEX IF NOT EXISTS ix_pago_estado
  ON pago (estado);

CREATE INDEX IF NOT EXISTS ix_pago_fecha_hora_pago
  ON pago (fecha_hora_pago);

CREATE UNIQUE INDEX IF NOT EXISTS uq_pago_proveedor_id_referencia_proveedor
  ON pago (proveedor_id, referencia_proveedor);

CREATE UNIQUE INDEX IF NOT EXISTS uq_comprobante_manual_pago_id
  ON comprobante_manual (pago_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_constancia_pago_pago_id
  ON constancia_pago (pago_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_constancia_pago_codigo_verificacion
  ON constancia_pago (codigo_verificacion);

CREATE INDEX IF NOT EXISTS ix_reembolso_pago_id
  ON reembolso (pago_id);

CREATE INDEX IF NOT EXISTS ix_disputa_pago_pago_id
  ON disputa_pago (pago_id);

CREATE INDEX IF NOT EXISTS ix_movimiento_bancario_extracto_id
  ON movimiento_bancario (extracto_id);

CREATE INDEX IF NOT EXISTS ix_movimiento_bancario_fecha_movimiento
  ON movimiento_bancario (fecha_movimiento);

CREATE INDEX IF NOT EXISTS ix_movimiento_bancario_glosa
  ON movimiento_bancario (glosa);

CREATE UNIQUE INDEX IF NOT EXISTS uq_movimiento_bancario_extracto_id_referencia_banco
  ON movimiento_bancario (extracto_id, referencia_banco);

CREATE INDEX IF NOT EXISTS ix_movimiento_bancario_conciliado
  ON movimiento_bancario (conciliado);

CREATE UNIQUE INDEX IF NOT EXISTS uq_conciliacion_pago_id
  ON conciliacion (pago_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_conciliacion_movimiento_bancario_id
  ON conciliacion (movimiento_bancario_id);

CREATE INDEX IF NOT EXISTS ix_conciliacion_estado
  ON conciliacion (estado);

CREATE INDEX IF NOT EXISTS ix_excepcion_conciliacion_conciliacion_id
  ON excepcion_conciliacion (conciliacion_id);

CREATE INDEX IF NOT EXISTS ix_excepcion_conciliacion_estado
  ON excepcion_conciliacion (estado);

CREATE INDEX IF NOT EXISTS ix_webhook_pasarela_proveedor_id
  ON webhook_pasarela (proveedor_id);

CREATE INDEX IF NOT EXISTS ix_webhook_pasarela_recibido_en
  ON webhook_pasarela (recibido_en);

CREATE INDEX IF NOT EXISTS ix_webhook_pasarela_estado
  ON webhook_pasarela (estado);

CREATE UNIQUE INDEX IF NOT EXISTS uq_tipo_cambio_moneda_destino_fecha_moneda_origen
  ON tipo_cambio (moneda_destino, fecha, moneda_origen);

CREATE INDEX IF NOT EXISTS ix_tipo_cambio_fecha
  ON tipo_cambio (fecha);

CREATE UNIQUE INDEX IF NOT EXISTS uq_cuenta_contable_codigo
  ON cuenta_contable (codigo);

CREATE INDEX IF NOT EXISTS ix_cuenta_contable_cuenta_padre_id
  ON cuenta_contable (cuenta_padre_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_asiento_contable_numero
  ON asiento_contable (numero);

CREATE INDEX IF NOT EXISTS ix_asiento_contable_fecha
  ON asiento_contable (fecha);

CREATE INDEX IF NOT EXISTS ix_asiento_contable_origen_id
  ON asiento_contable (origen_id);

CREATE INDEX IF NOT EXISTS ix_asiento_contable_grupo_id
  ON asiento_contable (grupo_id);

CREATE INDEX IF NOT EXISTS ix_asiento_contable_periodo_contable_id
  ON asiento_contable (periodo_contable_id);

CREATE INDEX IF NOT EXISTS ix_movimiento_contable_asiento_id
  ON movimiento_contable (asiento_id);

CREATE INDEX IF NOT EXISTS ix_movimiento_contable_cuenta_id
  ON movimiento_contable (cuenta_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_cierre_diario_fecha
  ON cierre_diario (fecha);
