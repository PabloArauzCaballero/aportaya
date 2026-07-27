---
tags:
  - relacion
  - fk
  - modulo/02-grupos-cupos-turnos-y-gobernanza
origen: solicitud_retiro
columna: participante_id
destino: participante
modulo_origen: "02"
modulo_destino: "02"
cross_modulo: false
opcional: false
cardinalidad: "uno a uno opcional"
---

# solicitud_retiro.participante_id → participante

> **[[solicitud_retiro]]** `.participante_id` → **[[participante]]**

| | |
| --- | --- |
| Entidad origen | [[solicitud_retiro]] (módulo 02) |
| Entidad destino | [[participante]] (módulo 02) |
| Columna | `participante_id` — UUID |
| Cardinalidad | uno a uno opcional |
| Obligatoria | sí |
| Uno a uno | sí (columna UNIQUE) |
| Cruza módulos | no |
| Semántica | "solicita" |

## Ver también

- [[02_grupos_turnos]] — justificación de negocio del origen
- [[02_grupos_turnos]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
