-- cupo · módulo 02 — Grupos, Cupos, Turnos y Gobernanza
-- clase de dominio: Cupo
-- Generado por scripts/generar_ddl.py — no editar a mano.

CREATE TABLE IF NOT EXISTS cupo (
  id                                 UUID DEFAULT gen_random_uuid() NOT NULL,
  grupo_id                           UUID NOT NULL,
  numero                             SMALLINT NOT NULL,
  participante_id                    UUID,
  estado                             VARCHAR(30) NOT NULL,
  fraccion                           NUMERIC(3,2) NOT NULL,
  asignado_en                        TIMESTAMPTZ,
  liberado_en                        TIMESTAMPTZ,
  CONSTRAINT pk_cupo PRIMARY KEY (id),
  CONSTRAINT ck_cupo_estado CHECK (estado IN ('EN_TRASPASO', 'LIBERADO_POR_INCUMPLIMIENTO', 'LIBRE', 'OCUPADO', 'RESERVADO')),
  CONSTRAINT ck_cupo_fraccion CHECK (fraccion > 0 AND fraccion <= 1)
);

COMMENT ON TABLE cupo IS 'Módulo 02 — Grupos, Cupos, Turnos y Gobernanza. Reglas del juego, orden de cobro y decisiones colectivas';
COMMENT ON COLUMN cupo.id IS 'PK';
COMMENT ON COLUMN cupo.grupo_id IS 'FK, IDX';
COMMENT ON COLUMN cupo.numero IS 'UQ+grupo_id';
COMMENT ON COLUMN cupo.participante_id IS 'FK, NULL';
COMMENT ON COLUMN cupo.estado IS 'CK';
COMMENT ON COLUMN cupo.fraccion IS 'CK: > 0 AND <= 1';
COMMENT ON COLUMN cupo.asignado_en IS 'NULL';
COMMENT ON COLUMN cupo.liberado_en IS 'NULL';
