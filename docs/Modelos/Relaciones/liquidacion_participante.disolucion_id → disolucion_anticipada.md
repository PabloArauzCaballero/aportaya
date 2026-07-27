---
tags:
  - relacion
  - fk
  - modulo/08-garantia-incumplimiento-cobranza-y-sanciones
origen: liquidacion_participante
columna: disolucion_id
destino: disolucion_anticipada
modulo_origen: "08"
modulo_destino: "08"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (1..N)"
---

# liquidacion_participante.disolucion_id → disolucion_anticipada

> **[[liquidacion_participante]]** `.disolucion_id` → **[[disolucion_anticipada]]**

| | |
| --- | --- |
| Entidad origen | [[liquidacion_participante]] (módulo 08) |
| Entidad destino | [[disolucion_anticipada]] (módulo 08) |
| Columna | `disolucion_id` — UUID |
| Cardinalidad | uno a muchos (1..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "liquida" |

## Ver también

- [[08_garantia_incumplimiento]] — justificación de negocio del origen
- [[08_garantia_incumplimiento]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
