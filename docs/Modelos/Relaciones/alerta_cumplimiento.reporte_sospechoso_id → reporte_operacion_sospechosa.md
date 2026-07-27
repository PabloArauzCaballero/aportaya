---
tags:
  - relacion
  - fk
  - modulo/09-auditoria-reportes-y-cumplimiento
origen: alerta_cumplimiento
columna: reporte_sospechoso_id
destino: reporte_operacion_sospechosa
modulo_origen: "09"
modulo_destino: "09"
cross_modulo: false
opcional: true
cardinalidad: "uno a muchos (0..N)"
---

# alerta_cumplimiento.reporte_sospechoso_id → reporte_operacion_sospechosa

> **[[alerta_cumplimiento]]** `.reporte_sospechoso_id` → **[[reporte_operacion_sospechosa]]**

| | |
| --- | --- |
| Entidad origen | [[alerta_cumplimiento]] (módulo 09) |
| Entidad destino | [[reporte_operacion_sospechosa]] (módulo 09) |
| Columna | `reporte_sospechoso_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "consolida" |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[09_auditoria_reportes]] — justificación de negocio del origen
- [[09_auditoria_reportes]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
