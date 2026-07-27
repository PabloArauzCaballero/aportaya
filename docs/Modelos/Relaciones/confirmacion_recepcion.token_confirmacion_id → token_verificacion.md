---
tags:
  - relacion
  - fk
  - modulo/04-entregas-de-fondo
  - cross-modulo
origen: confirmacion_recepcion
columna: token_confirmacion_id
destino: token_verificacion
modulo_origen: "04"
modulo_destino: "01"
cross_modulo: true
opcional: true
cardinalidad: "no declarada en el diagrama"
---

# confirmacion_recepcion.token_confirmacion_id → token_verificacion

> **[[confirmacion_recepcion]]** `.token_confirmacion_id` → **[[token_verificacion]]**

| | |
| --- | --- |
| Entidad origen | [[confirmacion_recepcion]] (módulo 04) |
| Entidad destino | [[token_verificacion]] (módulo 01) |
| Columna | `token_confirmacion_id` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | sí ↗ |

> [!info] Referencia entre módulos
> Esta FK conecta el módulo 04 con el 01. En los diagramas se documenta en notas al pie y, cuando es polimórfica, se valida por aplicación o trigger en lugar de con una FK física.

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[04_entregas_fondo]] — justificación de negocio del origen
- [[01_identidad_usuarios]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
