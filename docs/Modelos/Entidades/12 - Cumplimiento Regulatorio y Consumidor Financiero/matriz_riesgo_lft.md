---
tags:
  - entidad
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
tabla: matriz_riesgo_lft
clase: MatrizRiesgoLft
modulo: "12 — Cumplimiento Regulatorio y Consumidor Financiero"
estereotipo: Política configurable
clave_primaria: [id]
columnas: 10
fk_salientes: 1
fk_entrantes: 2
append_only: false
---

# `matriz_riesgo_lft`

> Módulo [[12_cumplimiento_asfi|12 — Cumplimiento Regulatorio y Consumidor Financiero]] · clase `MatrizRiesgoLft` · Política configurable

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `version` | SMALLINT | UQ | no | UQ+dimension+factor |
| `dimension` | VARCHAR(20) | — | no | CK |
| `factor` | VARCHAR(60) | — | no | — |
| `ponderacion` | DECIMAL(5,2) | — | no | — |
| `escala` | JSONB | — | no | — |
| `base_normativa` | VARCHAR(120) | — | no | — |
| `vigente_desde` | DATE | — | no | — |
| `vigente_hasta` | DATE | — | sí | NULL |
| `aprobada_por` | UUID | FK | sí | FK, NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `aprobada_por` | [[usuario]] | ↗ 01 | sí | [[matriz_riesgo_lft.aprobada_por → usuario]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[calificacion_riesgo_cliente]] | `matriz_riesgo_id` | 12 | [[calificacion_riesgo_cliente.matriz_riesgo_id → matriz_riesgo_lft]] |
| [[factor_riesgo_evaluado]] | `matriz_riesgo_id` | 12 | [[factor_riesgo_evaluado.matriz_riesgo_id → matriz_riesgo_lft]] |

## Entidades vecinas

[[calificacion_riesgo_cliente]] · [[factor_riesgo_evaluado]] · [[usuario]]

## Ver también

- Justificación de negocio: [[12_cumplimiento_asfi]]
- Diagramas: `docs/entidades/12_cumplimiento_asfi.puml`
- Índice: [[_Entidades]] · [[Index]]
