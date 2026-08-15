-- Índices y restricciones de unicidad del módulo 13 — Contabilidad Financiera y ERP
-- Generado por scripts/generar_ddl.py — no editar a mano.

CREATE UNIQUE INDEX IF NOT EXISTS uq_ejercicio_fiscal_anio
  ON ejercicio_fiscal (anio);

CREATE INDEX IF NOT EXISTS ix_ejercicio_fiscal_estado
  ON ejercicio_fiscal (estado);

CREATE INDEX IF NOT EXISTS ix_periodo_contable_ejercicio_fiscal_id
  ON periodo_contable (ejercicio_fiscal_id);

CREATE INDEX IF NOT EXISTS ix_periodo_contable_estado
  ON periodo_contable (estado);

CREATE UNIQUE INDEX IF NOT EXISTS uq_cierre_periodo_contable_periodo_contable_id
  ON cierre_periodo_contable (periodo_contable_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_centro_costo_codigo
  ON centro_costo (codigo);

CREATE INDEX IF NOT EXISTS ix_presupuesto_centro_costo_id
  ON presupuesto (centro_costo_id);

CREATE INDEX IF NOT EXISTS ix_presupuesto_ejercicio_fiscal_id
  ON presupuesto (ejercicio_fiscal_id);

CREATE INDEX IF NOT EXISTS ix_presupuesto_estado
  ON presupuesto (estado);

CREATE INDEX IF NOT EXISTS ix_partida_presupuestaria_presupuesto_id
  ON partida_presupuestaria (presupuesto_id);

CREATE INDEX IF NOT EXISTS ix_partida_presupuestaria_cuenta_contable_id
  ON partida_presupuestaria (cuenta_contable_id);

CREATE INDEX IF NOT EXISTS ix_partida_presupuestaria_periodo_contable_id
  ON partida_presupuestaria (periodo_contable_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_tercero_comercial_numero_documento
  ON tercero_comercial (numero_documento);

CREATE INDEX IF NOT EXISTS ix_tercero_comercial_cuenta_contable_id
  ON tercero_comercial (cuenta_contable_id);

CREATE INDEX IF NOT EXISTS ix_tercero_comercial_estado
  ON tercero_comercial (estado);

CREATE INDEX IF NOT EXISTS ix_orden_compra_tercero_comercial_id
  ON orden_compra (tercero_comercial_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_orden_compra_numero
  ON orden_compra (numero);

CREATE INDEX IF NOT EXISTS ix_orden_compra_estado
  ON orden_compra (estado);

CREATE INDEX IF NOT EXISTS ix_factura_proveedor_tercero_comercial_id
  ON factura_proveedor (tercero_comercial_id);

CREATE INDEX IF NOT EXISTS ix_factura_proveedor_orden_compra_id
  ON factura_proveedor (orden_compra_id);

CREATE INDEX IF NOT EXISTS ix_factura_proveedor_estado
  ON factura_proveedor (estado);

CREATE INDEX IF NOT EXISTS ix_pago_a_proveedor_factura_proveedor_id
  ON pago_a_proveedor (factura_proveedor_id);

CREATE INDEX IF NOT EXISTS ix_cuenta_por_cobrar_origen_tipo
  ON cuenta_por_cobrar (origen_tipo);

CREATE INDEX IF NOT EXISTS ix_cuenta_por_cobrar_origen_id
  ON cuenta_por_cobrar (origen_id);

CREATE INDEX IF NOT EXISTS ix_cuenta_por_cobrar_tercero_comercial_id
  ON cuenta_por_cobrar (tercero_comercial_id);

CREATE INDEX IF NOT EXISTS ix_cuenta_por_cobrar_estado
  ON cuenta_por_cobrar (estado);

CREATE INDEX IF NOT EXISTS ix_cobro_cuenta_por_cobrar_cuenta_por_cobrar_id
  ON cobro_cuenta_por_cobrar (cuenta_por_cobrar_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_categoria_activo_fijo_codigo
  ON categoria_activo_fijo (codigo);

CREATE INDEX IF NOT EXISTS ix_activo_fijo_categoria_activo_fijo_id
  ON activo_fijo (categoria_activo_fijo_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_activo_fijo_codigo_inventario
  ON activo_fijo (codigo_inventario);

CREATE INDEX IF NOT EXISTS ix_activo_fijo_estado
  ON activo_fijo (estado);

CREATE INDEX IF NOT EXISTS ix_depreciacion_activo_activo_fijo_id
  ON depreciacion_activo (activo_fijo_id);

CREATE INDEX IF NOT EXISTS ix_depreciacion_activo_periodo_contable_id
  ON depreciacion_activo (periodo_contable_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_asiento_plantilla_codigo
  ON asiento_plantilla (codigo);

CREATE INDEX IF NOT EXISTS ix_linea_plantilla_asiento_plantilla_id
  ON linea_plantilla_asiento (plantilla_id);

CREATE INDEX IF NOT EXISTS ix_linea_plantilla_asiento_cuenta_contable_id
  ON linea_plantilla_asiento (cuenta_contable_id);

CREATE INDEX IF NOT EXISTS ix_estado_financiero_generado_periodo_contable_id
  ON estado_financiero_generado (periodo_contable_id);
