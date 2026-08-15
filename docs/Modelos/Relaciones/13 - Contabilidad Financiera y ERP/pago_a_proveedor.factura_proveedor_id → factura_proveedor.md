---
tags:
  - relacion
  - fk
  - modulo/13-contabilidad-financiera-y-erp
origen: pago_a_proveedor
columna: factura_proveedor_id
destino: factura_proveedor
modulo_origen: "13"
modulo_destino: "13"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# pago_a_proveedor.factura_proveedor_id → factura_proveedor

> **[[pago_a_proveedor]]** `.factura_proveedor_id` → **[[factura_proveedor]]**

| | |
| --- | --- |
| Entidad origen | [[pago_a_proveedor]] (módulo 13) |
| Entidad destino | [[factura_proveedor]] (módulo 13) |
| Columna | `factura_proveedor_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "se paga con" |

## Ver también

- [[13_contabilidad_erp]] — justificación de negocio del origen
- [[13_contabilidad_erp]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
