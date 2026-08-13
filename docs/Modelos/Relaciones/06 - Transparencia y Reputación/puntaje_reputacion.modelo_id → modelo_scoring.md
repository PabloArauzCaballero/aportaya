---
tags:
  - relacion
  - fk
  - modulo/06-transparencia-y-reputacion
origen: puntaje_reputacion
columna: modelo_id
destino: modelo_scoring
modulo_origen: "06"
modulo_destino: "06"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# puntaje_reputacion.modelo_id → modelo_scoring

> **[[puntaje_reputacion]]** `.modelo_id` → **[[modelo_scoring]]**

| | |
| --- | --- |
| Entidad origen | [[puntaje_reputacion]] (módulo 06) |
| Entidad destino | [[modelo_scoring]] (módulo 06) |
| Columna | `modelo_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "calcula" |

## Ver también

- [[06_transparencia_reputacion]] — justificación de negocio del origen
- [[06_transparencia_reputacion]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
