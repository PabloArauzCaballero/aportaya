---
tags:
  - entidad
  - modulo/13-contabilidad-financiera-y-erp
tabla: centro_costo
clase: CentroCosto
modulo: "13 — Contabilidad Financiera y ERP"
estereotipo: Raíz de agregado
clave_primaria: [id]
columnas: 5
fk_salientes: 0
fk_entrantes: 4
append_only: false
---

# `centro_costo`

> Módulo [[13_contabilidad_erp|13 — Contabilidad Financiera y ERP]] · clase `CentroCosto` · Raíz de agregado

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `codigo` | VARCHAR(20) | UQ | no | UQ |
| `nombre` | VARCHAR(100) | — | no | — |
| `tipo` | VARCHAR(20) | — | no | CK |
| `activo` | BOOLEAN | — | no | — |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[activo_fijo]] | `centro_costo_id` | 13 | [[activo_fijo.centro_costo_id → centro_costo]] |
| [[factura_proveedor]] | `centro_costo_id` | 13 | [[factura_proveedor.centro_costo_id → centro_costo]] |
| [[orden_compra]] | `centro_costo_id` | 13 | [[orden_compra.centro_costo_id → centro_costo]] |
| [[presupuesto]] | `centro_costo_id` | 13 | [[presupuesto.centro_costo_id → centro_costo]] |

## Entidades vecinas

[[activo_fijo]] · [[factura_proveedor]] · [[orden_compra]] · [[presupuesto]]

## Ver también

- Justificación de negocio: [[13_contabilidad_erp]]
- Diagramas: `docs/entidades/13_contabilidad_erp.puml`
- Índice: [[_Entidades]] · [[Index]]
