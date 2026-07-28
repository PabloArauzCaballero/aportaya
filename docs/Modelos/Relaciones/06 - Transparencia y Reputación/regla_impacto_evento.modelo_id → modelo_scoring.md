---
tags:
  - relacion
  - fk
  - modulo/06-transparencia-y-reputacion
origen: regla_impacto_evento
columna: modelo_id
destino: modelo_scoring
modulo_origen: "06"
modulo_destino: "06"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# regla_impacto_evento.modelo_id → modelo_scoring

> **[[regla_impacto_evento]]** `.modelo_id` → **[[modelo_scoring]]**

| | |
| --- | --- |
| Entidad origen | [[regla_impacto_evento]] (módulo 06) |
| Entidad destino | [[modelo_scoring]] (módulo 06) |
| Columna | `modelo_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "define impactos" |

## Ver también

- [[06_transparencia_reputacion]] — justificación de negocio del origen
- [[06_transparencia_reputacion]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
