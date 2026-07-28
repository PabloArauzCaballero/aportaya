---
tags:
  - relacion
  - fk
  - modulo/02-grupos-cupos-turnos-y-gobernanza
origen: propuesta_postulacion
columna: postulacion_id
destino: postulacion_emparejamiento
modulo_origen: "02"
modulo_destino: "02"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# propuesta_postulacion.postulacion_id → postulacion_emparejamiento

> **[[propuesta_postulacion]]** `.postulacion_id` → **[[postulacion_emparejamiento]]**

| | |
| --- | --- |
| Entidad origen | [[propuesta_postulacion]] (módulo 02) |
| Entidad destino | [[postulacion_emparejamiento]] (módulo 02) |
| Columna | `postulacion_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |

## Ver también

- [[02_grupos_turnos]] — justificación de negocio del origen
- [[02_grupos_turnos]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
