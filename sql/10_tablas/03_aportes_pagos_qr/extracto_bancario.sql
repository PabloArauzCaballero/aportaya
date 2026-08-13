-- extracto_bancario · módulo 03 — Aportes, Pagos QR y Conciliación
-- clase de dominio: ExtractoBancario
-- Generado por scripts/generar_ddl.py — no editar a mano.

CREATE TABLE IF NOT EXISTS extracto_bancario (
  id                                 UUID DEFAULT gen_random_uuid() NOT NULL,
  proveedor_id                       UUID NOT NULL,
  cuenta                             VARCHAR(40) NOT NULL,
  fecha_desde                        DATE NOT NULL,
  fecha_hasta                        DATE NOT NULL,
  saldo_inicial                      NUMERIC(14,2) DEFAULT 0 NOT NULL,
  saldo_final                        NUMERIC(14,2) DEFAULT 0 NOT NULL,
  archivo_url                        VARCHAR(255) NOT NULL,
  importado_en                       TIMESTAMPTZ NOT NULL,
  importado_por                      UUID NOT NULL,
  CONSTRAINT pk_extracto_bancario PRIMARY KEY (id)
);

COMMENT ON TABLE extracto_bancario IS 'Módulo 03 — Aportes, Pagos QR y Conciliación. Que "pagué" signifique "el banco lo confirmó"';
COMMENT ON COLUMN extracto_bancario.id IS 'PK';
COMMENT ON COLUMN extracto_bancario.proveedor_id IS 'FK';
COMMENT ON COLUMN extracto_bancario.importado_por IS 'FK';
