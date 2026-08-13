---
tags:
  - relacion
  - fk
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
  - cross-modulo
origen: registro_operacion_relevante
columna: transaccion_id
destino: transaccion_billetera
modulo_origen: "12"
modulo_destino: "10"
cross_modulo: true
opcional: false
cardinalidad: "no declarada en el diagrama"
---

# registro_operacion_relevante.transaccion_id → transaccion_billetera

> **[[registro_operacion_relevante]]** `.transaccion_id` → **[[transaccion_billetera]]**

| | |
| --- | --- |
| Entidad origen | [[registro_operacion_relevante]] (módulo 12) |
| Entidad destino | [[transaccion_billetera]] (módulo 10) |
| Columna | `transaccion_id` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | sí ↗ |

> [!info] Referencia entre módulos
> Esta FK conecta el módulo 12 con el 10. En los diagramas se documenta en notas al pie y, cuando es polimórfica, se valida por aplicación o trigger en lugar de con una FK física.

## Ver también

- [[12_cumplimiento_asfi]] — justificación de negocio del origen
- [[10_billetera_custodia]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
