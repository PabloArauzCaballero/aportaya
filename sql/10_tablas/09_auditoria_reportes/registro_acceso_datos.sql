-- registro_acceso_datos · módulo 09 — Auditoría, Reportes y Cumplimiento
-- clase de dominio: RegistroAccesoDatos
-- APPEND-ONLY: sin UPDATE ni DELETE (ver sql/40_reglas)
-- Generado por scripts/generar_ddl.py — no editar a mano.

CREATE TABLE IF NOT EXISTS registro_acceso_datos (
  id                                 UUID DEFAULT gen_random_uuid() NOT NULL,
  usuario_consultor_id               UUID NOT NULL,
  usuario_afectado_id                UUID NOT NULL,
  tipo_dato                          VARCHAR(30) NOT NULL,
  operacion                          VARCHAR(15) NOT NULL,
  justificacion                      VARCHAR(300),
  ticket_soporte_id                  VARCHAR(30),
  cantidad_registros                 INTEGER DEFAULT 0 NOT NULL,
  ip_origen                          INET NOT NULL,
  fecha_hora                         TIMESTAMPTZ NOT NULL,
  CONSTRAINT pk_registro_acceso_datos PRIMARY KEY (id),
  CONSTRAINT ck_registro_acceso_datos_tipo_dato CHECK (tipo_dato IN ('CUENTA_BANCARIA', 'DOCUMENTO_IDENTIDAD', 'HISTORIAL_PAGOS', 'TELEFONO')),
  CONSTRAINT ck_registro_acceso_datos_operacion CHECK (operacion IN ('BUSQUEDA', 'EXPORTACION', 'LECTURA'))
);

COMMENT ON TABLE registro_acceso_datos IS 'Módulo 09 — Auditoría, Reportes y Cumplimiento. [append-only] Poder demostrar todo lo anterior ante un reclamo o un regulador';
COMMENT ON COLUMN registro_acceso_datos.id IS 'PK';
COMMENT ON COLUMN registro_acceso_datos.usuario_consultor_id IS 'FK, IDX';
COMMENT ON COLUMN registro_acceso_datos.usuario_afectado_id IS 'FK, IDX';
COMMENT ON COLUMN registro_acceso_datos.tipo_dato IS 'CK';
COMMENT ON COLUMN registro_acceso_datos.operacion IS 'CK';
COMMENT ON COLUMN registro_acceso_datos.justificacion IS 'NULL';
COMMENT ON COLUMN registro_acceso_datos.ticket_soporte_id IS 'NULL';
COMMENT ON COLUMN registro_acceso_datos.fecha_hora IS 'IDX';
