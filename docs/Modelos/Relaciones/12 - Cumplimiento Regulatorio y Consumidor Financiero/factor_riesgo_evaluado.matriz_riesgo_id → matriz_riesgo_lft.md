---
tags:
  - relacion
  - fk
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
origen: factor_riesgo_evaluado
columna: matriz_riesgo_id
destino: matriz_riesgo_lft
modulo_origen: "12"
modulo_destino: "12"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# factor_riesgo_evaluado.matriz_riesgo_id → matriz_riesgo_lft

> **[[factor_riesgo_evaluado]]** `.matriz_riesgo_id` → **[[matriz_riesgo_lft]]**

| | |
| --- | --- |
| Entidad origen | [[factor_riesgo_evaluado]] (módulo 12) |
| Entidad destino | [[matriz_riesgo_lft]] (módulo 12) |
| Columna | `matriz_riesgo_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "evalua" |

## Ver también

- [[12_cumplimiento_asfi]] — justificación de negocio del origen
- [[12_cumplimiento_asfi]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
