---
tags:
  - relacion
  - fk
  - modulo/01-identidad-usuarios-y-seguridad
origen: direccion_usuario
columna: usuario_id
destino: usuario
modulo_origen: "01"
modulo_destino: "01"
cross_modulo: false
opcional: false
cardinalidad: "uno a uno opcional"
---

# direccion_usuario.usuario_id → usuario

> **[[direccion_usuario]]** `.usuario_id` → **[[usuario]]**

| | |
| --- | --- |
| Entidad origen | [[direccion_usuario]] (módulo 01) |
| Entidad destino | [[usuario]] (módulo 01) |
| Columna | `usuario_id` — UUID |
| Cardinalidad | uno a uno opcional |
| Obligatoria | sí |
| Uno a uno | sí (columna UNIQUE) |
| Cruza módulos | no |
| Semántica | "reside en" |

## Ver también

- [[01_identidad_usuarios]] — justificación de negocio del origen
- [[01_identidad_usuarios]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
