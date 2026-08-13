---
tags:
  - relacion
  - fk
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
origen: envio_regulatorio
columna: reporte_regulatorio_id
destino: reporte_regulatorio
modulo_origen: "12"
modulo_destino: "12"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# envio_regulatorio.reporte_regulatorio_id → reporte_regulatorio

> **[[envio_regulatorio]]** `.reporte_regulatorio_id` → **[[reporte_regulatorio]]**

| | |
| --- | --- |
| Entidad origen | [[envio_regulatorio]] (módulo 12) |
| Entidad destino | [[reporte_regulatorio]] (módulo 12) |
| Columna | `reporte_regulatorio_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "se envia en" |

## Ver también

- [[12_cumplimiento_asfi]] — justificación de negocio del origen
- [[12_cumplimiento_asfi]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
