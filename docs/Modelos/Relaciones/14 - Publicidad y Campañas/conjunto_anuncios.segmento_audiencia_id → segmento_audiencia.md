---
tags:
  - relacion
  - fk
  - modulo/14-publicidad-y-campanas
origen: conjunto_anuncios
columna: segmento_audiencia_id
destino: segmento_audiencia
modulo_origen: "14"
modulo_destino: "14"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# conjunto_anuncios.segmento_audiencia_id → segmento_audiencia

> **[[conjunto_anuncios]]** `.segmento_audiencia_id` → **[[segmento_audiencia]]**

| | |
| --- | --- |
| Entidad origen | [[conjunto_anuncios]] (módulo 14) |
| Entidad destino | [[segmento_audiencia]] (módulo 14) |
| Columna | `segmento_audiencia_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "segmenta" |

## Ver también

- [[14_publicidad_campanas]] — justificación de negocio del origen
- [[14_publicidad_campanas]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
