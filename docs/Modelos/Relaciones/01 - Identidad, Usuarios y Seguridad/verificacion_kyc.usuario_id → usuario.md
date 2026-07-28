---
tags:
  - relacion
  - fk
  - modulo/01-identidad-usuarios-y-seguridad
origen: verificacion_kyc
columna: usuario_id
destino: usuario
modulo_origen: "01"
modulo_destino: "01"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# verificacion_kyc.usuario_id → usuario

> **[[verificacion_kyc]]** `.usuario_id` → **[[usuario]]**

| | |
| --- | --- |
| Entidad origen | [[verificacion_kyc]] (módulo 01) |
| Entidad destino | [[usuario]] (módulo 01) |
| Columna | `usuario_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "verifica" |

## Ver también

- [[01_identidad_usuarios]] — justificación de negocio del origen
- [[01_identidad_usuarios]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
