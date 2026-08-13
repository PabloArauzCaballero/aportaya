---
tags:
  - relacion
  - fk
  - modulo/05-notificaciones-y-comunicaciones
  - cross-modulo
origen: notificacion
columna: usuario_id
destino: usuario
modulo_origen: "05"
modulo_destino: "01"
cross_modulo: true
opcional: false
cardinalidad: "no declarada en el diagrama"
---

# notificacion.usuario_id → usuario

> **[[notificacion]]** `.usuario_id` → **[[usuario]]**

| | |
| --- | --- |
| Entidad origen | [[notificacion]] (módulo 05) |
| Entidad destino | [[usuario]] (módulo 01) |
| Columna | `usuario_id` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | sí ↗ |

> [!info] Referencia entre módulos
> Esta FK conecta el módulo 05 con el 01. En los diagramas se documenta en notas al pie y, cuando es polimórfica, se valida por aplicación o trigger en lugar de con una FK física.

## Ver también

- [[05_notificaciones]] — justificación de negocio del origen
- [[01_identidad_usuarios]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
