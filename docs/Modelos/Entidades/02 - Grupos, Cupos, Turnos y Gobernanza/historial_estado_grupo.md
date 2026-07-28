---
tags:
  - entidad
  - modulo/02-grupos-cupos-turnos-y-gobernanza
tabla: historial_estado_grupo
clase: HistorialEstadoGrupo
modulo: "02 — Grupos, Cupos, Turnos y Gobernanza"
clave_primaria: [id]
columnas: 7
fk_salientes: 2
fk_entrantes: 0
append_only: false
---

# `historial_estado_grupo`

> Módulo [[02_grupos_turnos|02 — Grupos, Cupos, Turnos y Gobernanza]] · clase `HistorialEstadoGrupo`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `grupo_id` | UUID | FK IDX | no | FK, IDX |
| `estado_anterior` | VARCHAR(30) | — | no | — |
| `estado_nuevo` | VARCHAR(30) | — | no | — |
| `motivo` | VARCHAR(200) | — | no | — |
| `ejecutado_por` | UUID | FK | no | FK |
| `fecha_hora` | TIMESTAMPTZ | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `ejecutado_por` | [[usuario]] | ↗ 01 | no | [[historial_estado_grupo.ejecutado_por → usuario]] |
| `grupo_id` | [[grupo]] | 02 | no | [[historial_estado_grupo.grupo_id → grupo]] |

## Entidades vecinas

[[grupo]] · [[usuario]]

## Ver también

- Justificación de negocio: [[02_grupos_turnos]]
- Diagramas: `docs/entidades/02_grupos_turnos.puml`
- Índice: [[_Entidades]] · [[Index]]
