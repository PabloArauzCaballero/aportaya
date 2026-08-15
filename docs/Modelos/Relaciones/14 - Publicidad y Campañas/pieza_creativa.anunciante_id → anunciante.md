---
tags:
  - relacion
  - fk
  - modulo/14-publicidad-y-campanas
origen: pieza_creativa
columna: anunciante_id
destino: anunciante
modulo_origen: "14"
modulo_destino: "14"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# pieza_creativa.anunciante_id → anunciante

> **[[pieza_creativa]]** `.anunciante_id` → **[[anunciante]]**

| | |
| --- | --- |
| Entidad origen | [[pieza_creativa]] (módulo 14) |
| Entidad destino | [[anunciante]] (módulo 14) |
| Columna | `anunciante_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "crea" |

## Ver también

- [[14_publicidad_campanas]] — justificación de negocio del origen
- [[14_publicidad_campanas]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
