---
tags:
  - relacion
  - fk
  - modulo/06-transparencia-y-reputacion
origen: registro_sellado
columna: bloque_id
destino: bloque_transparencia
modulo_origen: "06"
modulo_destino: "06"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (1..N)"
---

# registro_sellado.bloque_id → bloque_transparencia

> **[[registro_sellado]]** `.bloque_id` → **[[bloque_transparencia]]**

| | |
| --- | --- |
| Entidad origen | [[registro_sellado]] (módulo 06) |
| Entidad destino | [[bloque_transparencia]] (módulo 06) |
| Columna | `bloque_id` — UUID |
| Cardinalidad | uno a muchos (1..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "sella" |

## Ver también

- [[06_transparencia_reputacion]] — justificación de negocio del origen
- [[06_transparencia_reputacion]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
