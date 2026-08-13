---
tags:
  - relacion
  - fk
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
origen: acta_comite
columna: comite_gobierno_id
destino: comite_gobierno
modulo_origen: "12"
modulo_destino: "12"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# acta_comite.comite_gobierno_id → comite_gobierno

> **[[acta_comite]]** `.comite_gobierno_id` → **[[comite_gobierno]]**

| | |
| --- | --- |
| Entidad origen | [[acta_comite]] (módulo 12) |
| Entidad destino | [[comite_gobierno]] (módulo 12) |
| Columna | `comite_gobierno_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "sesiona en" |

## Ver también

- [[12_cumplimiento_asfi]] — justificación de negocio del origen
- [[12_cumplimiento_asfi]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
