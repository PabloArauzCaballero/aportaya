---
tags:
  - relacion
  - fk
  - modulo/06-transparencia-y-reputacion
origen: componente_score
columna: puntaje_id
destino: puntaje_reputacion
modulo_origen: "06"
modulo_destino: "06"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (1..N)"
---

# componente_score.puntaje_id → puntaje_reputacion

> **[[componente_score]]** `.puntaje_id` → **[[puntaje_reputacion]]**

| | |
| --- | --- |
| Entidad origen | [[componente_score]] (módulo 06) |
| Entidad destino | [[puntaje_reputacion]] (módulo 06) |
| Columna | `puntaje_id` — UUID |
| Cardinalidad | uno a muchos (1..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "descompone en" |

## Ver también

- [[06_transparencia_reputacion]] — justificación de negocio del origen
- [[06_transparencia_reputacion]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
