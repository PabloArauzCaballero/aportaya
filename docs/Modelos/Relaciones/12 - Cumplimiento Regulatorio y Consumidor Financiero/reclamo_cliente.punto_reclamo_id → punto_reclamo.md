---
tags:
  - relacion
  - fk
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
origen: reclamo_cliente
columna: punto_reclamo_id
destino: punto_reclamo
modulo_origen: "12"
modulo_destino: "12"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# reclamo_cliente.punto_reclamo_id → punto_reclamo

> **[[reclamo_cliente]]** `.punto_reclamo_id` → **[[punto_reclamo]]**

| | |
| --- | --- |
| Entidad origen | [[reclamo_cliente]] (módulo 12) |
| Entidad destino | [[punto_reclamo]] (módulo 12) |
| Columna | `punto_reclamo_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "recibe" |

## Ver también

- [[12_cumplimiento_asfi]] — justificación de negocio del origen
- [[12_cumplimiento_asfi]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
