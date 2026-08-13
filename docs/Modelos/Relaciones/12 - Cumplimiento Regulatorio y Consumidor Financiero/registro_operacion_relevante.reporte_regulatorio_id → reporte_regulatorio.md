---
tags:
  - relacion
  - fk
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
origen: registro_operacion_relevante
columna: reporte_regulatorio_id
destino: reporte_regulatorio
modulo_origen: "12"
modulo_destino: "12"
cross_modulo: false
opcional: true
cardinalidad: "muchos a uno opcional"
---

# registro_operacion_relevante.reporte_regulatorio_id → reporte_regulatorio

> **[[registro_operacion_relevante]]** `.reporte_regulatorio_id` → **[[reporte_regulatorio]]**

| | |
| --- | --- |
| Entidad origen | [[registro_operacion_relevante]] (módulo 12) |
| Entidad destino | [[reporte_regulatorio]] (módulo 12) |
| Columna | `reporte_regulatorio_id` — UUID |
| Cardinalidad | muchos a uno opcional |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "se reporta en" |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[12_cumplimiento_asfi]] — justificación de negocio del origen
- [[12_cumplimiento_asfi]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
