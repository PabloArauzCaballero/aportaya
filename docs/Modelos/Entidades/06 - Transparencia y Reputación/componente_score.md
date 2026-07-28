---
tags:
  - entidad
  - modulo/06-transparencia-y-reputacion
tabla: componente_score
clase: ComponenteScore
modulo: "06 — Transparencia y Reputación"
clave_primaria: [id]
columnas: 7
fk_salientes: 1
fk_entrantes: 0
append_only: false
---

# `componente_score`

> Módulo [[06_transparencia_reputacion|06 — Transparencia y Reputación]] · clase `ComponenteScore`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `puntaje_id` | UUID | FK IDX | no | FK, IDX |
| `codigo_factor` | VARCHAR(40) | UQ | no | UQ+puntaje_id |
| `valor_crudo` | DECIMAL(12,4) | — | no | — |
| `valor_normalizado` | DECIMAL(5,4) | — | no | — |
| `contribucion` | DECIMAL(6,2) | — | no | — |
| `tendencia` | VARCHAR(10) | — | no | CK |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `puntaje_id` | [[puntaje_reputacion]] | 06 | no | [[componente_score.puntaje_id → puntaje_reputacion]] |

## Entidades vecinas

[[puntaje_reputacion]]

## Ver también

- Justificación de negocio: [[06_transparencia_reputacion]]
- Diagramas: `docs/entidades/06_transparencia_reputacion.puml`
- Índice: [[_Entidades]] · [[Index]]
