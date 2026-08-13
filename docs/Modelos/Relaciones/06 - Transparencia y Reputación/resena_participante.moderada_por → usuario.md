---
tags:
  - relacion
  - fk
  - modulo/06-transparencia-y-reputacion
  - cross-modulo
origen: resena_participante
columna: moderada_por
destino: usuario
modulo_origen: "06"
modulo_destino: "01"
cross_modulo: true
opcional: true
cardinalidad: "no declarada en el diagrama"
---

# resena_participante.moderada_por → usuario

> **[[resena_participante]]** `.moderada_por` → **[[usuario]]**

| | |
| --- | --- |
| Entidad origen | [[resena_participante]] (módulo 06) |
| Entidad destino | [[usuario]] (módulo 01) |
| Columna | `moderada_por` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | sí ↗ |

> [!info] Referencia entre módulos
> Esta FK conecta el módulo 06 con el 01. En los diagramas se documenta en notas al pie y, cuando es polimórfica, se valida por aplicación o trigger en lugar de con una FK física.

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[06_transparencia_reputacion]] — justificación de negocio del origen
- [[01_identidad_usuarios]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
