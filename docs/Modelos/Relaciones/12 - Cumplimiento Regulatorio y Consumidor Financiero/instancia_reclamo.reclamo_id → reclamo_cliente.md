---
tags:
  - relacion
  - fk
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
origen: instancia_reclamo
columna: reclamo_id
destino: reclamo_cliente
modulo_origen: "12"
modulo_destino: "12"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# instancia_reclamo.reclamo_id → reclamo_cliente

> **[[instancia_reclamo]]** `.reclamo_id` → **[[reclamo_cliente]]**

| | |
| --- | --- |
| Entidad origen | [[instancia_reclamo]] (módulo 12) |
| Entidad destino | [[reclamo_cliente]] (módulo 12) |
| Columna | `reclamo_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "se eleva a" |

## Ver también

- [[12_cumplimiento_asfi]] — justificación de negocio del origen
- [[12_cumplimiento_asfi]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
