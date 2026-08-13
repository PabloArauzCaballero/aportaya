---
tags:
  - relacion
  - fk
  - modulo/09-auditoria-reportes-y-cumplimiento
origen: coincidencia_lista
columna: lista_id
destino: lista_restrictiva_externa
modulo_origen: "09"
modulo_destino: "09"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# coincidencia_lista.lista_id → lista_restrictiva_externa

> **[[coincidencia_lista]]** `.lista_id` → **[[lista_restrictiva_externa]]**

| | |
| --- | --- |
| Entidad origen | [[coincidencia_lista]] (módulo 09) |
| Entidad destino | [[lista_restrictiva_externa]] (módulo 09) |
| Columna | `lista_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "coincide en" |

## Ver también

- [[09_auditoria_reportes]] — justificación de negocio del origen
- [[09_auditoria_reportes]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
