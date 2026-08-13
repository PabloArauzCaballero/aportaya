---
tags:
  - relacion
  - fk
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
origen: incidente_seguridad
columna: evento_riesgo_id
destino: evento_riesgo_operativo
modulo_origen: "12"
modulo_destino: "12"
cross_modulo: false
opcional: true
cardinalidad: "muchos a uno opcional"
---

# incidente_seguridad.evento_riesgo_id → evento_riesgo_operativo

> **[[incidente_seguridad]]** `.evento_riesgo_id` → **[[evento_riesgo_operativo]]**

| | |
| --- | --- |
| Entidad origen | [[incidente_seguridad]] (módulo 12) |
| Entidad destino | [[evento_riesgo_operativo]] (módulo 12) |
| Columna | `evento_riesgo_id` — UUID |
| Cardinalidad | muchos a uno opcional |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "puede escalar a" |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[12_cumplimiento_asfi]] — justificación de negocio del origen
- [[12_cumplimiento_asfi]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
