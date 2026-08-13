-- periodo · módulo 02 — Grupos, Cupos, Turnos y Gobernanza
-- clase de dominio: Periodo
-- Generado por scripts/generar_ddl.py — no editar a mano.

CREATE TABLE IF NOT EXISTS periodo (
  id                                 UUID DEFAULT gen_random_uuid() NOT NULL,
  grupo_id                           UUID NOT NULL,
  numero                             SMALLINT NOT NULL,
  fecha_inicio                       DATE NOT NULL,
  fecha_limite_pago                  DATE NOT NULL,
  fecha_fin_gracia                   DATE NOT NULL,
  fecha_entrega_prevista             DATE NOT NULL,
  estado                             VARCHAR(15) NOT NULL,
  monto_objetivo                     NUMERIC(14,2) DEFAULT 0 NOT NULL,
  monto_recaudado                    NUMERIC(14,2) DEFAULT 0 NOT NULL,
  cupos_morosos                      SMALLINT NOT NULL,
  CONSTRAINT pk_periodo PRIMARY KEY (id),
  CONSTRAINT ck_periodo_estado CHECK (estado IN ('ABIERTO', 'CANCELADO', 'CERRADO', 'EN_GRACIA', 'LIQUIDADO', 'PROGRAMADO'))
);

COMMENT ON TABLE periodo IS 'Módulo 02 — Grupos, Cupos, Turnos y Gobernanza. Reglas del juego, orden de cobro y decisiones colectivas';
COMMENT ON COLUMN periodo.id IS 'PK';
COMMENT ON COLUMN periodo.grupo_id IS 'FK, IDX';
COMMENT ON COLUMN periodo.numero IS 'UQ+grupo_id';
COMMENT ON COLUMN periodo.fecha_limite_pago IS 'IDX';
COMMENT ON COLUMN periodo.estado IS 'CK, IDX';
