---
tags:
  - relacion
  - fk
  - modulo/05-notificaciones-y-comunicaciones
origen: envio_notificacion
columna: canal_vinculado_id
destino: canal_vinculado
modulo_origen: "05"
modulo_destino: "05"
cross_modulo: false
opcional: true
cardinalidad: "uno a muchos (0..N)"
---

# envio_notificacion.canal_vinculado_id → canal_vinculado

> **[[envio_notificacion]]** `.canal_vinculado_id` → **[[canal_vinculado]]**

| | |
| --- | --- |
| Entidad origen | [[envio_notificacion]] (módulo 05) |
| Entidad destino | [[canal_vinculado]] (módulo 05) |
| Columna | `canal_vinculado_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "recibe" |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[05_notificaciones]] — justificación de negocio del origen
- [[05_notificaciones]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
