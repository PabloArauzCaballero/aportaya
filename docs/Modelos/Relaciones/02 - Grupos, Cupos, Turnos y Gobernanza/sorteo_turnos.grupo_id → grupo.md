---
tags:
  - relacion
  - fk
  - modulo/02-grupos-cupos-turnos-y-gobernanza
origen: sorteo_turnos
columna: grupo_id
destino: grupo
modulo_origen: "02"
modulo_destino: "02"
cross_modulo: false
opcional: false
cardinalidad: "uno a uno opcional"
---

# sorteo_turnos.grupo_id → grupo

> **[[sorteo_turnos]]** `.grupo_id` → **[[grupo]]**

| | |
| --- | --- |
| Entidad origen | [[sorteo_turnos]] (módulo 02) |
| Entidad destino | [[grupo]] (módulo 02) |
| Columna | `grupo_id` — UUID |
| Cardinalidad | uno a uno opcional |
| Obligatoria | sí |
| Uno a uno | sí (columna UNIQUE) |
| Cruza módulos | no |
| Semántica | "ordena por" |

## Ver también

- [[02_grupos_turnos]] — justificación de negocio del origen
- [[02_grupos_turnos]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
