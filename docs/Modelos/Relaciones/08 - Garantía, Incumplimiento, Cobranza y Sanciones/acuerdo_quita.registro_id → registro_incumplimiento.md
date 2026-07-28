---
tags:
  - relacion
  - fk
  - modulo/08-garantia-incumplimiento-cobranza-y-sanciones
origen: acuerdo_quita
columna: registro_id
destino: registro_incumplimiento
modulo_origen: "08"
modulo_destino: "08"
cross_modulo: false
opcional: false
cardinalidad: "uno a uno opcional"
---

# acuerdo_quita.registro_id → registro_incumplimiento

> **[[acuerdo_quita]]** `.registro_id` → **[[registro_incumplimiento]]**

| | |
| --- | --- |
| Entidad origen | [[acuerdo_quita]] (módulo 08) |
| Entidad destino | [[registro_incumplimiento]] (módulo 08) |
| Columna | `registro_id` — UUID |
| Cardinalidad | uno a uno opcional |
| Obligatoria | sí |
| Uno a uno | sí (columna UNIQUE) |
| Cruza módulos | no |
| Semántica | "negocia" |

## Ver también

- [[08_garantia_incumplimiento]] — justificación de negocio del origen
- [[08_garantia_incumplimiento]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
