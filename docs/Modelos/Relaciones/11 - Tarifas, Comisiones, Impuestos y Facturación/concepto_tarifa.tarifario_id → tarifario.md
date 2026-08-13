---
tags:
  - relacion
  - fk
  - modulo/11-tarifas-comisiones-impuestos-y-facturacion
origen: concepto_tarifa
columna: tarifario_id
destino: tarifario
modulo_origen: "11"
modulo_destino: "11"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (1..N)"
---

# concepto_tarifa.tarifario_id → tarifario

> **[[concepto_tarifa]]** `.tarifario_id` → **[[tarifario]]**

| | |
| --- | --- |
| Entidad origen | [[concepto_tarifa]] (módulo 11) |
| Entidad destino | [[tarifario]] (módulo 11) |
| Columna | `tarifario_id` — UUID |
| Cardinalidad | uno a muchos (1..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "contiene" |

## Ver también

- [[11_tarifas_comisiones]] — justificación de negocio del origen
- [[11_tarifas_comisiones]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
