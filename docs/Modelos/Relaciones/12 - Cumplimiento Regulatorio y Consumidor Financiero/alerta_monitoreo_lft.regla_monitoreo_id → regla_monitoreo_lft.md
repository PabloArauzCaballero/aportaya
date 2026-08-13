---
tags:
  - relacion
  - fk
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
origen: alerta_monitoreo_lft
columna: regla_monitoreo_id
destino: regla_monitoreo_lft
modulo_origen: "12"
modulo_destino: "12"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# alerta_monitoreo_lft.regla_monitoreo_id → regla_monitoreo_lft

> **[[alerta_monitoreo_lft]]** `.regla_monitoreo_id` → **[[regla_monitoreo_lft]]**

| | |
| --- | --- |
| Entidad origen | [[alerta_monitoreo_lft]] (módulo 12) |
| Entidad destino | [[regla_monitoreo_lft]] (módulo 12) |
| Columna | `regla_monitoreo_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "detecta" |

## Ver también

- [[12_cumplimiento_asfi]] — justificación de negocio del origen
- [[12_cumplimiento_asfi]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
