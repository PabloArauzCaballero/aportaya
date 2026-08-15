---
tags:
  - relacion
  - fk
  - modulo/14-publicidad-y-campanas
  - cross-modulo
origen: factura_publicidad
columna: factura_electronica_id
destino: factura_electronica
modulo_origen: "14"
modulo_destino: "11"
cross_modulo: true
opcional: true
cardinalidad: "no declarada en el diagrama"
---

# factura_publicidad.factura_electronica_id → factura_electronica

> **[[factura_publicidad]]** `.factura_electronica_id` → **[[factura_electronica]]**

| | |
| --- | --- |
| Entidad origen | [[factura_publicidad]] (módulo 14) |
| Entidad destino | [[factura_electronica]] (módulo 11) |
| Columna | `factura_electronica_id` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | sí ↗ |

> [!info] Referencia entre módulos
> Esta FK conecta el módulo 14 con el 11. En los diagramas se documenta en notas al pie y, cuando es polimórfica, se valida por aplicación o trigger en lugar de con una FK física.

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[14_publicidad_campanas]] — justificación de negocio del origen
- [[11_tarifas_comisiones]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
