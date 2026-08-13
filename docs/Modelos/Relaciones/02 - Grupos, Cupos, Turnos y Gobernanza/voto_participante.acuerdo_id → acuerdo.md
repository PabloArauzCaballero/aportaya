---
tags:
  - relacion
  - fk
  - modulo/02-grupos-cupos-turnos-y-gobernanza
origen: voto_participante
columna: acuerdo_id
destino: acuerdo
modulo_origen: "02"
modulo_destino: "02"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# voto_participante.acuerdo_id → acuerdo

> **[[voto_participante]]** `.acuerdo_id` → **[[acuerdo]]**

| | |
| --- | --- |
| Entidad origen | [[voto_participante]] (módulo 02) |
| Entidad destino | [[acuerdo]] (módulo 02) |
| Columna | `acuerdo_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "recibe" |

## Ver también

- [[02_grupos_turnos]] — justificación de negocio del origen
- [[02_grupos_turnos]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
