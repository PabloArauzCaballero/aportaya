---
tags:
  - relacion
  - fk
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
origen: alerta_monitoreo_lft
columna: caso_id
destino: caso_investigacion_lft
modulo_origen: "12"
modulo_destino: "12"
cross_modulo: false
opcional: true
cardinalidad: "uno a muchos (0..N)"
---

# alerta_monitoreo_lft.caso_id → caso_investigacion_lft

> **[[alerta_monitoreo_lft]]** `.caso_id` → **[[caso_investigacion_lft]]**

| | |
| --- | --- |
| Entidad origen | [[alerta_monitoreo_lft]] (módulo 12) |
| Entidad destino | [[caso_investigacion_lft]] (módulo 12) |
| Columna | `caso_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "agrupa" |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[12_cumplimiento_asfi]] — justificación de negocio del origen
- [[12_cumplimiento_asfi]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
