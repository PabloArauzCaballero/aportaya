-- evento_dominio · módulo 09 — Auditoría, Reportes y Cumplimiento
-- clase de dominio: EventoDominio
-- APPEND-ONLY: sin UPDATE ni DELETE (ver sql/40_reglas)
-- Generado por scripts/generar_ddl.py — no editar a mano.

CREATE TABLE IF NOT EXISTS evento_dominio (
  id                                 UUID DEFAULT gen_random_uuid() NOT NULL,
  tipo                               VARCHAR(60) NOT NULL,
  version                            VARCHAR(10) NOT NULL,
  agregado                           VARCHAR(40) NOT NULL,
  agregado_id                        UUID NOT NULL,
  payload                            JSONB NOT NULL,
  metadatos                          JSONB NOT NULL,
  correlation_id                     UUID NOT NULL,
  causation_id                       UUID,
  ocurrido_en                        TIMESTAMPTZ NOT NULL,
  publicado_en                       TIMESTAMPTZ,
  estado                             VARCHAR(15) NOT NULL,
  intentos                           SMALLINT DEFAULT 0 NOT NULL,
  CONSTRAINT pk_evento_dominio PRIMARY KEY (id),
  CONSTRAINT ck_evento_dominio_estado CHECK (estado IN ('FALLIDO', 'PENDIENTE', 'PUBLICADO'))
);

COMMENT ON TABLE evento_dominio IS 'Módulo 09 — Auditoría, Reportes y Cumplimiento. [append-only] Poder demostrar todo lo anterior ante un reclamo o un regulador';
COMMENT ON COLUMN evento_dominio.id IS 'PK';
COMMENT ON COLUMN evento_dominio.tipo IS 'IDX';
COMMENT ON COLUMN evento_dominio.agregado_id IS 'IDX';
COMMENT ON COLUMN evento_dominio.correlation_id IS 'IDX';
COMMENT ON COLUMN evento_dominio.causation_id IS 'NULL';
COMMENT ON COLUMN evento_dominio.ocurrido_en IS 'IDX';
COMMENT ON COLUMN evento_dominio.publicado_en IS 'NULL';
COMMENT ON COLUMN evento_dominio.estado IS 'CK, IDX';
