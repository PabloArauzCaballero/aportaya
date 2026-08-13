---
tags:
  - relacion
  - fk
  - modulo/11-tarifas-comisiones-impuestos-y-facturacion
origen: factura_electronica
columna: devengo_id
destino: devengo_comision
modulo_origen: "11"
modulo_destino: "11"
cross_modulo: false
opcional: true
cardinalidad: "uno a uno opcional"
---

# factura_electronica.devengo_id → devengo_comision

> **[[factura_electronica]]** `.devengo_id` → **[[devengo_comision]]**

| | |
| --- | --- |
| Entidad origen | [[factura_electronica]] (módulo 11) |
| Entidad destino | [[devengo_comision]] (módulo 11) |
| Columna | `devengo_id` — UUID |
| Cardinalidad | uno a uno opcional |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "se factura en" |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[11_tarifas_comisiones]] — justificación de negocio del origen
- [[11_tarifas_comisiones]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
