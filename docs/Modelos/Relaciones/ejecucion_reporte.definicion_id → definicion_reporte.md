---
tags:
  - relacion
  - fk
  - modulo/09-auditoria-reportes-y-cumplimiento
origen: ejecucion_reporte
columna: definicion_id
destino: definicion_reporte
modulo_origen: "09"
modulo_destino: "09"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# ejecucion_reporte.definicion_id → definicion_reporte

> **[[ejecucion_reporte]]** `.definicion_id` → **[[definicion_reporte]]**

| | |
| --- | --- |
| Entidad origen | [[ejecucion_reporte]] (módulo 09) |
| Entidad destino | [[definicion_reporte]] (módulo 09) |
| Columna | `definicion_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "se ejecuta como" |

## Ver también

- [[09_auditoria_reportes]] — justificación de negocio del origen
- [[09_auditoria_reportes]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
