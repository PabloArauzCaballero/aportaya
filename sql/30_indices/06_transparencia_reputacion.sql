-- Índices y restricciones de unicidad del módulo 06 — Transparencia y Reputación
-- Generado por scripts/generar_ddl.py — no editar a mano.

CREATE UNIQUE INDEX IF NOT EXISTS uq_modelo_scoring_version
  ON modelo_scoring (version);

CREATE INDEX IF NOT EXISTS ix_peso_factor_modelo_id
  ON peso_factor (modelo_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_peso_factor_modelo_id_codigo_factor
  ON peso_factor (modelo_id, codigo_factor);

CREATE INDEX IF NOT EXISTS ix_regla_impacto_evento_modelo_id
  ON regla_impacto_evento (modelo_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_regla_impacto_evento_modelo_id_tipo_evento
  ON regla_impacto_evento (modelo_id, tipo_evento);

CREATE INDEX IF NOT EXISTS ix_evento_reputacion_usuario_id
  ON evento_reputacion (usuario_id);

CREATE INDEX IF NOT EXISTS ix_evento_reputacion_grupo_id
  ON evento_reputacion (grupo_id);

CREATE INDEX IF NOT EXISTS ix_evento_reputacion_tipo
  ON evento_reputacion (tipo);

CREATE INDEX IF NOT EXISTS ix_evento_reputacion_ocurrido_en
  ON evento_reputacion (ocurrido_en);

CREATE UNIQUE INDEX IF NOT EXISTS uq_puntaje_reputacion_usuario_id
  ON puntaje_reputacion (usuario_id);

CREATE INDEX IF NOT EXISTS ix_puntaje_reputacion_puntaje
  ON puntaje_reputacion (puntaje);

CREATE INDEX IF NOT EXISTS ix_puntaje_reputacion_nivel_confianza
  ON puntaje_reputacion (nivel_confianza);

CREATE INDEX IF NOT EXISTS ix_puntaje_reputacion_proximo_recalculo_en
  ON puntaje_reputacion (proximo_recalculo_en);

CREATE INDEX IF NOT EXISTS ix_componente_score_puntaje_id
  ON componente_score (puntaje_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_componente_score_puntaje_id_codigo_factor
  ON componente_score (puntaje_id, codigo_factor);

CREATE INDEX IF NOT EXISTS ix_snapshot_reputacion_usuario_id
  ON snapshot_reputacion (usuario_id);

CREATE INDEX IF NOT EXISTS ix_snapshot_reputacion_tomado_en
  ON snapshot_reputacion (tomado_en);

CREATE INDEX IF NOT EXISTS ix_certificado_reputacion_usuario_id
  ON certificado_reputacion (usuario_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_certificado_reputacion_snapshot_id
  ON certificado_reputacion (snapshot_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_certificado_reputacion_codigo_verificacion
  ON certificado_reputacion (codigo_verificacion);

CREATE UNIQUE INDEX IF NOT EXISTS uq_insignia_logro_codigo
  ON insignia_logro (codigo);

CREATE INDEX IF NOT EXISTS ix_insignia_otorgada_usuario_id
  ON insignia_otorgada (usuario_id);

CREATE INDEX IF NOT EXISTS ix_metrica_grupo_grupo_id
  ON metrica_grupo (grupo_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_metrica_grupo_grupo_id_periodo_id_codigo
  ON metrica_grupo (grupo_id, periodo_id, codigo);

CREATE INDEX IF NOT EXISTS ix_metrica_grupo_en_alerta
  ON metrica_grupo (en_alerta);

CREATE INDEX IF NOT EXISTS ix_bloque_transparencia_grupo_id
  ON bloque_transparencia (grupo_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_bloque_transparencia_grupo_id_numero_bloque
  ON bloque_transparencia (grupo_id, numero_bloque);

CREATE UNIQUE INDEX IF NOT EXISTS uq_bloque_transparencia_hash_bloque
  ON bloque_transparencia (hash_bloque);

CREATE INDEX IF NOT EXISTS ix_registro_sellado_bloque_id
  ON registro_sellado (bloque_id);

CREATE INDEX IF NOT EXISTS ix_registro_sellado_entidad_id
  ON registro_sellado (entidad_id);

CREATE INDEX IF NOT EXISTS ix_verificacion_publica_referencia_id
  ON verificacion_publica (referencia_id);

CREATE INDEX IF NOT EXISTS ix_resena_participante_grupo_id
  ON resena_participante (grupo_id);

CREATE INDEX IF NOT EXISTS ix_resena_participante_evaluado_usuario_id
  ON resena_participante (evaluado_usuario_id);

CREATE INDEX IF NOT EXISTS ix_alerta_riesgo_ambito_id
  ON alerta_riesgo (ambito_id);

CREATE INDEX IF NOT EXISTS ix_alerta_riesgo_estado
  ON alerta_riesgo (estado);
