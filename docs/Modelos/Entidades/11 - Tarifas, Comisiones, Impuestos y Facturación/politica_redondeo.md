---
tags:
  - entidad
  - modulo/11-tarifas-comisiones-impuestos-y-facturacion
tabla: politica_redondeo
clase: PoliticaRedondeo
modulo: "11 — Tarifas, Comisiones, Impuestos y Facturación"
estereotipo: Política configurable
clave_primaria: [id]
columnas: 6
fk_salientes: 0
fk_entrantes: 1
append_only: false
---

# `politica_redondeo`

> Módulo [[11_tarifas_comisiones|11 — Tarifas, Comisiones, Impuestos y Facturación]] · clase `PoliticaRedondeo` · Política configurable

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `codigo` | VARCHAR(30) | UQ | no | UQ |
| `moneda` | CHAR(3) | — | no | — |
| `unidad_minima` | DECIMAL(6,4) | — | no | — |
| `modo` | VARCHAR(15) | — | no | CK |
| `aplica_a` | VARCHAR(20) | — | no | CK |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[concepto_tarifa]] | `politica_redondeo_id` | 11 | [[concepto_tarifa.politica_redondeo_id → politica_redondeo]] |

## Entidades vecinas

[[concepto_tarifa]]

## Ver también

- Justificación de negocio: [[11_tarifas_comisiones]]
- Diagramas: `docs/entidades/11_tarifas_comisiones.puml`
- Índice: [[_Entidades]] · [[Index]]
