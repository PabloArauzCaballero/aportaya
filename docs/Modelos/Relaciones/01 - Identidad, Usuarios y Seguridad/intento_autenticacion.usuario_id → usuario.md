---
tags:
  - relacion
  - fk
  - modulo/01-identidad-usuarios-y-seguridad
origen: intento_autenticacion
columna: usuario_id
destino: usuario
modulo_origen: "01"
modulo_destino: "01"
cross_modulo: false
opcional: true
cardinalidad: "uno a muchos (0..N)"
---

# intento_autenticacion.usuario_id → usuario

> **[[intento_autenticacion]]** `.usuario_id` → **[[usuario]]**

| | |
| --- | --- |
| Entidad origen | [[intento_autenticacion]] (módulo 01) |
| Entidad destino | [[usuario]] (módulo 01) |
| Columna | `usuario_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "intenta" |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[01_identidad_usuarios]] — justificación de negocio del origen
- [[01_identidad_usuarios]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
