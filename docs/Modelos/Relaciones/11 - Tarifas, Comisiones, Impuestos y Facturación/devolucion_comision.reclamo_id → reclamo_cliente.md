---
tags:
  - relacion
  - fk
  - modulo/11-tarifas-comisiones-impuestos-y-facturacion
  - cross-modulo
origen: devolucion_comision
columna: reclamo_id
destino: reclamo_cliente
modulo_origen: "11"
modulo_destino: "12"
cross_modulo: true
opcional: true
cardinalidad: "no declarada en el diagrama"
---

# devolucion_comision.reclamo_id → reclamo_cliente

> **[[devolucion_comision]]** `.reclamo_id` → **[[reclamo_cliente]]**

| | |
| --- | --- |
| Entidad origen | [[devolucion_comision]] (módulo 11) |
| Entidad destino | [[reclamo_cliente]] (módulo 12) |
| Columna | `reclamo_id` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | sí ↗ |

> [!info] Referencia entre módulos
> Esta FK conecta el módulo 11 con el 12. En los diagramas se documenta en notas al pie y, cuando es polimórfica, se valida por aplicación o trigger en lugar de con una FK física.

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[11_tarifas_comisiones]] — justificación de negocio del origen
- [[12_cumplimiento_asfi]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
