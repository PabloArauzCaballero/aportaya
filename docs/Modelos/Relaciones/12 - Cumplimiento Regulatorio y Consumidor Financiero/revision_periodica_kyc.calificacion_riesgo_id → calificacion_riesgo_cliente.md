---
tags:
  - relacion
  - fk
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
origen: revision_periodica_kyc
columna: calificacion_riesgo_id
destino: calificacion_riesgo_cliente
modulo_origen: "12"
modulo_destino: "12"
cross_modulo: false
opcional: true
cardinalidad: "uno a muchos (0..N)"
---

# revision_periodica_kyc.calificacion_riesgo_id → calificacion_riesgo_cliente

> **[[revision_periodica_kyc]]** `.calificacion_riesgo_id` → **[[calificacion_riesgo_cliente]]**

| | |
| --- | --- |
| Entidad origen | [[revision_periodica_kyc]] (módulo 12) |
| Entidad destino | [[calificacion_riesgo_cliente]] (módulo 12) |
| Columna | `calificacion_riesgo_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "programa" |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[12_cumplimiento_asfi]] — justificación de negocio del origen
- [[12_cumplimiento_asfi]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
