---
tags:
  - relacion
  - fk
  - modulo/11-tarifas-comisiones-impuestos-y-facturacion
origen: cambio_tarifario
columna: tarifario_nuevo_id
destino: tarifario
modulo_origen: "11"
modulo_destino: "11"
cross_modulo: false
opcional: false
cardinalidad: "uno a uno opcional"
---

# cambio_tarifario.tarifario_nuevo_id → tarifario

> **[[cambio_tarifario]]** `.tarifario_nuevo_id` → **[[tarifario]]**

| | |
| --- | --- |
| Entidad origen | [[cambio_tarifario]] (módulo 11) |
| Entidad destino | [[tarifario]] (módulo 11) |
| Columna | `tarifario_nuevo_id` — UUID |
| Cardinalidad | uno a uno opcional |
| Obligatoria | sí |
| Uno a uno | sí (columna UNIQUE) |
| Cruza módulos | no |
| Semántica | "se cambia con" |

## Ver también

- [[11_tarifas_comisiones]] — justificación de negocio del origen
- [[11_tarifas_comisiones]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
