---
tags:
  - relacion
  - fk
  - modulo/11-tarifas-comisiones-impuestos-y-facturacion
origen: devengo_comision
columna: cotizacion_id
destino: cotizacion_comision
modulo_origen: "11"
modulo_destino: "11"
cross_modulo: false
opcional: true
cardinalidad: "uno a uno opcional"
---

# devengo_comision.cotizacion_id → cotizacion_comision

> **[[devengo_comision]]** `.cotizacion_id` → **[[cotizacion_comision]]**

| | |
| --- | --- |
| Entidad origen | [[devengo_comision]] (módulo 11) |
| Entidad destino | [[cotizacion_comision]] (módulo 11) |
| Columna | `cotizacion_id` — UUID |
| Cardinalidad | uno a uno opcional |
| Obligatoria | no (admite NULL) |
| Uno a uno | sí (columna UNIQUE) |
| Cruza módulos | no |
| Semántica | "se confirma como" |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[11_tarifas_comisiones]] — justificación de negocio del origen
- [[11_tarifas_comisiones]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
