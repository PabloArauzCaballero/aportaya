---
tags:
  - relacion
  - fk
  - modulo/14-publicidad-y-campanas
origen: anuncio
columna: conjunto_anuncios_id
destino: conjunto_anuncios
modulo_origen: "14"
modulo_destino: "14"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (1..N)"
---

# anuncio.conjunto_anuncios_id → conjunto_anuncios

> **[[anuncio]]** `.conjunto_anuncios_id` → **[[conjunto_anuncios]]**

| | |
| --- | --- |
| Entidad origen | [[anuncio]] (módulo 14) |
| Entidad destino | [[conjunto_anuncios]] (módulo 14) |
| Columna | `conjunto_anuncios_id` — UUID |
| Cardinalidad | uno a muchos (1..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "entrega" |

## Ver también

- [[14_publicidad_campanas]] — justificación de negocio del origen
- [[14_publicidad_campanas]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
