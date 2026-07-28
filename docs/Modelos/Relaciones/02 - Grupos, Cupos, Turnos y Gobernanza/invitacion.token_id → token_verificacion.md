---
tags:
  - relacion
  - fk
  - modulo/02-grupos-cupos-turnos-y-gobernanza
  - cross-modulo
origen: invitacion
columna: token_id
destino: token_verificacion
modulo_origen: "02"
modulo_destino: "01"
cross_modulo: true
opcional: false
cardinalidad: "no declarada en el diagrama"
---

# invitacion.token_id → token_verificacion

> **[[invitacion]]** `.token_id` → **[[token_verificacion]]**

| | |
| --- | --- |
| Entidad origen | [[invitacion]] (módulo 02) |
| Entidad destino | [[token_verificacion]] (módulo 01) |
| Columna | `token_id` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | sí |
| Uno a uno | sí (columna UNIQUE) |
| Cruza módulos | sí ↗ |

> [!info] Referencia entre módulos
> Esta FK conecta el módulo 02 con el 01. En los diagramas se documenta en notas al pie y, cuando es polimórfica, se valida por aplicación o trigger en lugar de con una FK física.

## Ver también

- [[02_grupos_turnos]] — justificación de negocio del origen
- [[01_identidad_usuarios]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
