-- Claves foráneas del módulo 13 — Contabilidad Financiera y ERP
-- Generado por scripts/generar_ddl.py — no editar a mano.
-- Se aplican después de crear todas las tablas: el modelo tiene
-- referencias circulares entre módulos.

ALTER TABLE activo_fijo
  ADD CONSTRAINT fk_activo_fijo_categoria_activo_fijo_id
  FOREIGN KEY (categoria_activo_fijo_id) REFERENCES categoria_activo_fijo (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE activo_fijo
  ADD CONSTRAINT fk_activo_fijo_centro_costo_id
  FOREIGN KEY (centro_costo_id) REFERENCES centro_costo (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE activo_fijo
  ADD CONSTRAINT fk_activo_fijo_factura_proveedor_id
  FOREIGN KEY (factura_proveedor_id) REFERENCES factura_proveedor (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE asiento_plantilla
  ADD CONSTRAINT fk_asiento_plantilla_creada_por
  FOREIGN KEY (creada_por) REFERENCES usuario (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE categoria_activo_fijo
  ADD CONSTRAINT fk_categoria_activo_fijo_cuenta_activo_id
  FOREIGN KEY (cuenta_activo_id) REFERENCES cuenta_contable (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE categoria_activo_fijo
  ADD CONSTRAINT fk_categoria_activo_fijo_cuenta_depreciacion_id
  FOREIGN KEY (cuenta_depreciacion_id) REFERENCES cuenta_contable (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE categoria_activo_fijo
  ADD CONSTRAINT fk_categoria_activo_fijo_cuenta_gasto_depreciacion_id
  FOREIGN KEY (cuenta_gasto_depreciacion_id) REFERENCES cuenta_contable (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE cierre_periodo_contable
  ADD CONSTRAINT fk_cierre_periodo_contable_cerrado_por
  FOREIGN KEY (cerrado_por) REFERENCES usuario (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE cierre_periodo_contable
  ADD CONSTRAINT fk_cierre_periodo_contable_periodo_contable_id
  FOREIGN KEY (periodo_contable_id) REFERENCES periodo_contable (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE cobro_cuenta_por_cobrar
  ADD CONSTRAINT fk_cobro_cuenta_por_cobrar_asiento_contable_id
  FOREIGN KEY (asiento_contable_id) REFERENCES asiento_contable (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE cobro_cuenta_por_cobrar
  ADD CONSTRAINT fk_cobro_cuenta_por_cobrar_cuenta_por_cobrar_id
  FOREIGN KEY (cuenta_por_cobrar_id) REFERENCES cuenta_por_cobrar (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE cuenta_por_cobrar
  ADD CONSTRAINT fk_cuenta_por_cobrar_tercero_comercial_id
  FOREIGN KEY (tercero_comercial_id) REFERENCES tercero_comercial (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE depreciacion_activo
  ADD CONSTRAINT fk_depreciacion_activo_activo_fijo_id
  FOREIGN KEY (activo_fijo_id) REFERENCES activo_fijo (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE depreciacion_activo
  ADD CONSTRAINT fk_depreciacion_activo_asiento_contable_id
  FOREIGN KEY (asiento_contable_id) REFERENCES asiento_contable (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE depreciacion_activo
  ADD CONSTRAINT fk_depreciacion_activo_periodo_contable_id
  FOREIGN KEY (periodo_contable_id) REFERENCES periodo_contable (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE ejercicio_fiscal
  ADD CONSTRAINT fk_ejercicio_fiscal_cerrado_por
  FOREIGN KEY (cerrado_por) REFERENCES usuario (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE estado_financiero_generado
  ADD CONSTRAINT fk_estado_financiero_generado_generado_por
  FOREIGN KEY (generado_por) REFERENCES usuario (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE estado_financiero_generado
  ADD CONSTRAINT fk_estado_financiero_generado_periodo_contable_id
  FOREIGN KEY (periodo_contable_id) REFERENCES periodo_contable (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE factura_proveedor
  ADD CONSTRAINT fk_factura_proveedor_aprobada_por
  FOREIGN KEY (aprobada_por) REFERENCES usuario (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE factura_proveedor
  ADD CONSTRAINT fk_factura_proveedor_asiento_contable_id
  FOREIGN KEY (asiento_contable_id) REFERENCES asiento_contable (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE factura_proveedor
  ADD CONSTRAINT fk_factura_proveedor_centro_costo_id
  FOREIGN KEY (centro_costo_id) REFERENCES centro_costo (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE factura_proveedor
  ADD CONSTRAINT fk_factura_proveedor_orden_compra_id
  FOREIGN KEY (orden_compra_id) REFERENCES orden_compra (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE factura_proveedor
  ADD CONSTRAINT fk_factura_proveedor_tercero_comercial_id
  FOREIGN KEY (tercero_comercial_id) REFERENCES tercero_comercial (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE linea_plantilla_asiento
  ADD CONSTRAINT fk_linea_plantilla_asiento_cuenta_contable_id
  FOREIGN KEY (cuenta_contable_id) REFERENCES cuenta_contable (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE linea_plantilla_asiento
  ADD CONSTRAINT fk_linea_plantilla_asiento_plantilla_id
  FOREIGN KEY (plantilla_id) REFERENCES asiento_plantilla (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE orden_compra
  ADD CONSTRAINT fk_orden_compra_aprobada_por
  FOREIGN KEY (aprobada_por) REFERENCES usuario (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE orden_compra
  ADD CONSTRAINT fk_orden_compra_centro_costo_id
  FOREIGN KEY (centro_costo_id) REFERENCES centro_costo (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE orden_compra
  ADD CONSTRAINT fk_orden_compra_tercero_comercial_id
  FOREIGN KEY (tercero_comercial_id) REFERENCES tercero_comercial (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE pago_a_proveedor
  ADD CONSTRAINT fk_pago_a_proveedor_asiento_contable_id
  FOREIGN KEY (asiento_contable_id) REFERENCES asiento_contable (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE pago_a_proveedor
  ADD CONSTRAINT fk_pago_a_proveedor_autorizado_por
  FOREIGN KEY (autorizado_por) REFERENCES usuario (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE pago_a_proveedor
  ADD CONSTRAINT fk_pago_a_proveedor_factura_proveedor_id
  FOREIGN KEY (factura_proveedor_id) REFERENCES factura_proveedor (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE partida_presupuestaria
  ADD CONSTRAINT fk_partida_presupuestaria_cuenta_contable_id
  FOREIGN KEY (cuenta_contable_id) REFERENCES cuenta_contable (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE partida_presupuestaria
  ADD CONSTRAINT fk_partida_presupuestaria_periodo_contable_id
  FOREIGN KEY (periodo_contable_id) REFERENCES periodo_contable (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE partida_presupuestaria
  ADD CONSTRAINT fk_partida_presupuestaria_presupuesto_id
  FOREIGN KEY (presupuesto_id) REFERENCES presupuesto (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE periodo_contable
  ADD CONSTRAINT fk_periodo_contable_ejercicio_fiscal_id
  FOREIGN KEY (ejercicio_fiscal_id) REFERENCES ejercicio_fiscal (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE presupuesto
  ADD CONSTRAINT fk_presupuesto_aprobado_por
  FOREIGN KEY (aprobado_por) REFERENCES usuario (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE presupuesto
  ADD CONSTRAINT fk_presupuesto_centro_costo_id
  FOREIGN KEY (centro_costo_id) REFERENCES centro_costo (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE presupuesto
  ADD CONSTRAINT fk_presupuesto_ejercicio_fiscal_id
  FOREIGN KEY (ejercicio_fiscal_id) REFERENCES ejercicio_fiscal (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE tercero_comercial
  ADD CONSTRAINT fk_tercero_comercial_cuenta_contable_id
  FOREIGN KEY (cuenta_contable_id) REFERENCES cuenta_contable (id) ON DELETE SET NULL ON UPDATE CASCADE;
