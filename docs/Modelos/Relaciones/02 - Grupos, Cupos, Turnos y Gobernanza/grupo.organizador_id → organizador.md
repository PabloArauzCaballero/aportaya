---
tags:
  - relacion
  - fk
  - modulo/02-grupos-cupos-turnos-y-gobernanza
  - cross-modulo
origen: grupo
columna: organizador_id
destino: organizador
modulo_origen: "02"
modulo_destino: "07"
cross_modulo: true
opcional: true
cardinalidad: "no declarada en el diagrama"
---

# grupo.organizador_id → organizador

> **[[grupo]]** `.organizador_id` → **[[organizador]]**

| | |
| --- | --- |
| Entidad origen | [[grupo]] (módulo 02) |
| Entidad destino | [[organizador]] (módulo 07) |
| Columna | `organizador_id` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | sí ↗ |

> [!info] Referencia entre módulos
> Esta FK conecta el módulo 02 con el 07. En los diagramas se documenta en notas al pie y, cuando es polimórfica, se valida por aplicación o trigger en lugar de con una FK física.

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[02_grupos_turnos]] — justificación de negocio del origen
- [[07_organizador_automatizacion]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
