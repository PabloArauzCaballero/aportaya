---
tags:
  - entidad
  - modulo/02-grupos-cupos-turnos-y-gobernanza
tabla: reglamento_grupo
clase: ReglamentoGrupo
modulo: "02 — Grupos, Cupos, Turnos y Gobernanza"
clave_primaria: [id]
columnas: 10
fk_salientes: 2
fk_entrantes: 1
append_only: false
---

# `reglamento_grupo`

> Módulo [[02_grupos_turnos|02 — Grupos, Cupos, Turnos y Gobernanza]] · clase `ReglamentoGrupo`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `grupo_id` | UUID | FK IDX | no | FK, IDX |
| `version` | SMALLINT | UQ | no | UQ+grupo_id |
| `contenido` | TEXT | — | no | — |
| `hash_contenido` | VARCHAR(64) | — | no | — |
| `clausulas_mora` | TEXT | — | no | — |
| `clausulas_abandono` | TEXT | — | no | — |
| `vigente_desde` | TIMESTAMPTZ | — | no | — |
| `vigente_hasta` | TIMESTAMPTZ | — | sí | NULL |
| `redactado_por` | UUID | FK | no | FK |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `grupo_id` | [[grupo]] | 02 | no | [[reglamento_grupo.grupo_id → grupo]] |
| `redactado_por` | [[usuario]] | ↗ 01 | no | [[reglamento_grupo.redactado_por → usuario]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[aceptacion_reglamento]] | `reglamento_id` | 02 | [[aceptacion_reglamento.reglamento_id → reglamento_grupo]] |

## Entidades vecinas

[[aceptacion_reglamento]] · [[grupo]] · [[usuario]]

## Ver también

- Justificación de negocio: [[02_grupos_turnos]]
- Diagramas: `docs/entidades/02_grupos_turnos.puml`
- Índice: [[_Entidades]] · [[Index]]
