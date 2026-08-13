---
tags:
  - relacion
  - fk
  - modulo/11-tarifas-comisiones-impuestos-y-facturacion
origen: costo_proveedor_operacion
columna: liquidacion_ingresos_id
destino: liquidacion_ingresos
modulo_origen: "11"
modulo_destino: "11"
cross_modulo: false
opcional: true
cardinalidad: "uno a muchos (0..N)"
---

# costo_proveedor_operacion.liquidacion_ingresos_id → liquidacion_ingresos

> **[[costo_proveedor_operacion]]** `.liquidacion_ingresos_id` → **[[liquidacion_ingresos]]**

| | |
| --- | --- |
| Entidad origen | [[costo_proveedor_operacion]] (módulo 11) |
| Entidad destino | [[liquidacion_ingresos]] (módulo 11) |
| Columna | `liquidacion_ingresos_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "consolida" |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[11_tarifas_comisiones]] — justificación de negocio del origen
- [[11_tarifas_comisiones]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
