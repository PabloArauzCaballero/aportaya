---
tags:
  - relacion
  - fk
  - modulo/09-auditoria-reportes-y-cumplimiento
origen: proceso_anonimizacion
columna: solicitud_id
destino: solicitud_datos_personales
modulo_origen: "09"
modulo_destino: "09"
cross_modulo: false
opcional: true
cardinalidad: "uno a uno opcional"
---

# proceso_anonimizacion.solicitud_id → solicitud_datos_personales

> **[[proceso_anonimizacion]]** `.solicitud_id` → **[[solicitud_datos_personales]]**

| | |
| --- | --- |
| Entidad origen | [[proceso_anonimizacion]] (módulo 09) |
| Entidad destino | [[solicitud_datos_personales]] (módulo 09) |
| Columna | `solicitud_id` — UUID |
| Cardinalidad | uno a uno opcional |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "ejecuta" |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[09_auditoria_reportes]] — justificación de negocio del origen
- [[09_auditoria_reportes]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
