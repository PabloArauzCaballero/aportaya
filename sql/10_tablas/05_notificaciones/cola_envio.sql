-- cola_envio · módulo 05 — Notificaciones y Comunicaciones
-- clase de dominio: ColaEnvio
-- Generado por scripts/generar_ddl.py — no editar a mano.

CREATE TABLE IF NOT EXISTS cola_envio (
  id                                 UUID DEFAULT gen_random_uuid() NOT NULL,
  envio_id                           UUID NOT NULL,
  particion                          VARCHAR(20) NOT NULL,
  disponible_en                      TIMESTAMPTZ NOT NULL,
  intentos                           SMALLINT DEFAULT 0 NOT NULL,
  bloqueada_hasta                    TIMESTAMPTZ,
  CONSTRAINT pk_cola_envio PRIMARY KEY (id)
);

COMMENT ON TABLE cola_envio IS 'Módulo 05 — Notificaciones y Comunicaciones. WhatsApp como canal real de cobro, sin spam ni doble aviso';
COMMENT ON COLUMN cola_envio.id IS 'PK';
COMMENT ON COLUMN cola_envio.envio_id IS 'FK, UQ';
COMMENT ON COLUMN cola_envio.particion IS 'IDX';
COMMENT ON COLUMN cola_envio.disponible_en IS 'IDX';
COMMENT ON COLUMN cola_envio.bloqueada_hasta IS 'NULL';
