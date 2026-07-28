---
tags:
  - relacion
  - fk
  - modulo/05-notificaciones-y-comunicaciones
origen: respuesta_entrante
columna: canal_vinculado_id
destino: canal_vinculado
modulo_origen: "05"
modulo_destino: "05"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# respuesta_entrante.canal_vinculado_id → canal_vinculado

> **[[respuesta_entrante]]** `.canal_vinculado_id` → **[[canal_vinculado]]**

| | |
| --- | --- |
| Entidad origen | [[respuesta_entrante]] (módulo 05) |
| Entidad destino | [[canal_vinculado]] (módulo 05) |
| Columna | `canal_vinculado_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "origina" |

## Ver también

- [[05_notificaciones]] — justificación de negocio del origen
- [[05_notificaciones]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
