---
tags:
  - relacion
  - fk
  - modulo/11-tarifas-comisiones-impuestos-y-facturacion
origen: exencion_comision
columna: concepto_tarifa_id
destino: concepto_tarifa
modulo_origen: "11"
modulo_destino: "11"
cross_modulo: false
opcional: true
cardinalidad: "uno a muchos (0..N)"
---

# exencion_comision.concepto_tarifa_id → concepto_tarifa

> **[[exencion_comision]]** `.concepto_tarifa_id` → **[[concepto_tarifa]]**

| | |
| --- | --- |
| Entidad origen | [[exencion_comision]] (módulo 11) |
| Entidad destino | [[concepto_tarifa]] (módulo 11) |
| Columna | `concepto_tarifa_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "se exonera con" |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[11_tarifas_comisiones]] — justificación de negocio del origen
- [[11_tarifas_comisiones]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
