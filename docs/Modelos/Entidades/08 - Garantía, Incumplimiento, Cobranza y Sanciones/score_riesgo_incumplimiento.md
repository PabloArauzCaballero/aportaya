---
tags:
  - entidad
  - modulo/08-garantia-incumplimiento-cobranza-y-sanciones
tabla: score_riesgo_incumplimiento
clase: ScoreRiesgoIncumplimiento
modulo: "08 — Garantía, Incumplimiento, Cobranza y Sanciones"
clave_primaria: [id]
columnas: 8
fk_salientes: 2
fk_entrantes: 0
append_only: false
---

# `score_riesgo_incumplimiento`

> Módulo [[08_garantia_incumplimiento|08 — Garantía, Incumplimiento, Cobranza y Sanciones]] · clase `ScoreRiesgoIncumplimiento`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `usuario_id` | UUID | FK IDX | no | FK, IDX |
| `grupo_id` | UUID | FK | sí | FK, NULL |
| `probabilidad_incumplimiento` | DECIMAL(5,4) | — | no | — |
| `factores_principales` | JSONB | — | no | — |
| `nivel_riesgo` | VARCHAR(10) | IDX | no | CK, IDX |
| `accion_sugerida` | VARCHAR(160) | — | no | — |
| `calculado_en` | TIMESTAMPTZ | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `grupo_id` | [[grupo]] | ↗ 02 | sí | [[score_riesgo_incumplimiento.grupo_id → grupo]] |
| `usuario_id` | [[usuario]] | ↗ 01 | no | [[score_riesgo_incumplimiento.usuario_id → usuario]] |

## Entidades vecinas

[[grupo]] · [[usuario]]

## Ver también

- Justificación de negocio: [[08_garantia_incumplimiento]]
- Diagramas: `docs/entidades/08_garantia_incumplimiento.puml`
- Índice: [[_Entidades]] · [[Index]]
