-- respuesta_entrante · módulo 05 — Notificaciones y Comunicaciones
-- clase de dominio: RespuestaEntrante
-- Generado por scripts/generar_ddl.py — no editar a mano.

CREATE TABLE IF NOT EXISTS respuesta_entrante (
  id                                 UUID DEFAULT gen_random_uuid() NOT NULL,
  canal_vinculado_id                 UUID NOT NULL,
  notificacion_relacionada_id        UUID,
  contenido                          TEXT NOT NULL,
  intencion_detectada                VARCHAR(30) NOT NULL,
  recibida_en                        TIMESTAMPTZ NOT NULL,
  procesada_en                       TIMESTAMPTZ,
  accion_ejecutada                   VARCHAR(120),
  CONSTRAINT pk_respuesta_entrante PRIMARY KEY (id),
  CONSTRAINT ck_respuesta_entrante_intencion_detectada CHECK (intencion_detectada IN ('AYUDA', 'BAJA', 'CONSULTAR_SALDO', 'DESCONOCIDA', 'YA_PAGUE'))
);

COMMENT ON TABLE respuesta_entrante IS 'Módulo 05 — Notificaciones y Comunicaciones. WhatsApp como canal real de cobro, sin spam ni doble aviso';
COMMENT ON COLUMN respuesta_entrante.id IS 'PK';
COMMENT ON COLUMN respuesta_entrante.canal_vinculado_id IS 'FK, IDX';
COMMENT ON COLUMN respuesta_entrante.notificacion_relacionada_id IS 'FK, NULL';
COMMENT ON COLUMN respuesta_entrante.intencion_detectada IS 'CK';
COMMENT ON COLUMN respuesta_entrante.recibida_en IS 'IDX';
COMMENT ON COLUMN respuesta_entrante.procesada_en IS 'NULL';
COMMENT ON COLUMN respuesta_entrante.accion_ejecutada IS 'NULL';
