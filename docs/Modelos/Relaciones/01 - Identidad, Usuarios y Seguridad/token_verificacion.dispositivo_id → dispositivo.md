---
tags:
  - relacion
  - fk
  - modulo/01-identidad-usuarios-y-seguridad
origen: token_verificacion
columna: dispositivo_id
destino: dispositivo
modulo_origen: "01"
modulo_destino: "01"
cross_modulo: false
opcional: true
cardinalidad: "muchos a uno opcional"
---

# token_verificacion.dispositivo_id → dispositivo

> **[[token_verificacion]]** `.dispositivo_id` → **[[dispositivo]]**

| | |
| --- | --- |
| Entidad origen | [[token_verificacion]] (módulo 01) |
| Entidad destino | [[dispositivo]] (módulo 01) |
| Columna | `dispositivo_id` — UUID |
| Cardinalidad | muchos a uno opcional |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "atado a" |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[01_identidad_usuarios]] — justificación de negocio del origen
- [[01_identidad_usuarios]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
