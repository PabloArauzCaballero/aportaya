---
tags:
  - relacion
  - fk
  - modulo/01-identidad-usuarios-y-seguridad
origen: perfil_financiero
columna: usuario_id
destino: usuario
modulo_origen: "01"
modulo_destino: "01"
cross_modulo: false
opcional: false
cardinalidad: "uno a uno opcional"
---

# perfil_financiero.usuario_id → usuario

> **[[perfil_financiero]]** `.usuario_id` → **[[usuario]]**

| | |
| --- | --- |
| Entidad origen | [[perfil_financiero]] (módulo 01) |
| Entidad destino | [[usuario]] (módulo 01) |
| Columna | `usuario_id` — UUID |
| Cardinalidad | uno a uno opcional |
| Obligatoria | sí |
| Uno a uno | sí (columna UNIQUE) |
| Cruza módulos | no |
| Semántica | "declara" |

## Ver también

- [[01_identidad_usuarios]] — justificación de negocio del origen
- [[01_identidad_usuarios]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
