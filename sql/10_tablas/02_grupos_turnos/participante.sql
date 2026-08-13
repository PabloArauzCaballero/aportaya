-- participante · módulo 02 — Grupos, Cupos, Turnos y Gobernanza
-- clase de dominio: Participante
-- Generado por scripts/generar_ddl.py — no editar a mano.

CREATE TABLE IF NOT EXISTS participante (
  id                                 UUID DEFAULT gen_random_uuid() NOT NULL,
  grupo_id                           UUID NOT NULL,
  usuario_id                         UUID NOT NULL,
  alias                              VARCHAR(60),
  estado                             VARCHAR(30) NOT NULL,
  es_organizador                     BOOLEAN DEFAULT FALSE NOT NULL,
  invitado_por_id                    UUID,
  fecha_ingreso                      TIMESTAMPTZ DEFAULT now() NOT NULL,
  fecha_salida                       TIMESTAMPTZ,
  motivo_salida                      VARCHAR(160),
  reputacion_al_ingresar             NUMERIC(6,2) NOT NULL,
  aportes_realizados                 SMALLINT NOT NULL,
  aportes_en_mora                    SMALLINT NOT NULL,
  CONSTRAINT pk_participante PRIMARY KEY (id),
  CONSTRAINT ck_participante_estado CHECK (estado IN ('ACEPTADO_PENDIENTE_FIRMA', 'ACTIVO', 'EN_MORA', 'EXPULSADO', 'INVITADO', 'POSTULANTE', 'REEMPLAZADO', 'RETIRADO', 'SUSPENDIDO'))
);

COMMENT ON TABLE participante IS 'Módulo 02 — Grupos, Cupos, Turnos y Gobernanza. Reglas del juego, orden de cobro y decisiones colectivas';
COMMENT ON COLUMN participante.id IS 'PK';
COMMENT ON COLUMN participante.grupo_id IS 'FK, IDX';
COMMENT ON COLUMN participante.usuario_id IS 'FK, IDX';
COMMENT ON COLUMN participante.alias IS 'NULL';
COMMENT ON COLUMN participante.estado IS 'CK, IDX';
COMMENT ON COLUMN participante.invitado_por_id IS 'FK, NULL';
COMMENT ON COLUMN participante.fecha_salida IS 'NULL';
COMMENT ON COLUMN participante.motivo_salida IS 'NULL';
