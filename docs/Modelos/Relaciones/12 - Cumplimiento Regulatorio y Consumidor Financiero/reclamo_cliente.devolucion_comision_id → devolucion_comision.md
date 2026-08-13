---
tags:
  - relacion
  - fk
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
  - cross-modulo
origen: reclamo_cliente
columna: devolucion_comision_id
destino: devolucion_comision
modulo_origen: "12"
modulo_destino: "11"
cross_modulo: true
opcional: true
cardinalidad: "no declarada en el diagrama"
---

# reclamo_cliente.devolucion_comision_id → devolucion_comision

> **[[reclamo_cliente]]** `.devolucion_comision_id` → **[[devolucion_comision]]**

| | |
| --- | --- |
| Entidad origen | [[reclamo_cliente]] (módulo 12) |
| Entidad destino | [[devolucion_comision]] (módulo 11) |
| Columna | `devolucion_comision_id` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | sí ↗ |

> [!info] Referencia entre módulos
> Esta FK conecta el módulo 12 con el 11. En los diagramas se documenta en notas al pie y, cuando es polimórfica, se valida por aplicación o trigger en lugar de con una FK física.

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[12_cumplimiento_asfi]] — justificación de negocio del origen
- [[11_tarifas_comisiones]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
