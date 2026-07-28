---
tags:
  - relacion
  - fk
  - modulo/02-grupos-cupos-turnos-y-gobernanza
origen: cupo
columna: participante_id
destino: participante
modulo_origen: "02"
modulo_destino: "02"
cross_modulo: false
opcional: true
cardinalidad: "uno a muchos (0..N)"
---

# cupo.participante_id → participante

> **[[cupo]]** `.participante_id` → **[[participante]]**

| | |
| --- | --- |
| Entidad origen | [[cupo]] (módulo 02) |
| Entidad destino | [[participante]] (módulo 02) |
| Columna | `participante_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "posee" |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[02_grupos_turnos]] — justificación de negocio del origen
- [[02_grupos_turnos]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
