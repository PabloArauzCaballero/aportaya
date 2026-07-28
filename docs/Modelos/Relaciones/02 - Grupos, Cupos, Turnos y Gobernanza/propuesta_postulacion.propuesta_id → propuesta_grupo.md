---
tags:
  - relacion
  - fk
  - modulo/02-grupos-cupos-turnos-y-gobernanza
origen: propuesta_postulacion
columna: propuesta_id
destino: propuesta_grupo
modulo_origen: "02"
modulo_destino: "02"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# propuesta_postulacion.propuesta_id → propuesta_grupo

> **[[propuesta_postulacion]]** `.propuesta_id` → **[[propuesta_grupo]]**

| | |
| --- | --- |
| Entidad origen | [[propuesta_postulacion]] (módulo 02) |
| Entidad destino | [[propuesta_grupo]] (módulo 02) |
| Columna | `propuesta_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |

## Ver también

- [[02_grupos_turnos]] — justificación de negocio del origen
- [[02_grupos_turnos]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
