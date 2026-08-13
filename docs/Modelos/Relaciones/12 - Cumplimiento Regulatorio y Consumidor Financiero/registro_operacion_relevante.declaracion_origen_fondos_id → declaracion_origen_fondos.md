---
tags:
  - relacion
  - fk
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
origen: registro_operacion_relevante
columna: declaracion_origen_fondos_id
destino: declaracion_origen_fondos
modulo_origen: "12"
modulo_destino: "12"
cross_modulo: false
opcional: true
cardinalidad: "no declarada en el diagrama"
---

# registro_operacion_relevante.declaracion_origen_fondos_id → declaracion_origen_fondos

> **[[registro_operacion_relevante]]** `.declaracion_origen_fondos_id` → **[[declaracion_origen_fondos]]**

| | |
| --- | --- |
| Entidad origen | [[registro_operacion_relevante]] (módulo 12) |
| Entidad destino | [[declaracion_origen_fondos]] (módulo 12) |
| Columna | `declaracion_origen_fondos_id` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | no |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[12_cumplimiento_asfi]] — justificación de negocio del origen
- [[12_cumplimiento_asfi]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
