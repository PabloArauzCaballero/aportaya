---
tags:
  - relacion
  - fk
  - modulo/08-garantia-incumplimiento-cobranza-y-sanciones
  - cross-modulo
origen: accion_cobranza
columna: notificacion_id
destino: notificacion
modulo_origen: "08"
modulo_destino: "05"
cross_modulo: true
opcional: true
cardinalidad: "no declarada en el diagrama"
---

# accion_cobranza.notificacion_id → notificacion

> **[[accion_cobranza]]** `.notificacion_id` → **[[notificacion]]**

| | |
| --- | --- |
| Entidad origen | [[accion_cobranza]] (módulo 08) |
| Entidad destino | [[notificacion]] (módulo 05) |
| Columna | `notificacion_id` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | sí ↗ |

> [!info] Referencia entre módulos
> Esta FK conecta el módulo 08 con el 05. En los diagramas se documenta en notas al pie y, cuando es polimórfica, se valida por aplicación o trigger en lugar de con una FK física.

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[08_garantia_incumplimiento]] — justificación de negocio del origen
- [[05_notificaciones]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
