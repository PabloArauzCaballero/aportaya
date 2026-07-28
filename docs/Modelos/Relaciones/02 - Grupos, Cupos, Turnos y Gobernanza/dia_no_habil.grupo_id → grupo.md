---
tags:
  - relacion
  - fk
  - modulo/02-grupos-cupos-turnos-y-gobernanza
origen: dia_no_habil
columna: grupo_id
destino: grupo
modulo_origen: "02"
modulo_destino: "02"
cross_modulo: false
opcional: true
cardinalidad: "no declarada en el diagrama"
---

# dia_no_habil.grupo_id → grupo

> **[[dia_no_habil]]** `.grupo_id` → **[[grupo]]**

| | |
| --- | --- |
| Entidad origen | [[dia_no_habil]] (módulo 02) |
| Entidad destino | [[grupo]] (módulo 02) |
| Columna | `grupo_id` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | no |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[02_grupos_turnos]] — justificación de negocio del origen
- [[02_grupos_turnos]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
