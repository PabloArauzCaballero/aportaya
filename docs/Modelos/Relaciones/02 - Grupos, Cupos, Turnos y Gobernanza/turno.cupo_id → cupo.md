---
tags:
  - relacion
  - fk
  - modulo/02-grupos-cupos-turnos-y-gobernanza
origen: turno
columna: cupo_id
destino: cupo
modulo_origen: "02"
modulo_destino: "02"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# turno.cupo_id → cupo

> **[[turno]]** `.cupo_id` → **[[cupo]]**

| | |
| --- | --- |
| Entidad origen | [[turno]] (módulo 02) |
| Entidad destino | [[cupo]] (módulo 02) |
| Columna | `cupo_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "cobra en" |

## Ver también

- [[02_grupos_turnos]] — justificación de negocio del origen
- [[02_grupos_turnos]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
