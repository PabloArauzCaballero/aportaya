---
tags:
  - relacion
  - fk
  - modulo/02-grupos-cupos-turnos-y-gobernanza
  - cross-modulo
origen: aceptacion_reglamento
columna: token_firma_id
destino: token_verificacion
modulo_origen: "02"
modulo_destino: "01"
cross_modulo: true
opcional: true
cardinalidad: "no declarada en el diagrama"
---

# aceptacion_reglamento.token_firma_id → token_verificacion

> **[[aceptacion_reglamento]]** `.token_firma_id` → **[[token_verificacion]]**

| | |
| --- | --- |
| Entidad origen | [[aceptacion_reglamento]] (módulo 02) |
| Entidad destino | [[token_verificacion]] (módulo 01) |
| Columna | `token_firma_id` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | sí ↗ |

> [!info] Referencia entre módulos
> Esta FK conecta el módulo 02 con el 01. En los diagramas se documenta en notas al pie y, cuando es polimórfica, se valida por aplicación o trigger en lugar de con una FK física.

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[02_grupos_turnos]] — justificación de negocio del origen
- [[01_identidad_usuarios]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
