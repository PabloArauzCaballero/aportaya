---
tags:
  - relacion
  - fk
  - modulo/02-grupos-cupos-turnos-y-gobernanza
origen: participante
columna: grupo_id
destino: grupo
modulo_origen: "02"
modulo_destino: "02"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# participante.grupo_id → grupo

> **[[participante]]** `.grupo_id` → **[[grupo]]**

| | |
| --- | --- |
| Entidad origen | [[participante]] (módulo 02) |
| Entidad destino | [[grupo]] (módulo 02) |
| Columna | `grupo_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "agrupa" |

## Ver también

- [[02_grupos_turnos]] — justificación de negocio del origen
- [[02_grupos_turnos]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
