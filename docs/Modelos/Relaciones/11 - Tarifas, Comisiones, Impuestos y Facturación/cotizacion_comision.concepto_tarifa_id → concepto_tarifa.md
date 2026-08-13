---
tags:
  - relacion
  - fk
  - modulo/11-tarifas-comisiones-impuestos-y-facturacion
origen: cotizacion_comision
columna: concepto_tarifa_id
destino: concepto_tarifa
modulo_origen: "11"
modulo_destino: "11"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# cotizacion_comision.concepto_tarifa_id → concepto_tarifa

> **[[cotizacion_comision]]** `.concepto_tarifa_id` → **[[concepto_tarifa]]**

| | |
| --- | --- |
| Entidad origen | [[cotizacion_comision]] (módulo 11) |
| Entidad destino | [[concepto_tarifa]] (módulo 11) |
| Columna | `concepto_tarifa_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "cotiza" |

## Ver también

- [[11_tarifas_comisiones]] — justificación de negocio del origen
- [[11_tarifas_comisiones]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
