---
tags:
  - entidad
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
tabla: evaluacion_tercero
clase: EvaluacionTercero
modulo: "12 — Cumplimiento Regulatorio y Consumidor Financiero"
clave_primaria: [id]
columnas: 9
fk_salientes: 2
fk_entrantes: 0
append_only: false
---

# `evaluacion_tercero`

> Módulo [[12_cumplimiento_asfi|12 — Cumplimiento Regulatorio y Consumidor Financiero]] · clase `EvaluacionTercero`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `contrato_tercero_id` | UUID | FK IDX | no | FK, IDX |
| `evaluado_por` | UUID | FK | no | FK |
| `periodo` | CHAR(7) | UQ | no | UQ+contrato_tercero_id |
| `cumplimiento_sla` | DECIMAL(5,2) | — | no | — |
| `incidentes_atribuibles` | SMALLINT | — | no | — |
| `resultado` | VARCHAR(15) | — | no | CK |
| `acciones_requeridas` | VARCHAR(400) | — | sí | NULL |
| `evaluada_en` | TIMESTAMPTZ | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `contrato_tercero_id` | [[contrato_tercero]] | 12 | no | [[evaluacion_tercero.contrato_tercero_id → contrato_tercero]] |
| `evaluado_por` | [[usuario]] | ↗ 01 | no | [[evaluacion_tercero.evaluado_por → usuario]] |

## Entidades vecinas

[[contrato_tercero]] · [[usuario]]

## Ver también

- Justificación de negocio: [[12_cumplimiento_asfi]]
- Diagramas: `docs/entidades/12_cumplimiento_asfi.puml`
- Índice: [[_Entidades]] · [[Index]]
