---
tags:
  - relacion
  - fk
  - modulo/01-identidad-usuarios-y-seguridad
origen: rol_permiso
columna: permiso_id
destino: permiso
modulo_origen: "01"
modulo_destino: "01"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# rol_permiso.permiso_id → permiso

> **[[rol_permiso]]** `.permiso_id` → **[[permiso]]**

| | |
| --- | --- |
| Entidad origen | [[rol_permiso]] (módulo 01) |
| Entidad destino | [[permiso]] (módulo 01) |
| Columna | `permiso_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |

## Ver también

- [[01_identidad_usuarios]] — justificación de negocio del origen
- [[01_identidad_usuarios]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
