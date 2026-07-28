---
tags:
  - relacion
  - fk
  - modulo/02-grupos-cupos-turnos-y-gobernanza
origen: solicitud_permuta
columna: turno_destino_id
destino: turno
modulo_origen: "02"
modulo_destino: "02"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# solicitud_permuta.turno_destino_id → turno

> **[[solicitud_permuta]]** `.turno_destino_id` → **[[turno]]**

| | |
| --- | --- |
| Entidad origen | [[solicitud_permuta]] (módulo 02) |
| Entidad destino | [[turno]] (módulo 02) |
| Columna | `turno_destino_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "negocia" |

## Ver también

- [[02_grupos_turnos]] — justificación de negocio del origen
- [[02_grupos_turnos]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
