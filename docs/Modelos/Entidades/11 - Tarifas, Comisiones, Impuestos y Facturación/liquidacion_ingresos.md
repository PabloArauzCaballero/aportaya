---
tags:
  - entidad
  - modulo/11-tarifas-comisiones-impuestos-y-facturacion
tabla: liquidacion_ingresos
clase: LiquidacionIngresos
modulo: "11 — Tarifas, Comisiones, Impuestos y Facturación"
estereotipo: Raíz de agregado
clave_primaria: [id]
columnas: 17
fk_salientes: 2
fk_entrantes: 1
append_only: false
---

# `liquidacion_ingresos`

> Módulo [[11_tarifas_comisiones|11 — Tarifas, Comisiones, Impuestos y Facturación]] · clase `LiquidacionIngresos` · Raíz de agregado

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `periodo` | CHAR(7) | UQ | no | UQ |
| `fecha_inicio` | DATE | — | no | — |
| `fecha_fin` | DATE | — | no | — |
| `total_devengado` | DECIMAL(16,2) | — | no | — |
| `total_cobrado` | DECIMAL(16,2) | — | no | — |
| `total_exonerado` | DECIMAL(16,2) | — | no | — |
| `total_devuelto` | DECIMAL(16,2) | — | no | — |
| `total_incobrable` | DECIMAL(16,2) | — | no | — |
| `total_impuestos` | DECIMAL(16,2) | — | no | — |
| `total_costo_proveedores` | DECIMAL(16,2) | — | no | — |
| `ingreso_neto` | DECIMAL(16,2) | — | no | GENERATED |
| `cantidad_operaciones` | INTEGER | — | no | — |
| `estado` | VARCHAR(15) | IDX | no | CK, IDX |
| `asiento_contable_id` | UUID | FK | sí | FK, NULL, M3 |
| `cerrada_por` | UUID | FK | sí | FK, NULL |
| `cerrada_en` | TIMESTAMPTZ | — | sí | NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `asiento_contable_id` | [[asiento_contable]] | ↗ 03 | sí | [[liquidacion_ingresos.asiento_contable_id → asiento_contable]] |
| `cerrada_por` | [[usuario]] | ↗ 01 | sí | [[liquidacion_ingresos.cerrada_por → usuario]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[costo_proveedor_operacion]] | `liquidacion_ingresos_id` | 11 | [[costo_proveedor_operacion.liquidacion_ingresos_id → liquidacion_ingresos]] |

## Entidades vecinas

[[asiento_contable]] · [[costo_proveedor_operacion]] · [[usuario]]

## Ver también

- Justificación de negocio: [[11_tarifas_comisiones]]
- Diagramas: `docs/entidades/11_tarifas_comisiones.puml`
- Índice: [[_Entidades]] · [[Index]]
