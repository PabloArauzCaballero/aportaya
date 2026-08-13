---
tags:
  - relacion
  - fk
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
  - cross-modulo
origen: incidente_seguridad
columna: incidente_operativo_id
destino: incidente_operativo
modulo_origen: "12"
modulo_destino: "09"
cross_modulo: true
opcional: true
cardinalidad: "no declarada en el diagrama"
---

# incidente_seguridad.incidente_operativo_id → incidente_operativo

> **[[incidente_seguridad]]** `.incidente_operativo_id` → **[[incidente_operativo]]**

| | |
| --- | --- |
| Entidad origen | [[incidente_seguridad]] (módulo 12) |
| Entidad destino | [[incidente_operativo]] (módulo 09) |
| Columna | `incidente_operativo_id` — UUID |
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
