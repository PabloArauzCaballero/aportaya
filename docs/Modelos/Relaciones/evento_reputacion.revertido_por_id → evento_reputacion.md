---
tags:
  - relacion
  - fk
  - modulo/06-transparencia-y-reputacion
origen: evento_reputacion
columna: revertido_por_id
destino: evento_reputacion
modulo_origen: "06"
modulo_destino: "06"
cross_modulo: false
opcional: true
cardinalidad: "no declarada en el diagrama"
---

# evento_reputacion.revertido_por_id → evento_reputacion

> **[[evento_reputacion]]** `.revertido_por_id` → **[[evento_reputacion]]**

| | |
| --- | --- |
| Entidad origen | [[evento_reputacion]] (módulo 06) |
| Entidad destino | [[evento_reputacion]] (módulo 06) |
| Columna | `revertido_por_id` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | no |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[06_transparencia_reputacion]] — justificación de negocio del origen
- [[06_transparencia_reputacion]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
