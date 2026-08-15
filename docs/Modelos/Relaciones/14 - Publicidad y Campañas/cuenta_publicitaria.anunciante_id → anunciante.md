---
tags:
  - relacion
  - fk
  - modulo/14-publicidad-y-campanas
origen: cuenta_publicitaria
columna: anunciante_id
destino: anunciante
modulo_origen: "14"
modulo_destino: "14"
cross_modulo: false
opcional: false
cardinalidad: "uno a uno opcional"
---

# cuenta_publicitaria.anunciante_id → anunciante

> **[[cuenta_publicitaria]]** `.anunciante_id` → **[[anunciante]]**

| | |
| --- | --- |
| Entidad origen | [[cuenta_publicitaria]] (módulo 14) |
| Entidad destino | [[anunciante]] (módulo 14) |
| Columna | `anunciante_id` — UUID |
| Cardinalidad | uno a uno opcional |
| Obligatoria | sí |
| Uno a uno | sí (columna UNIQUE) |
| Cruza módulos | no |
| Semántica | "opera" |

## Ver también

- [[14_publicidad_campanas]] — justificación de negocio del origen
- [[14_publicidad_campanas]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
