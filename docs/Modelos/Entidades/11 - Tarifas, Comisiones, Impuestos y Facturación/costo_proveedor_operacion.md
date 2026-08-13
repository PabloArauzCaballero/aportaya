---
tags:
  - entidad
  - modulo/11-tarifas-comisiones-impuestos-y-facturacion
tabla: costo_proveedor_operacion
clase: CostoProveedorOperacion
modulo: "11 — Tarifas, Comisiones, Impuestos y Facturación"
estereotipo: Objeto de valor
clave_primaria: [id]
columnas: 12
fk_salientes: 3
fk_entrantes: 0
append_only: false
---

# `costo_proveedor_operacion`

> Módulo [[11_tarifas_comisiones|11 — Tarifas, Comisiones, Impuestos y Facturación]] · clase `CostoProveedorOperacion` · Objeto de valor

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `proveedor_id` | UUID | FK IDX | no | FK, IDX, M3 |
| `transaccion_id` | UUID | FK | sí | FK, NULL, M10 |
| `liquidacion_ingresos_id` | UUID | FK | sí | FK, NULL |
| `tipo_operacion` | VARCHAR(25) | — | no | CK |
| `monto_operacion` | DECIMAL(14,2) | — | no | — |
| `costo_fijo` | DECIMAL(10,2) | — | no | — |
| `costo_porcentual` | DECIMAL(10,2) | — | no | — |
| `costo_total` | DECIMAL(10,2) | — | no | — |
| `moneda` | CHAR(3) | — | no | — |
| `periodo` | CHAR(7) | IDX | no | IDX |
| `conciliado_con_factura` | BOOLEAN | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `liquidacion_ingresos_id` | [[liquidacion_ingresos]] | 11 | sí | [[costo_proveedor_operacion.liquidacion_ingresos_id → liquidacion_ingresos]] |
| `proveedor_id` | [[proveedor_pago]] | ↗ 03 | no | [[costo_proveedor_operacion.proveedor_id → proveedor_pago]] |
| `transaccion_id` | [[transaccion_billetera]] | ↗ 10 | sí | [[costo_proveedor_operacion.transaccion_id → transaccion_billetera]] |

## Entidades vecinas

[[liquidacion_ingresos]] · [[proveedor_pago]] · [[transaccion_billetera]]

## Ver también

- Justificación de negocio: [[11_tarifas_comisiones]]
- Diagramas: `docs/entidades/11_tarifas_comisiones.puml`
- Índice: [[_Entidades]] · [[Index]]
