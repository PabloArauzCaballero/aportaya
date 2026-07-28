---
tags:
  - relacion
  - fk
  - modulo/09-auditoria-reportes-y-cumplimiento
origen: exportacion_reporte
columna: ejecucion_id
destino: ejecucion_reporte
modulo_origen: "09"
modulo_destino: "09"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# exportacion_reporte.ejecucion_id → ejecucion_reporte

> **[[exportacion_reporte]]** `.ejecucion_id` → **[[ejecucion_reporte]]**

| | |
| --- | --- |
| Entidad origen | [[exportacion_reporte]] (módulo 09) |
| Entidad destino | [[ejecucion_reporte]] (módulo 09) |
| Columna | `ejecucion_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "exporta" |

## Ver también

- [[09_auditoria_reportes]] — justificación de negocio del origen
- [[09_auditoria_reportes]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
