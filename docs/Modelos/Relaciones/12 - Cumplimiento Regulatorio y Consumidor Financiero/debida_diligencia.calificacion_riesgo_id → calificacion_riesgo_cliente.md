---
tags:
  - relacion
  - fk
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
origen: debida_diligencia
columna: calificacion_riesgo_id
destino: calificacion_riesgo_cliente
modulo_origen: "12"
modulo_destino: "12"
cross_modulo: false
opcional: true
cardinalidad: "uno a muchos (0..N)"
---

# debida_diligencia.calificacion_riesgo_id → calificacion_riesgo_cliente

> **[[debida_diligencia]]** `.calificacion_riesgo_id` → **[[calificacion_riesgo_cliente]]**

| | |
| --- | --- |
| Entidad origen | [[debida_diligencia]] (módulo 12) |
| Entidad destino | [[calificacion_riesgo_cliente]] (módulo 12) |
| Columna | `calificacion_riesgo_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "exige" |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[12_cumplimiento_asfi]] — justificación de negocio del origen
- [[12_cumplimiento_asfi]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
