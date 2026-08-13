---
tags:
  - relacion
  - fk
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
  - cross-modulo
origen: plan_accion_riesgo
columna: responsable_id
destino: usuario
modulo_origen: "12"
modulo_destino: "01"
cross_modulo: true
opcional: false
cardinalidad: "no declarada en el diagrama"
---

# plan_accion_riesgo.responsable_id → usuario

> **[[plan_accion_riesgo]]** `.responsable_id` → **[[usuario]]**

| | |
| --- | --- |
| Entidad origen | [[plan_accion_riesgo]] (módulo 12) |
| Entidad destino | [[usuario]] (módulo 01) |
| Columna | `responsable_id` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | sí ↗ |

> [!info] Referencia entre módulos
> Esta FK conecta el módulo 12 con el 01. En los diagramas se documenta en notas al pie y, cuando es polimórfica, se valida por aplicación o trigger en lugar de con una FK física.

## Ver también

- [[12_cumplimiento_asfi]] — justificación de negocio del origen
- [[01_identidad_usuarios]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
