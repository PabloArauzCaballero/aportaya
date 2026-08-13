---
tags:
  - relacion
  - fk
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
origen: desvio_perfil
columna: alerta_monitoreo_id
destino: alerta_monitoreo_lft
modulo_origen: "12"
modulo_destino: "12"
cross_modulo: false
opcional: true
cardinalidad: "muchos a uno opcional"
---

# desvio_perfil.alerta_monitoreo_id → alerta_monitoreo_lft

> **[[desvio_perfil]]** `.alerta_monitoreo_id` → **[[alerta_monitoreo_lft]]**

| | |
| --- | --- |
| Entidad origen | [[desvio_perfil]] (módulo 12) |
| Entidad destino | [[alerta_monitoreo_lft]] (módulo 12) |
| Columna | `alerta_monitoreo_id` — UUID |
| Cardinalidad | muchos a uno opcional |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "genera" |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[12_cumplimiento_asfi]] — justificación de negocio del origen
- [[12_cumplimiento_asfi]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
