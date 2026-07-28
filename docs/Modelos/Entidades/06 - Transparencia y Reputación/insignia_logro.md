---
tags:
  - entidad
  - modulo/06-transparencia-y-reputacion
tabla: insignia_logro
clase: InsigniaLogro
modulo: "06 — Transparencia y Reputación"
clave_primaria: [id]
columnas: 6
fk_salientes: 0
fk_entrantes: 1
append_only: false
---

# `insignia_logro`

> Módulo [[06_transparencia_reputacion|06 — Transparencia y Reputación]] · clase `InsigniaLogro`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `codigo` | VARCHAR(40) | UQ | no | UQ |
| `nombre` | VARCHAR(80) | — | no | — |
| `descripcion` | VARCHAR(200) | — | no | — |
| `criterio` | VARCHAR(300) | — | no | — |
| `icono_url` | VARCHAR(255) | — | no | — |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[insignia_otorgada]] | `insignia_id` | 06 | [[insignia_otorgada.insignia_id → insignia_logro]] |

## Entidades vecinas

[[insignia_otorgada]]

## Ver también

- Justificación de negocio: [[06_transparencia_reputacion]]
- Diagramas: `docs/entidades/06_transparencia_reputacion.puml`
- Índice: [[_Entidades]] · [[Index]]
