---
tags:
  - relacion
  - fk
  - modulo/14-publicidad-y-campanas
origen: conjunto_anuncios
columna: espacio_publicitario_id
destino: espacio_publicitario
modulo_origen: "14"
modulo_destino: "14"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# conjunto_anuncios.espacio_publicitario_id → espacio_publicitario

> **[[conjunto_anuncios]]** `.espacio_publicitario_id` → **[[espacio_publicitario]]**

| | |
| --- | --- |
| Entidad origen | [[conjunto_anuncios]] (módulo 14) |
| Entidad destino | [[espacio_publicitario]] (módulo 14) |
| Columna | `espacio_publicitario_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "ubica" |

## Ver también

- [[14_publicidad_campanas]] — justificación de negocio del origen
- [[14_publicidad_campanas]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
