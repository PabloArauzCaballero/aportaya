---
tags:
  - relacion
  - fk
  - modulo/14-publicidad-y-campanas
origen: clic_anuncio
columna: impresion_id
destino: impresion_anuncio
modulo_origen: "14"
modulo_destino: "14"
cross_modulo: false
opcional: false
cardinalidad: "uno a uno opcional"
---

# clic_anuncio.impresion_id → impresion_anuncio

> **[[clic_anuncio]]** `.impresion_id` → **[[impresion_anuncio]]**

| | |
| --- | --- |
| Entidad origen | [[clic_anuncio]] (módulo 14) |
| Entidad destino | [[impresion_anuncio]] (módulo 14) |
| Columna | `impresion_id` — UUID |
| Cardinalidad | uno a uno opcional |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "puede derivar en" |

## Ver también

- [[14_publicidad_campanas]] — justificación de negocio del origen
- [[14_publicidad_campanas]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
