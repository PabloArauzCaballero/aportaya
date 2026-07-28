---
tags:
  - relacion
  - fk
  - modulo/02-grupos-cupos-turnos-y-gobernanza
origen: participante
columna: invitado_por_id
destino: participante
modulo_origen: "02"
modulo_destino: "02"
cross_modulo: false
opcional: true
cardinalidad: "no declarada en el diagrama"
---

# participante.invitado_por_id → participante

> **[[participante]]** `.invitado_por_id` → **[[participante]]**

| | |
| --- | --- |
| Entidad origen | [[participante]] (módulo 02) |
| Entidad destino | [[participante]] (módulo 02) |
| Columna | `invitado_por_id` — UUID |
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
