---
tags:
  - relacion
  - fk
  - modulo/02-grupos-cupos-turnos-y-gobernanza
origen: aceptacion_reglamento
columna: reglamento_id
destino: reglamento_grupo
modulo_origen: "02"
modulo_destino: "02"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# aceptacion_reglamento.reglamento_id → reglamento_grupo

> **[[aceptacion_reglamento]]** `.reglamento_id` → **[[reglamento_grupo]]**

| | |
| --- | --- |
| Entidad origen | [[aceptacion_reglamento]] (módulo 02) |
| Entidad destino | [[reglamento_grupo]] (módulo 02) |
| Columna | `reglamento_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "es firmado en" |

## Ver también

- [[02_grupos_turnos]] — justificación de negocio del origen
- [[02_grupos_turnos]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
