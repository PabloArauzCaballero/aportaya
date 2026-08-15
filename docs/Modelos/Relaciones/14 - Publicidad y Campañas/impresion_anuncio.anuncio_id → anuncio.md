---
tags:
  - relacion
  - fk
  - modulo/14-publicidad-y-campanas
origen: impresion_anuncio
columna: anuncio_id
destino: anuncio
modulo_origen: "14"
modulo_destino: "14"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# impresion_anuncio.anuncio_id → anuncio

> **[[impresion_anuncio]]** `.anuncio_id` → **[[anuncio]]**

| | |
| --- | --- |
| Entidad origen | [[impresion_anuncio]] (módulo 14) |
| Entidad destino | [[anuncio]] (módulo 14) |
| Columna | `anuncio_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "se muestra en" |

## Ver también

- [[14_publicidad_campanas]] — justificación de negocio del origen
- [[14_publicidad_campanas]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
