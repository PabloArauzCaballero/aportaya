---
tags:
  - moc
  - modulo/13-contabilidad-financiera-y-erp
modulo: "13 — Contabilidad Financiera y ERP"
relaciones_fk: 39
---

# 13 — Contabilidad Financiera y ERP · relaciones

Las **39 claves foráneas** que salen de las tablas de este módulo.

[[_Relaciones|← Todas las relaciones]] · [[Index]]

| Relación | Destino | Cruza | Opcional |
| --- | --- | :-: | :-: |
| [[activo_fijo.categoria_activo_fijo_id → categoria_activo_fijo]] | [[categoria_activo_fijo]] | — | no |
| [[activo_fijo.centro_costo_id → centro_costo]] | [[centro_costo]] | — | sí |
| [[activo_fijo.factura_proveedor_id → factura_proveedor]] | [[factura_proveedor]] | — | sí |
| [[asiento_plantilla.creada_por → usuario]] | [[usuario]] | ↗ 01 | no |
| [[categoria_activo_fijo.cuenta_activo_id → cuenta_contable]] | [[cuenta_contable]] | ↗ 03 | no |
| [[categoria_activo_fijo.cuenta_depreciacion_id → cuenta_contable]] | [[cuenta_contable]] | ↗ 03 | no |
| [[categoria_activo_fijo.cuenta_gasto_depreciacion_id → cuenta_contable]] | [[cuenta_contable]] | ↗ 03 | no |
| [[cierre_periodo_contable.cerrado_por → usuario]] | [[usuario]] | ↗ 01 | no |
| [[cierre_periodo_contable.periodo_contable_id → periodo_contable]] | [[periodo_contable]] | — | no |
| [[cobro_cuenta_por_cobrar.asiento_contable_id → asiento_contable]] | [[asiento_contable]] | ↗ 03 | sí |
| [[cobro_cuenta_por_cobrar.cuenta_por_cobrar_id → cuenta_por_cobrar]] | [[cuenta_por_cobrar]] | — | no |
| [[cuenta_por_cobrar.tercero_comercial_id → tercero_comercial]] | [[tercero_comercial]] | — | sí |
| [[depreciacion_activo.activo_fijo_id → activo_fijo]] | [[activo_fijo]] | — | no |
| [[depreciacion_activo.asiento_contable_id → asiento_contable]] | [[asiento_contable]] | ↗ 03 | sí |
| [[depreciacion_activo.periodo_contable_id → periodo_contable]] | [[periodo_contable]] | — | no |
| [[ejercicio_fiscal.cerrado_por → usuario]] | [[usuario]] | ↗ 01 | sí |
| [[estado_financiero_generado.generado_por → usuario]] | [[usuario]] | ↗ 01 | no |
| [[estado_financiero_generado.periodo_contable_id → periodo_contable]] | [[periodo_contable]] | — | no |
| [[factura_proveedor.aprobada_por → usuario]] | [[usuario]] | ↗ 01 | sí |
| [[factura_proveedor.asiento_contable_id → asiento_contable]] | [[asiento_contable]] | ↗ 03 | sí |
| [[factura_proveedor.centro_costo_id → centro_costo]] | [[centro_costo]] | — | sí |
| [[factura_proveedor.orden_compra_id → orden_compra]] | [[orden_compra]] | — | sí |
| [[factura_proveedor.tercero_comercial_id → tercero_comercial]] | [[tercero_comercial]] | — | no |
| [[linea_plantilla_asiento.cuenta_contable_id → cuenta_contable]] | [[cuenta_contable]] | ↗ 03 | no |
| [[linea_plantilla_asiento.plantilla_id → asiento_plantilla]] | [[asiento_plantilla]] | — | no |
| [[orden_compra.aprobada_por → usuario]] | [[usuario]] | ↗ 01 | sí |
| [[orden_compra.centro_costo_id → centro_costo]] | [[centro_costo]] | — | sí |
| [[orden_compra.tercero_comercial_id → tercero_comercial]] | [[tercero_comercial]] | — | no |
| [[pago_a_proveedor.asiento_contable_id → asiento_contable]] | [[asiento_contable]] | ↗ 03 | sí |
| [[pago_a_proveedor.autorizado_por → usuario]] | [[usuario]] | ↗ 01 | no |
| [[pago_a_proveedor.factura_proveedor_id → factura_proveedor]] | [[factura_proveedor]] | — | no |
| [[partida_presupuestaria.cuenta_contable_id → cuenta_contable]] | [[cuenta_contable]] | ↗ 03 | no |
| [[partida_presupuestaria.periodo_contable_id → periodo_contable]] | [[periodo_contable]] | — | no |
| [[partida_presupuestaria.presupuesto_id → presupuesto]] | [[presupuesto]] | — | no |
| [[periodo_contable.ejercicio_fiscal_id → ejercicio_fiscal]] | [[ejercicio_fiscal]] | — | no |
| [[presupuesto.aprobado_por → usuario]] | [[usuario]] | ↗ 01 | sí |
| [[presupuesto.centro_costo_id → centro_costo]] | [[centro_costo]] | — | no |
| [[presupuesto.ejercicio_fiscal_id → ejercicio_fiscal]] | [[ejercicio_fiscal]] | — | no |
| [[tercero_comercial.cuenta_contable_id → cuenta_contable]] | [[cuenta_contable]] | ↗ 03 | sí |
