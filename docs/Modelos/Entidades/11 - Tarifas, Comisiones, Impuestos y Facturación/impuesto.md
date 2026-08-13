---
tags:
  - entidad
  - modulo/11-tarifas-comisiones-impuestos-y-facturacion
tabla: impuesto
clase: Impuesto
modulo: "11 — Tarifas, Comisiones, Impuestos y Facturación"
estereotipo: Política configurable
clave_primaria: [id]
columnas: 9
fk_salientes: 1
fk_entrantes: 1
append_only: false
---

# `impuesto`

> Módulo [[11_tarifas_comisiones|11 — Tarifas, Comisiones, Impuestos y Facturación]] · clase `Impuesto` · Política configurable

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `cuenta_contable_id` | UUID | FK | sí | FK, NULL, M3 |
| `codigo` | VARCHAR(15) | UQ | no | UQ+vigente_desde |
| `nombre` | VARCHAR(80) | — | no | — |
| `alicuota` | DECIMAL(6,4) | — | no | — |
| `tipo_calculo` | VARCHAR(20) | — | no | CK |
| `base_legal` | VARCHAR(120) | — | no | — |
| `vigente_desde` | DATE | — | no | — |
| `vigente_hasta` | DATE | — | sí | NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `cuenta_contable_id` | [[cuenta_contable]] | ↗ 03 | sí | [[impuesto.cuenta_contable_id → cuenta_contable]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[calculo_impuesto]] | `impuesto_id` | 11 | [[calculo_impuesto.impuesto_id → impuesto]] |

## Entidades vecinas

[[calculo_impuesto]] · [[cuenta_contable]]

## Ver también

- Justificación de negocio: [[11_tarifas_comisiones]]
- Diagramas: `docs/entidades/11_tarifas_comisiones.puml`
- Índice: [[_Entidades]] · [[Index]]
