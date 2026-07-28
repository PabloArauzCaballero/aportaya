---
tags:
  - relacion
  - fk
  - modulo/02-grupos-cupos-turnos-y-gobernanza
  - cross-modulo
origen: configuracion_grupo
columna: politica_mora_id
destino: politica_mora
modulo_origen: "02"
modulo_destino: "03"
cross_modulo: true
opcional: true
cardinalidad: "no declarada en el diagrama"
---

# configuracion_grupo.politica_mora_id → politica_mora

> **[[configuracion_grupo]]** `.politica_mora_id` → **[[politica_mora]]**

| | |
| --- | --- |
| Entidad origen | [[configuracion_grupo]] (módulo 02) |
| Entidad destino | [[politica_mora]] (módulo 03) |
| Columna | `politica_mora_id` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | sí ↗ |

> [!info] Referencia entre módulos
> Esta FK conecta el módulo 02 con el 03. En los diagramas se documenta en notas al pie y, cuando es polimórfica, se valida por aplicación o trigger en lugar de con una FK física.

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[02_grupos_turnos]] — justificación de negocio del origen
- [[03_aportes_pagos_qr]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
