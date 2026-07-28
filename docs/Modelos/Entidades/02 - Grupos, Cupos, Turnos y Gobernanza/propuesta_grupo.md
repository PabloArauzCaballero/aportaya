---
tags:
  - entidad
  - modulo/02-grupos-cupos-turnos-y-gobernanza
tabla: propuesta_grupo
clase: PropuestaGrupo
modulo: "02 — Grupos, Cupos, Turnos y Gobernanza"
clave_primaria: [id]
columnas: 10
fk_salientes: 2
fk_entrantes: 1
append_only: false
---

# `propuesta_grupo`

> Módulo [[02_grupos_turnos|02 — Grupos, Cupos, Turnos y Gobernanza]] · clase `PropuestaGrupo`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `criterio_id` | UUID | FK | no | FK |
| `monto_aporte` | DECIMAL(14,2) | — | no | — |
| `periodicidad` | VARCHAR(15) | — | no | — |
| `puntaje_cohesion` | DECIMAL(5,2) | — | no | — |
| `riesgo_estimado` | DECIMAL(5,2) | — | no | — |
| `estado` | VARCHAR(20) | — | no | CK |
| `aceptaciones_recibidas` | SMALLINT | — | no | — |
| `expira_en` | TIMESTAMPTZ | — | no | — |
| `grupo_materializado_id` | UUID | FK | sí | FK, NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `criterio_id` | [[criterio_emparejamiento]] | 02 | no | [[propuesta_grupo.criterio_id → criterio_emparejamiento]] |
| `grupo_materializado_id` | [[grupo]] | 02 | sí | [[propuesta_grupo.grupo_materializado_id → grupo]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[propuesta_postulacion]] | `propuesta_id` | 02 | [[propuesta_postulacion.propuesta_id → propuesta_grupo]] |

## Entidades vecinas

[[criterio_emparejamiento]] · [[grupo]] · [[propuesta_postulacion]]

## Ver también

- Justificación de negocio: [[02_grupos_turnos]]
- Diagramas: `docs/entidades/02_grupos_turnos.puml`
- Índice: [[_Entidades]] · [[Index]]
