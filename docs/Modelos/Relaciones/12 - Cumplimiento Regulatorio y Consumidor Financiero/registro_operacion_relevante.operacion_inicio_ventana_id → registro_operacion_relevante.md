---
tags:
  - relacion
  - fk
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
origen: registro_operacion_relevante
columna: operacion_inicio_ventana_id
destino: registro_operacion_relevante
modulo_origen: "12"
modulo_destino: "12"
cross_modulo: false
opcional: true
cardinalidad: "uno a muchos, origen opcional"
---

# registro_operacion_relevante.operacion_inicio_ventana_id → registro_operacion_relevante

> **[[registro_operacion_relevante]]** `.operacion_inicio_ventana_id` → **[[registro_operacion_relevante]]**

| | |
| --- | --- |
| Entidad origen | [[registro_operacion_relevante]] (módulo 12) |
| Entidad destino | [[registro_operacion_relevante]] (módulo 12) |
| Columna | `operacion_inicio_ventana_id` — UUID |
| Cardinalidad | uno a muchos, origen opcional |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "inicia ventana de" |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[12_cumplimiento_asfi]] — justificación de negocio del origen
- [[12_cumplimiento_asfi]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
