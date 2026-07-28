---
tags:
  - relacion
  - fk
  - modulo/02-grupos-cupos-turnos-y-gobernanza
origen: propuesta_grupo
columna: criterio_id
destino: criterio_emparejamiento
modulo_origen: "02"
modulo_destino: "02"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# propuesta_grupo.criterio_id → criterio_emparejamiento

> **[[propuesta_grupo]]** `.criterio_id` → **[[criterio_emparejamiento]]**

| | |
| --- | --- |
| Entidad origen | [[propuesta_grupo]] (módulo 02) |
| Entidad destino | [[criterio_emparejamiento]] (módulo 02) |
| Columna | `criterio_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "puntua" |

## Ver también

- [[02_grupos_turnos]] — justificación de negocio del origen
- [[02_grupos_turnos]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
