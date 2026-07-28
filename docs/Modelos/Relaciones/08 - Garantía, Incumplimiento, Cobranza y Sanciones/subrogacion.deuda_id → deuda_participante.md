---
tags:
  - relacion
  - fk
  - modulo/08-garantia-incumplimiento-cobranza-y-sanciones
origen: subrogacion
columna: deuda_id
destino: deuda_participante
modulo_origen: "08"
modulo_destino: "08"
cross_modulo: false
opcional: false
cardinalidad: "uno a uno opcional"
---

# subrogacion.deuda_id → deuda_participante

> **[[subrogacion]]** `.deuda_id` → **[[deuda_participante]]**

| | |
| --- | --- |
| Entidad origen | [[subrogacion]] (módulo 08) |
| Entidad destino | [[deuda_participante]] (módulo 08) |
| Columna | `deuda_id` — UUID |
| Cardinalidad | uno a uno opcional |
| Obligatoria | sí |
| Uno a uno | sí (columna UNIQUE) |
| Cruza módulos | no |
| Semántica | "es subrogada en" |

## Ver también

- [[08_garantia_incumplimiento]] — justificación de negocio del origen
- [[08_garantia_incumplimiento]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
