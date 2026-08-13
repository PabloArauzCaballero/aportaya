---
tags:
  - relacion
  - fk
  - modulo/11-tarifas-comisiones-impuestos-y-facturacion
origen: aplicacion_promocion
columna: devengo_id
destino: devengo_comision
modulo_origen: "11"
modulo_destino: "11"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# aplicacion_promocion.devengo_id → devengo_comision

> **[[aplicacion_promocion]]** `.devengo_id` → **[[devengo_comision]]**

| | |
| --- | --- |
| Entidad origen | [[aplicacion_promocion]] (módulo 11) |
| Entidad destino | [[devengo_comision]] (módulo 11) |
| Columna | `devengo_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "se descuenta con" |

## Ver también

- [[11_tarifas_comisiones]] — justificación de negocio del origen
- [[11_tarifas_comisiones]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
