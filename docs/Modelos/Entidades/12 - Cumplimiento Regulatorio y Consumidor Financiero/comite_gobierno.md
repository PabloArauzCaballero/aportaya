---
tags:
  - entidad
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
tabla: comite_gobierno
clase: ComiteGobierno
modulo: "12 — Cumplimiento Regulatorio y Consumidor Financiero"
clave_primaria: [id]
columnas: 6
fk_salientes: 0
fk_entrantes: 1
append_only: false
---

# `comite_gobierno`

> Módulo [[12_cumplimiento_asfi|12 — Cumplimiento Regulatorio y Consumidor Financiero]] · clase `ComiteGobierno`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `tipo` | VARCHAR(30) | UQ | no | CK, UQ |
| `periodicidad_minima` | VARCHAR(15) | — | no | CK |
| `composicion_requerida` | JSONB | — | no | — |
| `quorum_minimo` | SMALLINT | — | no | — |
| `activo` | BOOLEAN | — | no | — |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[acta_comite]] | `comite_gobierno_id` | 12 | [[acta_comite.comite_gobierno_id → comite_gobierno]] |

## Entidades vecinas

[[acta_comite]]

## Ver también

- Justificación de negocio: [[12_cumplimiento_asfi]]
- Diagramas: `docs/entidades/12_cumplimiento_asfi.puml`
- Índice: [[_Entidades]] · [[Index]]
