---
tags:
  - relacion
  - fk
  - modulo/13-contabilidad-financiera-y-erp
  - cross-modulo
origen: cierre_periodo_contable
columna: cerrado_por
destino: usuario
modulo_origen: "13"
modulo_destino: "01"
cross_modulo: true
opcional: false
cardinalidad: "no declarada en el diagrama"
---

# cierre_periodo_contable.cerrado_por → usuario

> **[[cierre_periodo_contable]]** `.cerrado_por` → **[[usuario]]**

| | |
| --- | --- |
| Entidad origen | [[cierre_periodo_contable]] (módulo 13) |
| Entidad destino | [[usuario]] (módulo 01) |
| Columna | `cerrado_por` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | sí ↗ |

> [!info] Referencia entre módulos
> Esta FK conecta el módulo 13 con el 01. En los diagramas se documenta en notas al pie y, cuando es polimórfica, se valida por aplicación o trigger en lugar de con una FK física.

## Ver también

- [[13_contabilidad_erp]] — justificación de negocio del origen
- [[01_identidad_usuarios]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
