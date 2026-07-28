---
tags:
  - relacion
  - fk
  - modulo/09-auditoria-reportes-y-cumplimiento
origen: alerta_cumplimiento
columna: regla_id
destino: regla_cumplimiento
modulo_origen: "09"
modulo_destino: "09"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# alerta_cumplimiento.regla_id → regla_cumplimiento

> **[[alerta_cumplimiento]]** `.regla_id` → **[[regla_cumplimiento]]**

| | |
| --- | --- |
| Entidad origen | [[alerta_cumplimiento]] (módulo 09) |
| Entidad destino | [[regla_cumplimiento]] (módulo 09) |
| Columna | `regla_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "detecta" |

## Ver también

- [[09_auditoria_reportes]] — justificación de negocio del origen
- [[09_auditoria_reportes]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
