---
tags:
  - relacion
  - fk
  - modulo/14-publicidad-y-campanas
origen: revision_creativa
columna: pieza_creativa_id
destino: pieza_creativa
modulo_origen: "14"
modulo_destino: "14"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (1..N)"
---

# revision_creativa.pieza_creativa_id → pieza_creativa

> **[[revision_creativa]]** `.pieza_creativa_id` → **[[pieza_creativa]]**

| | |
| --- | --- |
| Entidad origen | [[revision_creativa]] (módulo 14) |
| Entidad destino | [[pieza_creativa]] (módulo 14) |
| Columna | `pieza_creativa_id` — UUID |
| Cardinalidad | uno a muchos (1..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "se revisa con" |

## Ver también

- [[14_publicidad_campanas]] — justificación de negocio del origen
- [[14_publicidad_campanas]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
