---
tags:
  - relacion
  - fk
  - modulo/01-identidad-usuarios-y-seguridad
origen: historial_credencial
columna: usuario_id
destino: usuario
modulo_origen: "01"
modulo_destino: "01"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# historial_credencial.usuario_id → usuario

> **[[historial_credencial]]** `.usuario_id` → **[[usuario]]**

| | |
| --- | --- |
| Entidad origen | [[historial_credencial]] (módulo 01) |
| Entidad destino | [[usuario]] (módulo 01) |
| Columna | `usuario_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "historico de" |

## Ver también

- [[01_identidad_usuarios]] — justificación de negocio del origen
- [[01_identidad_usuarios]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
