---
tags:
  - relacion
  - fk
  - modulo/02-grupos-cupos-turnos-y-gobernanza
origen: aceptacion_reglamento
columna: participante_id
destino: participante
modulo_origen: "02"
modulo_destino: "02"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# aceptacion_reglamento.participante_id → participante

> **[[aceptacion_reglamento]]** `.participante_id` → **[[participante]]**

| | |
| --- | --- |
| Entidad origen | [[aceptacion_reglamento]] (módulo 02) |
| Entidad destino | [[participante]] (módulo 02) |
| Columna | `participante_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "firma" |

## Ver también

- [[02_grupos_turnos]] — justificación de negocio del origen
- [[02_grupos_turnos]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
