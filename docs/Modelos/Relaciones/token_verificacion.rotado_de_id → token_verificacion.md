---
tags:
  - relacion
  - fk
  - modulo/01-identidad-usuarios-y-seguridad
origen: token_verificacion
columna: rotado_de_id
destino: token_verificacion
modulo_origen: "01"
modulo_destino: "01"
cross_modulo: false
opcional: true
cardinalidad: "no declarada en el diagrama"
---

# token_verificacion.rotado_de_id → token_verificacion

> **[[token_verificacion]]** `.rotado_de_id` → **[[token_verificacion]]**

| | |
| --- | --- |
| Entidad origen | [[token_verificacion]] (módulo 01) |
| Entidad destino | [[token_verificacion]] (módulo 01) |
| Columna | `rotado_de_id` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | no |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[01_identidad_usuarios]] — justificación de negocio del origen
- [[01_identidad_usuarios]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
