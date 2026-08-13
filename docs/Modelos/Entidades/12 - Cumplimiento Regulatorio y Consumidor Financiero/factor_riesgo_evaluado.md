---
tags:
  - entidad
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
tabla: factor_riesgo_evaluado
clase: FactorRiesgoEvaluado
modulo: "12 — Cumplimiento Regulatorio y Consumidor Financiero"
estereotipo: Objeto de valor
clave_primaria: [id]
columnas: 8
fk_salientes: 2
fk_entrantes: 0
append_only: false
---

# `factor_riesgo_evaluado`

> Módulo [[12_cumplimiento_asfi|12 — Cumplimiento Regulatorio y Consumidor Financiero]] · clase `FactorRiesgoEvaluado` · Objeto de valor

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `usuario_id` | UUID | FK IDX | no | FK, IDX, M1 |
| `matriz_riesgo_id` | UUID | FK | no | FK |
| `dimension` | VARCHAR(20) | — | no | — |
| `factor` | VARCHAR(60) | — | no | — |
| `valor_observado` | VARCHAR(120) | — | no | — |
| `puntaje` | DECIMAL(6,2) | — | no | — |
| `evaluado_en` | TIMESTAMPTZ | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `matriz_riesgo_id` | [[matriz_riesgo_lft]] | 12 | no | [[factor_riesgo_evaluado.matriz_riesgo_id → matriz_riesgo_lft]] |
| `usuario_id` | [[usuario]] | ↗ 01 | no | [[factor_riesgo_evaluado.usuario_id → usuario]] |

## Entidades vecinas

[[matriz_riesgo_lft]] · [[usuario]]

## Ver también

- Justificación de negocio: [[12_cumplimiento_asfi]]
- Diagramas: `docs/entidades/12_cumplimiento_asfi.puml`
- Índice: [[_Entidades]] · [[Index]]
