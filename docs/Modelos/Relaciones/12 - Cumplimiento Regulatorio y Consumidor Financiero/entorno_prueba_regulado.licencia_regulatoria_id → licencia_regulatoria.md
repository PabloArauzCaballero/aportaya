---
tags:
  - relacion
  - fk
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
origen: entorno_prueba_regulado
columna: licencia_regulatoria_id
destino: licencia_regulatoria
modulo_origen: "12"
modulo_destino: "12"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# entorno_prueba_regulado.licencia_regulatoria_id → licencia_regulatoria

> **[[entorno_prueba_regulado]]** `.licencia_regulatoria_id` → **[[licencia_regulatoria]]**

| | |
| --- | --- |
| Entidad origen | [[entorno_prueba_regulado]] (módulo 12) |
| Entidad destino | [[licencia_regulatoria]] (módulo 12) |
| Columna | `licencia_regulatoria_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "habilita" |

## Ver también

- [[12_cumplimiento_asfi]] — justificación de negocio del origen
- [[12_cumplimiento_asfi]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
