---
tags:
  - relacion
  - fk
  - modulo/13-contabilidad-financiera-y-erp
  - cross-modulo
origen: estado_financiero_generado
columna: generado_por
destino: usuario
modulo_origen: "13"
modulo_destino: "01"
cross_modulo: true
opcional: false
cardinalidad: "no declarada en el diagrama"
---

# estado_financiero_generado.generado_por → usuario

> **[[estado_financiero_generado]]** `.generado_por` → **[[usuario]]**

| | |
| --- | --- |
| Entidad origen | [[estado_financiero_generado]] (módulo 13) |
| Entidad destino | [[usuario]] (módulo 01) |
| Columna | `generado_por` — UUID |
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
