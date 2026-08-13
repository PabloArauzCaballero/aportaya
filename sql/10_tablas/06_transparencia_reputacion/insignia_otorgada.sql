-- insignia_otorgada · módulo 06 — Transparencia y Reputación
-- clase de dominio: InsigniaOtorgada
-- Generado por scripts/generar_ddl.py — no editar a mano.

CREATE TABLE IF NOT EXISTS insignia_otorgada (
  id                                 UUID DEFAULT gen_random_uuid() NOT NULL,
  usuario_id                         UUID NOT NULL,
  insignia_id                        UUID NOT NULL,
  otorgada_en                        TIMESTAMPTZ NOT NULL,
  revocada_en                        TIMESTAMPTZ,
  motivo_revocacion                  VARCHAR(160),
  CONSTRAINT pk_insignia_otorgada PRIMARY KEY (id)
);

COMMENT ON TABLE insignia_otorgada IS 'Módulo 06 — Transparencia y Reputación. Que nadie tenga que "creerle" al organizador';
COMMENT ON COLUMN insignia_otorgada.id IS 'PK';
COMMENT ON COLUMN insignia_otorgada.usuario_id IS 'FK, IDX';
COMMENT ON COLUMN insignia_otorgada.insignia_id IS 'FK';
COMMENT ON COLUMN insignia_otorgada.revocada_en IS 'NULL';
COMMENT ON COLUMN insignia_otorgada.motivo_revocacion IS 'NULL';
