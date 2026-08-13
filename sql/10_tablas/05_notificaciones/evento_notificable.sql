-- evento_notificable · módulo 05 — Notificaciones y Comunicaciones
-- clase de dominio: EventoNotificable
-- Generado por scripts/generar_ddl.py — no editar a mano.

CREATE TABLE IF NOT EXISTS evento_notificable (
  id                                 UUID DEFAULT gen_random_uuid() NOT NULL,
  tipo                               VARCHAR(40) NOT NULL,
  descripcion                        VARCHAR(200) NOT NULL,
  prioridad                          VARCHAR(10) NOT NULL,
  es_transaccional                   BOOLEAN DEFAULT FALSE NOT NULL,
  permite_agrupacion                 BOOLEAN DEFAULT FALSE NOT NULL,
  ventana_deduplicacion_min          SMALLINT NOT NULL,
  canales_permitidos                 VARCHAR(120) NOT NULL,
  cadena_respaldo                    VARCHAR(120) NOT NULL,
  activo                             BOOLEAN DEFAULT FALSE NOT NULL,
  CONSTRAINT pk_evento_notificable PRIMARY KEY (id),
  CONSTRAINT ck_evento_notificable_prioridad CHECK (prioridad IN ('ALTA', 'BAJA', 'CRITICA', 'NORMAL'))
);

COMMENT ON TABLE evento_notificable IS 'Módulo 05 — Notificaciones y Comunicaciones. WhatsApp como canal real de cobro, sin spam ni doble aviso';
COMMENT ON COLUMN evento_notificable.id IS 'PK';
COMMENT ON COLUMN evento_notificable.tipo IS 'UQ';
COMMENT ON COLUMN evento_notificable.prioridad IS 'CK';
