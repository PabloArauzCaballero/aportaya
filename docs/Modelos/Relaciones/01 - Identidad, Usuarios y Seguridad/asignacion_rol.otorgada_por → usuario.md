---
tags:
  - relacion
  - fk
  - modulo/01-identidad-usuarios-y-seguridad
origen: asignacion_rol
columna: otorgada_por
destino: usuario
modulo_origen: "01"
modulo_destino: "01"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# asignacion_rol.otorgada_por → usuario

> **[[asignacion_rol]]** `.otorgada_por` → **[[usuario]]**

| | |
| --- | --- |
| Entidad origen | [[asignacion_rol]] (módulo 01) |
| Entidad destino | [[usuario]] (módulo 01) |
| Columna | `otorgada_por` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "asume" |

## Ver también

- [[01_identidad_usuarios]] — justificación de negocio del origen
- [[01_identidad_usuarios]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
