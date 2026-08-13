---
tags:
  - relacion
  - fk
  - modulo/11-tarifas-comisiones-impuestos-y-facturacion
origen: cuenta_por_cobrar_comision
columna: devengo_id
destino: devengo_comision
modulo_origen: "11"
modulo_destino: "11"
cross_modulo: false
opcional: false
cardinalidad: "uno a uno opcional"
---

# cuenta_por_cobrar_comision.devengo_id → devengo_comision

> **[[cuenta_por_cobrar_comision]]** `.devengo_id` → **[[devengo_comision]]**

| | |
| --- | --- |
| Entidad origen | [[cuenta_por_cobrar_comision]] (módulo 11) |
| Entidad destino | [[devengo_comision]] (módulo 11) |
| Columna | `devengo_id` — UUID |
| Cardinalidad | uno a uno opcional |
| Obligatoria | sí |
| Uno a uno | sí (columna UNIQUE) |
| Cruza módulos | no |
| Semántica | "queda por cobrar en" |

## Ver también

- [[11_tarifas_comisiones]] — justificación de negocio del origen
- [[11_tarifas_comisiones]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
