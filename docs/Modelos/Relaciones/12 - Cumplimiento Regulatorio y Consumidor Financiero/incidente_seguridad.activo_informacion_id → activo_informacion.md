---
tags:
  - relacion
  - fk
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
origen: incidente_seguridad
columna: activo_informacion_id
destino: activo_informacion
modulo_origen: "12"
modulo_destino: "12"
cross_modulo: false
opcional: true
cardinalidad: "uno a muchos (0..N)"
---

# incidente_seguridad.activo_informacion_id → activo_informacion

> **[[incidente_seguridad]]** `.activo_informacion_id` → **[[activo_informacion]]**

| | |
| --- | --- |
| Entidad origen | [[incidente_seguridad]] (módulo 12) |
| Entidad destino | [[activo_informacion]] (módulo 12) |
| Columna | `activo_informacion_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "sufre" |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[12_cumplimiento_asfi]] — justificación de negocio del origen
- [[12_cumplimiento_asfi]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
