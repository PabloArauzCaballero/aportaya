---
tags:
  - relacion
  - fk
  - modulo/06-transparencia-y-reputacion
  - cross-modulo
origen: resena_participante
columna: grupo_id
destino: grupo
modulo_origen: "06"
modulo_destino: "02"
cross_modulo: true
opcional: false
cardinalidad: "no declarada en el diagrama"
---

# resena_participante.grupo_id → grupo

> **[[resena_participante]]** `.grupo_id` → **[[grupo]]**

| | |
| --- | --- |
| Entidad origen | [[resena_participante]] (módulo 06) |
| Entidad destino | [[grupo]] (módulo 02) |
| Columna | `grupo_id` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | sí ↗ |

> [!info] Referencia entre módulos
> Esta FK conecta el módulo 06 con el 02. En los diagramas se documenta en notas al pie y, cuando es polimórfica, se valida por aplicación o trigger en lugar de con una FK física.

## Ver también

- [[06_transparencia_reputacion]] — justificación de negocio del origen
- [[02_grupos_turnos]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
