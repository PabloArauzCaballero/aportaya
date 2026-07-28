---
tags:
  - relacion
  - fk
  - modulo/02-grupos-cupos-turnos-y-gobernanza
origen: solicitud_permuta
columna: contraparte_id
destino: participante
modulo_origen: "02"
modulo_destino: "02"
cross_modulo: false
opcional: false
cardinalidad: "no declarada en el diagrama"
---

# solicitud_permuta.contraparte_id → participante

> **[[solicitud_permuta]]** `.contraparte_id` → **[[participante]]**

| | |
| --- | --- |
| Entidad origen | [[solicitud_permuta]] (módulo 02) |
| Entidad destino | [[participante]] (módulo 02) |
| Columna | `contraparte_id` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |

## Ver también

- [[02_grupos_turnos]] — justificación de negocio del origen
- [[02_grupos_turnos]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
