-- Índices y restricciones de unicidad del módulo 04 — Entregas de Fondo
-- Generado por scripts/generar_ddl.py — no editar a mano.

CREATE INDEX IF NOT EXISTS ix_entrega_fondo_grupo_id
  ON entrega_fondo (grupo_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_entrega_fondo_periodo_id
  ON entrega_fondo (periodo_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_entrega_fondo_turno_id
  ON entrega_fondo (turno_id);

CREATE INDEX IF NOT EXISTS ix_entrega_fondo_beneficiario_participante_id
  ON entrega_fondo (beneficiario_participante_id);

CREATE INDEX IF NOT EXISTS ix_entrega_fondo_estado
  ON entrega_fondo (estado);

CREATE INDEX IF NOT EXISTS ix_entrega_fondo_fecha_programada
  ON entrega_fondo (fecha_programada);

CREATE INDEX IF NOT EXISTS ix_deduccion_entrega_entrega_id
  ON deduccion_entrega (entrega_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_regla_entrega_codigo
  ON regla_entrega (codigo);

CREATE INDEX IF NOT EXISTS ix_validacion_pre_entrega_entrega_id
  ON validacion_pre_entrega (entrega_id);

CREATE INDEX IF NOT EXISTS ix_cuenta_bancaria_beneficiario_usuario_id
  ON cuenta_bancaria_beneficiario (usuario_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_cuenta_bancaria_beneficiario_usuario_id_hash_numero_cuenta
  ON cuenta_bancaria_beneficiario (usuario_id, hash_numero_cuenta);

CREATE INDEX IF NOT EXISTS ix_orden_desembolso_entrega_id
  ON orden_desembolso (entrega_id);

CREATE INDEX IF NOT EXISTS ix_orden_desembolso_estado
  ON orden_desembolso (estado);

CREATE UNIQUE INDEX IF NOT EXISTS uq_orden_desembolso_referencia_proveedor
  ON orden_desembolso (referencia_proveedor);

CREATE UNIQUE INDEX IF NOT EXISTS uq_orden_desembolso_clave_idempotencia
  ON orden_desembolso (clave_idempotencia);

CREATE INDEX IF NOT EXISTS ix_intento_desembolso_orden_desembolso_id
  ON intento_desembolso (orden_desembolso_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_confirmacion_recepcion_entrega_id
  ON confirmacion_recepcion (entrega_id);

CREATE INDEX IF NOT EXISTS ix_confirmacion_recepcion_estado
  ON confirmacion_recepcion (estado);

CREATE INDEX IF NOT EXISTS ix_confirmacion_recepcion_plazo_limite
  ON confirmacion_recepcion (plazo_limite);

CREATE INDEX IF NOT EXISTS ix_incidencia_entrega_entrega_id
  ON incidencia_entrega (entrega_id);

CREATE INDEX IF NOT EXISTS ix_incidencia_entrega_estado
  ON incidencia_entrega (estado);

CREATE INDEX IF NOT EXISTS ix_incidencia_entrega_fecha_limite_sla
  ON incidencia_entrega (fecha_limite_sla);

CREATE INDEX IF NOT EXISTS ix_historial_estado_entrega_entrega_id
  ON historial_estado_entrega (entrega_id);
