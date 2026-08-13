---
tags:
  - relacion
  - fk
  - modulo/01-identidad-usuarios-y-seguridad
origen: sesion
columna: dispositivo_id
destino: dispositivo
modulo_origen: "01"
modulo_destino: "01"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# sesion.dispositivo_id → dispositivo

> **[[sesion]]** `.dispositivo_id` → **[[dispositivo]]**

| | |
| --- | --- |
| Entidad origen | [[sesion]] (módulo 01) |
| Entidad destino | [[dispositivo]] (módulo 01) |
| Columna | `dispositivo_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "soporta" |

## Ver también

- [[01_identidad_usuarios]] — justificación de negocio del origen
- [[01_identidad_usuarios]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
