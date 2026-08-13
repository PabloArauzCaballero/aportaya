---
tags:
  - relacion
  - fk
  - modulo/09-auditoria-reportes-y-cumplimiento
  - cross-modulo
origen: bitacora_evento
columna: grupo_id
destino: grupo
modulo_origen: "09"
modulo_destino: "02"
cross_modulo: true
opcional: true
cardinalidad: "no declarada en el diagrama"
---

# bitacora_evento.grupo_id → grupo

> **[[bitacora_evento]]** `.grupo_id` → **[[grupo]]**

| | |
| --- | --- |
| Entidad origen | [[bitacora_evento]] (módulo 09) |
| Entidad destino | [[grupo]] (módulo 02) |
| Columna | `grupo_id` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | sí ↗ |

> [!info] Referencia entre módulos
> Esta FK conecta el módulo 09 con el 02. En los diagramas se documenta en notas al pie y, cuando es polimórfica, se valida por aplicación o trigger en lugar de con una FK física.

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[09_auditoria_reportes]] — justificación de negocio del origen
- [[02_grupos_turnos]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
