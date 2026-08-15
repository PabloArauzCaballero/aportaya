---
tags:
  - entidad
  - modulo/13-contabilidad-financiera-y-erp
tabla: tercero_comercial
clase: TerceroComercial
modulo: "13 — Contabilidad Financiera y ERP"
estereotipo: Raíz de agregado
clave_primaria: [id]
columnas: 9
fk_salientes: 1
fk_entrantes: 3
append_only: false
---

# `tercero_comercial`

> Módulo [[13_contabilidad_erp|13 — Contabilidad Financiera y ERP]] · clase `TerceroComercial` · Raíz de agregado

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `tipo` | VARCHAR(12) | — | no | CK |
| `razon_social` | VARCHAR(150) | — | no | — |
| `numero_documento` | VARCHAR(30) | UQ | no | UQ |
| `email` | VARCHAR(120) | — | sí | NULL |
| `telefono` | VARCHAR(20) | — | sí | NULL |
| `cuenta_contable_id` | UUID | FK IDX | sí | FK, NULL, IDX, M3 |
| `estado` | VARCHAR(15) | IDX | no | CK, IDX |
| `creado_en` | TIMESTAMPTZ | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `cuenta_contable_id` | [[cuenta_contable]] | ↗ 03 | sí | [[tercero_comercial.cuenta_contable_id → cuenta_contable]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[cuenta_por_cobrar]] | `tercero_comercial_id` | 13 | [[cuenta_por_cobrar.tercero_comercial_id → tercero_comercial]] |
| [[factura_proveedor]] | `tercero_comercial_id` | 13 | [[factura_proveedor.tercero_comercial_id → tercero_comercial]] |
| [[orden_compra]] | `tercero_comercial_id` | 13 | [[orden_compra.tercero_comercial_id → tercero_comercial]] |

## Entidades vecinas

[[cuenta_contable]] · [[cuenta_por_cobrar]] · [[factura_proveedor]] · [[orden_compra]]

## Ver también

- Justificación de negocio: [[13_contabilidad_erp]]
- Diagramas: `docs/entidades/13_contabilidad_erp.puml`
- Índice: [[_Entidades]] · [[Index]]
