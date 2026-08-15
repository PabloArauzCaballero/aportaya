---
tags:
  - relacion
  - fk
  - modulo/14-publicidad-y-campanas
origen: conjunto_anuncios
columna: campana_publicitaria_id
destino: campana_publicitaria
modulo_origen: "14"
modulo_destino: "14"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (1..N)"
---

# conjunto_anuncios.campana_publicitaria_id → campana_publicitaria

> **[[conjunto_anuncios]]** `.campana_publicitaria_id` → **[[campana_publicitaria]]**

| | |
| --- | --- |
| Entidad origen | [[conjunto_anuncios]] (módulo 14) |
| Entidad destino | [[campana_publicitaria]] (módulo 14) |
| Columna | `campana_publicitaria_id` — UUID |
| Cardinalidad | uno a muchos (1..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "reparte en" |

## Ver también

- [[14_publicidad_campanas]] — justificación de negocio del origen
- [[14_publicidad_campanas]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
