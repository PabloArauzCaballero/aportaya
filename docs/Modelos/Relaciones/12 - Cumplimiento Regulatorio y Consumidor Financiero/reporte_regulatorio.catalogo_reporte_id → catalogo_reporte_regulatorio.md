---
tags:
  - relacion
  - fk
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
origen: reporte_regulatorio
columna: catalogo_reporte_id
destino: catalogo_reporte_regulatorio
modulo_origen: "12"
modulo_destino: "12"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# reporte_regulatorio.catalogo_reporte_id → catalogo_reporte_regulatorio

> **[[reporte_regulatorio]]** `.catalogo_reporte_id` → **[[catalogo_reporte_regulatorio]]**

| | |
| --- | --- |
| Entidad origen | [[reporte_regulatorio]] (módulo 12) |
| Entidad destino | [[catalogo_reporte_regulatorio]] (módulo 12) |
| Columna | `catalogo_reporte_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "define" |

## Ver también

- [[12_cumplimiento_asfi]] — justificación de negocio del origen
- [[12_cumplimiento_asfi]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
