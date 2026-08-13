---
tags:
  - relacion
  - fk
  - modulo/08-garantia-incumplimiento-cobranza-y-sanciones
origen: subrogacion
columna: cobertura_id
destino: cobertura_incumplimiento
modulo_origen: "08"
modulo_destino: "08"
cross_modulo: false
opcional: false
cardinalidad: "uno a uno opcional"
---

# subrogacion.cobertura_id → cobertura_incumplimiento

> **[[subrogacion]]** `.cobertura_id` → **[[cobertura_incumplimiento]]**

| | |
| --- | --- |
| Entidad origen | [[subrogacion]] (módulo 08) |
| Entidad destino | [[cobertura_incumplimiento]] (módulo 08) |
| Columna | `cobertura_id` — UUID |
| Cardinalidad | uno a uno opcional |
| Obligatoria | sí |
| Uno a uno | sí (columna UNIQUE) |
| Cruza módulos | no |
| Semántica | "subroga" |

## Ver también

- [[08_garantia_incumplimiento]] — justificación de negocio del origen
- [[08_garantia_incumplimiento]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
