---
tags:
  - relacion
  - fk
  - modulo/14-publicidad-y-campanas
  - cross-modulo
origen: factura_publicidad
columna: cuenta_por_cobrar_id
destino: cuenta_por_cobrar
modulo_origen: "14"
modulo_destino: "13"
cross_modulo: true
opcional: true
cardinalidad: "no declarada en el diagrama"
---

# factura_publicidad.cuenta_por_cobrar_id → cuenta_por_cobrar

> **[[factura_publicidad]]** `.cuenta_por_cobrar_id` → **[[cuenta_por_cobrar]]**

| | |
| --- | --- |
| Entidad origen | [[factura_publicidad]] (módulo 14) |
| Entidad destino | [[cuenta_por_cobrar]] (módulo 13) |
| Columna | `cuenta_por_cobrar_id` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | sí ↗ |

> [!info] Referencia entre módulos
> Esta FK conecta el módulo 14 con el 13. En los diagramas se documenta en notas al pie y, cuando es polimórfica, se valida por aplicación o trigger en lugar de con una FK física.

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[14_publicidad_campanas]] — justificación de negocio del origen
- [[13_contabilidad_erp]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
