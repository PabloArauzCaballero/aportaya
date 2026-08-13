---
tags:
  - relacion
  - fk
  - modulo/11-tarifas-comisiones-impuestos-y-facturacion
origen: factura_electronica
columna: datos_facturacion_id
destino: datos_facturacion
modulo_origen: "11"
modulo_destino: "11"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# factura_electronica.datos_facturacion_id → datos_facturacion

> **[[factura_electronica]]** `.datos_facturacion_id` → **[[datos_facturacion]]**

| | |
| --- | --- |
| Entidad origen | [[factura_electronica]] (módulo 11) |
| Entidad destino | [[datos_facturacion]] (módulo 11) |
| Columna | `datos_facturacion_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "identifica" |

## Ver también

- [[11_tarifas_comisiones]] — justificación de negocio del origen
- [[11_tarifas_comisiones]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
