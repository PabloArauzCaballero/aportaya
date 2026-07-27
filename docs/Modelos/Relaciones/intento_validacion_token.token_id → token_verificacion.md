---
tags:
  - relacion
  - fk
  - modulo/01-identidad-usuarios-y-seguridad
origen: intento_validacion_token
columna: token_id
destino: token_verificacion
modulo_origen: "01"
modulo_destino: "01"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# intento_validacion_token.token_id → token_verificacion

> **[[intento_validacion_token]]** `.token_id` → **[[token_verificacion]]**

| | |
| --- | --- |
| Entidad origen | [[intento_validacion_token]] (módulo 01) |
| Entidad destino | [[token_verificacion]] (módulo 01) |
| Columna | `token_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "registra" |

## Ver también

- [[01_identidad_usuarios]] — justificación de negocio del origen
- [[01_identidad_usuarios]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
