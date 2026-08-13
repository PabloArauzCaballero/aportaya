---
tags:
  - relacion
  - fk
  - modulo/09-auditoria-reportes-y-cumplimiento
  - cross-modulo
origen: ticket_soporte
columna: usuario_id
destino: usuario
modulo_origen: "09"
modulo_destino: "01"
cross_modulo: true
opcional: false
cardinalidad: "no declarada en el diagrama"
---

# ticket_soporte.usuario_id → usuario

> **[[ticket_soporte]]** `.usuario_id` → **[[usuario]]**

| | |
| --- | --- |
| Entidad origen | [[ticket_soporte]] (módulo 09) |
| Entidad destino | [[usuario]] (módulo 01) |
| Columna | `usuario_id` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | sí ↗ |

> [!info] Referencia entre módulos
> Esta FK conecta el módulo 09 con el 01. En los diagramas se documenta en notas al pie y, cuando es polimórfica, se valida por aplicación o trigger en lugar de con una FK física.

## Ver también

- [[09_auditoria_reportes]] — justificación de negocio del origen
- [[01_identidad_usuarios]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
