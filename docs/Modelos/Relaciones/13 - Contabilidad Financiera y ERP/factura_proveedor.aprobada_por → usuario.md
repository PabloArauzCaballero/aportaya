---
tags:
  - relacion
  - fk
  - modulo/13-contabilidad-financiera-y-erp
  - cross-modulo
origen: factura_proveedor
columna: aprobada_por
destino: usuario
modulo_origen: "13"
modulo_destino: "01"
cross_modulo: true
opcional: true
cardinalidad: "no declarada en el diagrama"
---

# factura_proveedor.aprobada_por → usuario

> **[[factura_proveedor]]** `.aprobada_por` → **[[usuario]]**

| | |
| --- | --- |
| Entidad origen | [[factura_proveedor]] (módulo 13) |
| Entidad destino | [[usuario]] (módulo 01) |
| Columna | `aprobada_por` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | sí ↗ |

> [!info] Referencia entre módulos
> Esta FK conecta el módulo 13 con el 01. En los diagramas se documenta en notas al pie y, cuando es polimórfica, se valida por aplicación o trigger en lugar de con una FK física.

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[13_contabilidad_erp]] — justificación de negocio del origen
- [[01_identidad_usuarios]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
