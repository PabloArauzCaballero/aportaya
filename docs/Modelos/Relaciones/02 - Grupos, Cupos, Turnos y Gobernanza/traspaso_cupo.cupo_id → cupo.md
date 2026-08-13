---
tags:
  - relacion
  - fk
  - modulo/02-grupos-cupos-turnos-y-gobernanza
origen: traspaso_cupo
columna: cupo_id
destino: cupo
modulo_origen: "02"
modulo_destino: "02"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# traspaso_cupo.cupo_id → cupo

> **[[traspaso_cupo]]** `.cupo_id` → **[[cupo]]**

| | |
| --- | --- |
| Entidad origen | [[traspaso_cupo]] (módulo 02) |
| Entidad destino | [[cupo]] (módulo 02) |
| Columna | `cupo_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "cambia de mano" |

## Ver también

- [[02_grupos_turnos]] — justificación de negocio del origen
- [[02_grupos_turnos]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
