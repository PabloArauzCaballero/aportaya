-- voto_participante · módulo 02 — Grupos, Cupos, Turnos y Gobernanza
-- clase de dominio: VotoParticipante
-- Generado por scripts/generar_ddl.py — no editar a mano.

CREATE TABLE IF NOT EXISTS voto_participante (
  id                                 UUID DEFAULT gen_random_uuid() NOT NULL,
  acuerdo_id                         UUID NOT NULL,
  participante_id                    UUID NOT NULL,
  sentido                            VARCHAR(12) NOT NULL,
  peso                               NUMERIC(4,2) NOT NULL,
  comentario                         VARCHAR(300),
  emitido_en                         TIMESTAMPTZ DEFAULT now() NOT NULL,
  CONSTRAINT pk_voto_participante PRIMARY KEY (id),
  CONSTRAINT ck_voto_participante_sentido CHECK (sentido IN ('ABSTENCION', 'A_FAVOR', 'EN_CONTRA'))
);

COMMENT ON TABLE voto_participante IS 'Módulo 02 — Grupos, Cupos, Turnos y Gobernanza. Reglas del juego, orden de cobro y decisiones colectivas';
COMMENT ON COLUMN voto_participante.id IS 'PK';
COMMENT ON COLUMN voto_participante.acuerdo_id IS 'FK, IDX';
COMMENT ON COLUMN voto_participante.participante_id IS 'FK';
COMMENT ON COLUMN voto_participante.sentido IS 'CK';
COMMENT ON COLUMN voto_participante.comentario IS 'NULL';
