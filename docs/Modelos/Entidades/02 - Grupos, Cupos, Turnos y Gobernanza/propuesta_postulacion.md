---
tags:
  - entidad
  - modulo/02-grupos-cupos-turnos-y-gobernanza
tabla: propuesta_postulacion
modulo: "02 — Grupos, Cupos, Turnos y Gobernanza"
clave_primaria: [propuesta_id, postulacion_id]
columnas: 4
fk_salientes: 2
fk_entrantes: 0
append_only: false
---

# `propuesta_postulacion`

> Módulo [[02_grupos_turnos|02 — Grupos, Cupos, Turnos y Gobernanza]]

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `propuesta_id` | UUID | PK FK | no | PK, FK |
| `postulacion_id` | UUID | PK FK | no | PK, FK |
| `acepto` | BOOLEAN | — | no | — |
| `respondido_en` | TIMESTAMPTZ | — | sí | NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `postulacion_id` | [[postulacion_emparejamiento]] | 02 | no | [[propuesta_postulacion.postulacion_id → postulacion_emparejamiento]] |
| `propuesta_id` | [[propuesta_grupo]] | 02 | no | [[propuesta_postulacion.propuesta_id → propuesta_grupo]] |

## Entidades vecinas

[[postulacion_emparejamiento]] · [[propuesta_grupo]]

## Ver también

- Justificación de negocio: [[02_grupos_turnos]]
- Diagramas: `docs/entidades/02_grupos_turnos.puml`
- Índice: [[_Entidades]] · [[Index]]
