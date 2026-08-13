-- Índices y restricciones de unicidad del módulo 02 — Grupos, Cupos, Turnos y Gobernanza
-- Generado por scripts/generar_ddl.py — no editar a mano.

CREATE UNIQUE INDEX IF NOT EXISTS uq_grupo_codigo_publico
  ON grupo (codigo_publico);

CREATE INDEX IF NOT EXISTS ix_grupo_estado
  ON grupo (estado);

CREATE INDEX IF NOT EXISTS ix_reglamento_grupo_grupo_id
  ON reglamento_grupo (grupo_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_reglamento_grupo_grupo_id_version
  ON reglamento_grupo (grupo_id, version);

CREATE INDEX IF NOT EXISTS ix_historial_estado_grupo_grupo_id
  ON historial_estado_grupo (grupo_id);

CREATE INDEX IF NOT EXISTS ix_participante_grupo_id
  ON participante (grupo_id);

CREATE INDEX IF NOT EXISTS ix_participante_usuario_id
  ON participante (usuario_id);

CREATE INDEX IF NOT EXISTS ix_participante_estado
  ON participante (estado);

CREATE INDEX IF NOT EXISTS ix_cupo_grupo_id
  ON cupo (grupo_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_cupo_grupo_id_numero
  ON cupo (grupo_id, numero);

CREATE INDEX IF NOT EXISTS ix_traspaso_cupo_cupo_id
  ON traspaso_cupo (cupo_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_solicitud_retiro_participante_id
  ON solicitud_retiro (participante_id);

CREATE INDEX IF NOT EXISTS ix_solicitud_ingreso_grupo_id
  ON solicitud_ingreso (grupo_id);

CREATE INDEX IF NOT EXISTS ix_solicitud_ingreso_usuario_id
  ON solicitud_ingreso (usuario_id);

CREATE INDEX IF NOT EXISTS ix_invitacion_grupo_id
  ON invitacion (grupo_id);

CREATE INDEX IF NOT EXISTS ix_invitacion_telefono_invitado
  ON invitacion (telefono_invitado);

CREATE UNIQUE INDEX IF NOT EXISTS uq_invitacion_token_id
  ON invitacion (token_id);

CREATE INDEX IF NOT EXISTS ix_periodo_grupo_id
  ON periodo (grupo_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_periodo_grupo_id_numero
  ON periodo (grupo_id, numero);

CREATE INDEX IF NOT EXISTS ix_periodo_fecha_limite_pago
  ON periodo (fecha_limite_pago);

CREATE INDEX IF NOT EXISTS ix_periodo_estado
  ON periodo (estado);

CREATE INDEX IF NOT EXISTS ix_turno_grupo_id
  ON turno (grupo_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_turno_grupo_id_orden_asignado
  ON turno (grupo_id, orden_asignado);

CREATE UNIQUE INDEX IF NOT EXISTS uq_sorteo_turnos_grupo_id
  ON sorteo_turnos (grupo_id);

CREATE INDEX IF NOT EXISTS ix_solicitud_permuta_turno_origen_id
  ON solicitud_permuta (turno_origen_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_dia_no_habil_alcance_grupo_id_fecha
  ON dia_no_habil (alcance, grupo_id, fecha);

CREATE INDEX IF NOT EXISTS ix_postulacion_emparejamiento_usuario_id
  ON postulacion_emparejamiento (usuario_id);

CREATE INDEX IF NOT EXISTS ix_postulacion_emparejamiento_estado
  ON postulacion_emparejamiento (estado);

CREATE INDEX IF NOT EXISTS ix_acuerdo_grupo_id
  ON acuerdo (grupo_id);

CREATE INDEX IF NOT EXISTS ix_voto_participante_acuerdo_id
  ON voto_participante (acuerdo_id);
