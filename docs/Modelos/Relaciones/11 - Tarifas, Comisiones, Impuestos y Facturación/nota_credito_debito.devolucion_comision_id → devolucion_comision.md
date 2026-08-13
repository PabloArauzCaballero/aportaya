---
tags:
  - relacion
  - fk
  - modulo/11-tarifas-comisiones-impuestos-y-facturacion
origen: nota_credito_debito
columna: devolucion_comision_id
destino: devolucion_comision
modulo_origen: "11"
modulo_destino: "11"
cross_modulo: false
opcional: true
cardinalidad: "uno a uno opcional"
---

# nota_credito_debito.devolucion_comision_id → devolucion_comision

> **[[nota_credito_debito]]** `.devolucion_comision_id` → **[[devolucion_comision]]**

| | |
| --- | --- |
| Entidad origen | [[nota_credito_debito]] (módulo 11) |
| Entidad destino | [[devolucion_comision]] (módulo 11) |
| Columna | `devolucion_comision_id` — UUID |
| Cardinalidad | uno a uno opcional |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "respalda con" |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[11_tarifas_comisiones]] — justificación de negocio del origen
- [[11_tarifas_comisiones]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
