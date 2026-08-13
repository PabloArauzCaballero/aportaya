---
tags:
  - relacion
  - fk
  - modulo/08-garantia-incumplimiento-cobranza-y-sanciones
origen: accion_cobranza
columna: gestion_id
destino: gestion_cobranza
modulo_origen: "08"
modulo_destino: "08"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# accion_cobranza.gestion_id → gestion_cobranza

> **[[accion_cobranza]]** `.gestion_id` → **[[gestion_cobranza]]**

| | |
| --- | --- |
| Entidad origen | [[accion_cobranza]] (módulo 08) |
| Entidad destino | [[gestion_cobranza]] (módulo 08) |
| Columna | `gestion_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "ejecuta" |

## Ver también

- [[08_garantia_incumplimiento]] — justificación de negocio del origen
- [[08_garantia_incumplimiento]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
