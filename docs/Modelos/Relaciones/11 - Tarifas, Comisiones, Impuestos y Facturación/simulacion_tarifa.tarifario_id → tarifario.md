---
tags:
  - relacion
  - fk
  - modulo/11-tarifas-comisiones-impuestos-y-facturacion
origen: simulacion_tarifa
columna: tarifario_id
destino: tarifario
modulo_origen: "11"
modulo_destino: "11"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# simulacion_tarifa.tarifario_id → tarifario

> **[[simulacion_tarifa]]** `.tarifario_id` → **[[tarifario]]**

| | |
| --- | --- |
| Entidad origen | [[simulacion_tarifa]] (módulo 11) |
| Entidad destino | [[tarifario]] (módulo 11) |
| Columna | `tarifario_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "se simula en" |

## Ver también

- [[11_tarifas_comisiones]] — justificación de negocio del origen
- [[11_tarifas_comisiones]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
