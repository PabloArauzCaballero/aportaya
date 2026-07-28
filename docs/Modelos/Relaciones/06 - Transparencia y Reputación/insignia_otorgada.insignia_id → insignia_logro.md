---
tags:
  - relacion
  - fk
  - modulo/06-transparencia-y-reputacion
origen: insignia_otorgada
columna: insignia_id
destino: insignia_logro
modulo_origen: "06"
modulo_destino: "06"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# insignia_otorgada.insignia_id → insignia_logro

> **[[insignia_otorgada]]** `.insignia_id` → **[[insignia_logro]]**

| | |
| --- | --- |
| Entidad origen | [[insignia_otorgada]] (módulo 06) |
| Entidad destino | [[insignia_logro]] (módulo 06) |
| Columna | `insignia_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "se otorga como" |

## Ver también

- [[06_transparencia_reputacion]] — justificación de negocio del origen
- [[06_transparencia_reputacion]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
