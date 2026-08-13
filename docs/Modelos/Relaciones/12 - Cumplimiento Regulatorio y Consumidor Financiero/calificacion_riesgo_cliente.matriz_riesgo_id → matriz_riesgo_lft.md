---
tags:
  - relacion
  - fk
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
origen: calificacion_riesgo_cliente
columna: matriz_riesgo_id
destino: matriz_riesgo_lft
modulo_origen: "12"
modulo_destino: "12"
cross_modulo: false
opcional: true
cardinalidad: "uno a muchos (0..N)"
---

# calificacion_riesgo_cliente.matriz_riesgo_id → matriz_riesgo_lft

> **[[calificacion_riesgo_cliente]]** `.matriz_riesgo_id` → **[[matriz_riesgo_lft]]**

| | |
| --- | --- |
| Entidad origen | [[calificacion_riesgo_cliente]] (módulo 12) |
| Entidad destino | [[matriz_riesgo_lft]] (módulo 12) |
| Columna | `matriz_riesgo_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "puntua" |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[12_cumplimiento_asfi]] — justificación de negocio del origen
- [[12_cumplimiento_asfi]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
