---
tags:
  - relacion
  - fk
  - modulo/11-tarifas-comisiones-impuestos-y-facturacion
origen: cargo_comision
columna: devengo_id
destino: devengo_comision
modulo_origen: "11"
modulo_destino: "11"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# cargo_comision.devengo_id → devengo_comision

> **[[cargo_comision]]** `.devengo_id` → **[[devengo_comision]]**

| | |
| --- | --- |
| Entidad origen | [[cargo_comision]] (módulo 11) |
| Entidad destino | [[devengo_comision]] (módulo 11) |
| Columna | `devengo_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "se cobra con" |

## Ver también

- [[11_tarifas_comisiones]] — justificación de negocio del origen
- [[11_tarifas_comisiones]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
