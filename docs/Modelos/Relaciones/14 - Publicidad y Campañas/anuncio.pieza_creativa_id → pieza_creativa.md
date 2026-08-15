---
tags:
  - relacion
  - fk
  - modulo/14-publicidad-y-campanas
origen: anuncio
columna: pieza_creativa_id
destino: pieza_creativa
modulo_origen: "14"
modulo_destino: "14"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# anuncio.pieza_creativa_id → pieza_creativa

> **[[anuncio]]** `.pieza_creativa_id` → **[[pieza_creativa]]**

| | |
| --- | --- |
| Entidad origen | [[anuncio]] (módulo 14) |
| Entidad destino | [[pieza_creativa]] (módulo 14) |
| Columna | `pieza_creativa_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "protagoniza" |

## Ver también

- [[14_publicidad_campanas]] — justificación de negocio del origen
- [[14_publicidad_campanas]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
