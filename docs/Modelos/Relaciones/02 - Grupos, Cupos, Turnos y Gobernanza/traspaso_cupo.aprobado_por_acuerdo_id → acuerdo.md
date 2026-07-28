---
tags:
  - relacion
  - fk
  - modulo/02-grupos-cupos-turnos-y-gobernanza
origen: traspaso_cupo
columna: aprobado_por_acuerdo_id
destino: acuerdo
modulo_origen: "02"
modulo_destino: "02"
cross_modulo: false
opcional: true
cardinalidad: "no declarada en el diagrama"
---

# traspaso_cupo.aprobado_por_acuerdo_id → acuerdo

> **[[traspaso_cupo]]** `.aprobado_por_acuerdo_id` → **[[acuerdo]]**

| | |
| --- | --- |
| Entidad origen | [[traspaso_cupo]] (módulo 02) |
| Entidad destino | [[acuerdo]] (módulo 02) |
| Columna | `aprobado_por_acuerdo_id` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | no |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[02_grupos_turnos]] — justificación de negocio del origen
- [[02_grupos_turnos]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
