---
tags:
  - relacion
  - fk
  - modulo/08-garantia-incumplimiento-cobranza-y-sanciones
origen: historial_estado_incumplimiento
columna: registro_id
destino: registro_incumplimiento
modulo_origen: "08"
modulo_destino: "08"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (1..N)"
---

# historial_estado_incumplimiento.registro_id → registro_incumplimiento

> **[[historial_estado_incumplimiento]]** `.registro_id` → **[[registro_incumplimiento]]**

| | |
| --- | --- |
| Entidad origen | [[historial_estado_incumplimiento]] (módulo 08) |
| Entidad destino | [[registro_incumplimiento]] (módulo 08) |
| Columna | `registro_id` — UUID |
| Cardinalidad | uno a muchos (1..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "transiciona" |

## Ver también

- [[08_garantia_incumplimiento]] — justificación de negocio del origen
- [[08_garantia_incumplimiento]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
