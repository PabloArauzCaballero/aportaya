---
tags:
  - entidad
  - modulo/06-transparencia-y-reputacion
tabla: peso_factor
clase: PesoFactor
modulo: "06 — Transparencia y Reputación"
clave_primaria: [id]
columnas: 7
fk_salientes: 1
fk_entrantes: 0
append_only: false
---

# `peso_factor`

> Módulo [[06_transparencia_reputacion|06 — Transparencia y Reputación]] · clase `PesoFactor`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `modelo_id` | UUID | FK IDX | no | FK, IDX |
| `codigo_factor` | VARCHAR(40) | UQ | no | UQ+modelo_id |
| `descripcion` | VARCHAR(160) | — | no | — |
| `peso` | DECIMAL(5,4) | — | no | — |
| `tope_aporte_al_score` | DECIMAL(6,2) | — | no | — |
| `es_penalizador` | BOOLEAN | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `modelo_id` | [[modelo_scoring]] | 06 | no | [[peso_factor.modelo_id → modelo_scoring]] |

## Entidades vecinas

[[modelo_scoring]]

## Ver también

- Justificación de negocio: [[06_transparencia_reputacion]]
- Diagramas: `docs/entidades/06_transparencia_reputacion.puml`
- Índice: [[_Entidades]] · [[Index]]
