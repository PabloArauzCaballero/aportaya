---
tags:
  - relacion
  - fk
  - modulo/02-grupos-cupos-turnos-y-gobernanza
origen: propuesta_grupo
columna: grupo_materializado_id
destino: grupo
modulo_origen: "02"
modulo_destino: "02"
cross_modulo: false
opcional: true
cardinalidad: "uno a uno, ambos opcionales"
---

# propuesta_grupo.grupo_materializado_id → grupo

> **[[propuesta_grupo]]** `.grupo_materializado_id` → **[[grupo]]**

| | |
| --- | --- |
| Entidad origen | [[propuesta_grupo]] (módulo 02) |
| Entidad destino | [[grupo]] (módulo 02) |
| Columna | `grupo_materializado_id` — UUID |
| Cardinalidad | uno a uno, ambos opcionales |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "materializa" |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[02_grupos_turnos]] — justificación de negocio del origen
- [[02_grupos_turnos]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
