---
tags:
  - relacion
  - fk
  - modulo/02-grupos-cupos-turnos-y-gobernanza
origen: traspaso_cupo
columna: participante_origen_id
destino: participante
modulo_origen: "02"
modulo_destino: "02"
cross_modulo: false
opcional: false
cardinalidad: "no declarada en el diagrama"
---

# traspaso_cupo.participante_origen_id → participante

> **[[traspaso_cupo]]** `.participante_origen_id` → **[[participante]]**

| | |
| --- | --- |
| Entidad origen | [[traspaso_cupo]] (módulo 02) |
| Entidad destino | [[participante]] (módulo 02) |
| Columna | `participante_origen_id` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |

## Ver también

- [[02_grupos_turnos]] — justificación de negocio del origen
- [[02_grupos_turnos]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
