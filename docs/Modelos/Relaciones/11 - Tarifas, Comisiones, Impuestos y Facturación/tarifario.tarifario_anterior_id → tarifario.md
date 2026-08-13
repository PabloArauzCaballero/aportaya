---
tags:
  - relacion
  - fk
  - modulo/11-tarifas-comisiones-impuestos-y-facturacion
origen: tarifario
columna: tarifario_anterior_id
destino: tarifario
modulo_origen: "11"
modulo_destino: "11"
cross_modulo: false
opcional: true
cardinalidad: "uno a muchos, origen opcional"
---

# tarifario.tarifario_anterior_id → tarifario

> **[[tarifario]]** `.tarifario_anterior_id` → **[[tarifario]]**

| | |
| --- | --- |
| Entidad origen | [[tarifario]] (módulo 11) |
| Entidad destino | [[tarifario]] (módulo 11) |
| Columna | `tarifario_anterior_id` — UUID |
| Cardinalidad | uno a muchos, origen opcional |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "sustituye a" |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[11_tarifas_comisiones]] — justificación de negocio del origen
- [[11_tarifas_comisiones]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
