---
tags:
  - entidad
  - modulo/02-grupos-cupos-turnos-y-gobernanza
tabla: criterio_emparejamiento
clase: CriterioEmparejamiento
modulo: "02 — Grupos, Cupos, Turnos y Gobernanza"
estereotipo: Política configurable
clave_primaria: [id]
columnas: 8
fk_salientes: 0
fk_entrantes: 1
append_only: false
---

# `criterio_emparejamiento`

> Módulo [[02_grupos_turnos|02 — Grupos, Cupos, Turnos y Gobernanza]] · clase `CriterioEmparejamiento` · Política configurable

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `peso_reputacion` | DECIMAL(4,3) | — | no | — |
| `peso_monto` | DECIMAL(4,3) | — | no | — |
| `peso_geografia` | DECIMAL(4,3) | — | no | — |
| `peso_historial_comun` | DECIMAL(4,3) | — | no | — |
| `reputacion_minima` | DECIMAL(6,2) | — | no | — |
| `max_morosos_por_grupo` | SMALLINT | — | no | — |
| `vigente_desde` | TIMESTAMPTZ | — | no | — |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[propuesta_grupo]] | `criterio_id` | 02 | [[propuesta_grupo.criterio_id → criterio_emparejamiento]] |

## Entidades vecinas

[[propuesta_grupo]]

## Ver también

- Justificación de negocio: [[02_grupos_turnos]]
- Diagramas: `docs/entidades/02_grupos_turnos.puml`
- Índice: [[_Entidades]] · [[Index]]
