-- Índices y restricciones de unicidad del módulo 07 — Organizador y Automatización
-- Generado por scripts/generar_ddl.py — no editar a mano.

CREATE UNIQUE INDEX IF NOT EXISTS uq_organizador_usuario_id
  ON organizador (usuario_id);

CREATE INDEX IF NOT EXISTS ix_organizador_estado
  ON organizador (estado);

CREATE INDEX IF NOT EXISTS ix_solicitud_organizador_usuario_id
  ON solicitud_organizador (usuario_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_requisito_habilitacion_codigo
  ON requisito_habilitacion (codigo);

CREATE INDEX IF NOT EXISTS ix_capacitacion_organizador_organizador_id
  ON capacitacion_organizador (organizador_id);

CREATE INDEX IF NOT EXISTS ix_contrato_organizador_organizador_id
  ON contrato_organizador (organizador_id);

CREATE INDEX IF NOT EXISTS ix_evaluacion_desempeno_organizador_id
  ON evaluacion_desempeno (organizador_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_evaluacion_desempeno_organizador_id_periodo_evaluado
  ON evaluacion_desempeno (organizador_id, periodo_evaluado);

CREATE INDEX IF NOT EXISTS ix_metrica_organizador_evaluacion_id
  ON metrica_organizador (evaluacion_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_metrica_organizador_evaluacion_id_codigo
  ON metrica_organizador (evaluacion_id, codigo);

CREATE INDEX IF NOT EXISTS ix_sancion_organizador_organizador_id
  ON sancion_organizador (organizador_id);

CREATE INDEX IF NOT EXISTS ix_sancion_organizador_estado
  ON sancion_organizador (estado);

CREATE UNIQUE INDEX IF NOT EXISTS uq_apelacion_sancion_org_sancion_organizador_id
  ON apelacion_sancion_org (sancion_organizador_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_regla_automatizacion_codigo
  ON regla_automatizacion (codigo);

CREATE INDEX IF NOT EXISTS ix_tarea_automatizada_regla_id
  ON tarea_automatizada (regla_id);

CREATE INDEX IF NOT EXISTS ix_tarea_automatizada_grupo_id
  ON tarea_automatizada (grupo_id);

CREATE INDEX IF NOT EXISTS ix_tarea_automatizada_programada_para
  ON tarea_automatizada (programada_para);

CREATE INDEX IF NOT EXISTS ix_tarea_automatizada_estado
  ON tarea_automatizada (estado);

CREATE INDEX IF NOT EXISTS ix_ejecucion_tarea_tarea_id
  ON ejecucion_tarea (tarea_id);
