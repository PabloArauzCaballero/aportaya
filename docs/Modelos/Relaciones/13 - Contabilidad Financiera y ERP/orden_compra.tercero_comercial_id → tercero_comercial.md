---
tags:
  - relacion
  - fk
  - modulo/13-contabilidad-financiera-y-erp
origen: orden_compra
columna: tercero_comercial_id
destino: tercero_comercial
modulo_origen: "13"
modulo_destino: "13"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# orden_compra.tercero_comercial_id → tercero_comercial

> **[[orden_compra]]** `.tercero_comercial_id` → **[[tercero_comercial]]**

| | |
| --- | --- |
| Entidad origen | [[orden_compra]] (módulo 13) |
| Entidad destino | [[tercero_comercial]] (módulo 13) |
| Columna | `tercero_comercial_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "recibe" |

## Ver también

- [[13_contabilidad_erp]] — justificación de negocio del origen
- [[13_contabilidad_erp]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
