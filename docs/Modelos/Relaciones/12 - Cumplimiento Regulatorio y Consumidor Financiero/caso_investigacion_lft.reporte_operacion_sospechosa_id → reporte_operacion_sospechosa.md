---
tags:
  - relacion
  - fk
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
  - cross-modulo
origen: caso_investigacion_lft
columna: reporte_operacion_sospechosa_id
destino: reporte_operacion_sospechosa
modulo_origen: "12"
modulo_destino: "09"
cross_modulo: true
opcional: true
cardinalidad: "no declarada en el diagrama"
---

# caso_investigacion_lft.reporte_operacion_sospechosa_id → reporte_operacion_sospechosa

> **[[caso_investigacion_lft]]** `.reporte_operacion_sospechosa_id` → **[[reporte_operacion_sospechosa]]**

| | |
| --- | --- |
| Entidad origen | [[caso_investigacion_lft]] (módulo 12) |
| Entidad destino | [[reporte_operacion_sospechosa]] (módulo 09) |
| Columna | `reporte_operacion_sospechosa_id` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | sí ↗ |

> [!info] Referencia entre módulos
> Esta FK conecta el módulo 12 con el 09. En los diagramas se documenta en notas al pie y, cuando es polimórfica, se valida por aplicación o trigger en lugar de con una FK física.

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[12_cumplimiento_asfi]] — justificación de negocio del origen
- [[09_auditoria_reportes]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
