---
tags:
  - relacion
  - fk
  - modulo/08-garantia-incumplimiento-cobranza-y-sanciones
origen: ejecucion_aval
columna: aval_id
destino: aval_participante
modulo_origen: "08"
modulo_destino: "08"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# ejecucion_aval.aval_id → aval_participante

> **[[ejecucion_aval]]** `.aval_id` → **[[aval_participante]]**

| | |
| --- | --- |
| Entidad origen | [[ejecucion_aval]] (módulo 08) |
| Entidad destino | [[aval_participante]] (módulo 08) |
| Columna | `aval_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "se ejecuta" |

## Ver también

- [[08_garantia_incumplimiento]] — justificación de negocio del origen
- [[08_garantia_incumplimiento]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
