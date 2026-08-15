---
tags:
  - relacion
  - fk
  - modulo/13-contabilidad-financiera-y-erp
origen: factura_proveedor
columna: orden_compra_id
destino: orden_compra
modulo_origen: "13"
modulo_destino: "13"
cross_modulo: false
opcional: true
cardinalidad: "uno a muchos (0..N)"
---

# factura_proveedor.orden_compra_id → orden_compra

> **[[factura_proveedor]]** `.orden_compra_id` → **[[orden_compra]]**

| | |
| --- | --- |
| Entidad origen | [[factura_proveedor]] (módulo 13) |
| Entidad destino | [[orden_compra]] (módulo 13) |
| Columna | `orden_compra_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "genera" |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[13_contabilidad_erp]] — justificación de negocio del origen
- [[13_contabilidad_erp]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
