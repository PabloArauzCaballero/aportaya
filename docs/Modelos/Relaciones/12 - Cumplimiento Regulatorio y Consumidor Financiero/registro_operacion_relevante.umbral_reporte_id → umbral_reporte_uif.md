---
tags:
  - relacion
  - fk
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
origen: registro_operacion_relevante
columna: umbral_reporte_id
destino: umbral_reporte_uif
modulo_origen: "12"
modulo_destino: "12"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# registro_operacion_relevante.umbral_reporte_id → umbral_reporte_uif

> **[[registro_operacion_relevante]]** `.umbral_reporte_id` → **[[umbral_reporte_uif]]**

| | |
| --- | --- |
| Entidad origen | [[registro_operacion_relevante]] (módulo 12) |
| Entidad destino | [[umbral_reporte_uif]] (módulo 12) |
| Columna | `umbral_reporte_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "clasifica" |

## Ver también

- [[12_cumplimiento_asfi]] — justificación de negocio del origen
- [[12_cumplimiento_asfi]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
