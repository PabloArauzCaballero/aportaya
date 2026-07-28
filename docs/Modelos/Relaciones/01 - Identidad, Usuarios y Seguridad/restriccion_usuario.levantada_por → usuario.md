---
tags:
  - relacion
  - fk
  - modulo/01-identidad-usuarios-y-seguridad
origen: restriccion_usuario
columna: levantada_por
destino: usuario
modulo_origen: "01"
modulo_destino: "01"
cross_modulo: false
opcional: true
cardinalidad: "uno a muchos (0..N)"
---

# restriccion_usuario.levantada_por → usuario

> **[[restriccion_usuario]]** `.levantada_por` → **[[usuario]]**

| | |
| --- | --- |
| Entidad origen | [[restriccion_usuario]] (módulo 01) |
| Entidad destino | [[usuario]] (módulo 01) |
| Columna | `levantada_por` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "limitado por" |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[01_identidad_usuarios]] — justificación de negocio del origen
- [[01_identidad_usuarios]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
