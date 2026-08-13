-- factor_mfa · módulo 01 — Identidad, Usuarios y Seguridad
-- clase de dominio: FactorMFA
-- Generado por scripts/generar_ddl.py — no editar a mano.

CREATE TABLE IF NOT EXISTS factor_mfa (
  id                                 UUID DEFAULT gen_random_uuid() NOT NULL,
  usuario_id                         UUID NOT NULL,
  tipo                               VARCHAR(20) NOT NULL,
  secreto_cifrado                    VARCHAR(255) NOT NULL,
  activo                             BOOLEAN DEFAULT FALSE NOT NULL,
  es_principal                       BOOLEAN DEFAULT FALSE NOT NULL,
  confirmado_en                      TIMESTAMPTZ,
  ultimo_uso_en                      TIMESTAMPTZ,
  CONSTRAINT pk_factor_mfa PRIMARY KEY (id),
  CONSTRAINT ck_factor_mfa_tipo CHECK (tipo IN ('RESPALDO', 'SMS', 'TOTP', 'WHATSAPP'))
);

COMMENT ON TABLE factor_mfa IS 'Módulo 01 — Identidad, Usuarios y Seguridad. Saber con certeza a quién le estás confiando plata ajena';
COMMENT ON COLUMN factor_mfa.id IS 'PK';
COMMENT ON COLUMN factor_mfa.usuario_id IS 'FK, IDX';
COMMENT ON COLUMN factor_mfa.tipo IS 'CK';
COMMENT ON COLUMN factor_mfa.confirmado_en IS 'NULL';
COMMENT ON COLUMN factor_mfa.ultimo_uso_en IS 'NULL';
