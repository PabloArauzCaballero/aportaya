---
tags:
  - relacion
  - fk
  - modulo/02-grupos-cupos-turnos-y-gobernanza
  - cross-modulo
origen: acuerdo
columna: propuesto_por
destino: usuario
modulo_origen: "02"
modulo_destino: "01"
cross_modulo: true
opcional: false
cardinalidad: "no declarada en el diagrama"
---

# acuerdo.propuesto_por → usuario

> **[[acuerdo]]** `.propuesto_por` → **[[usuario]]**

| | |
| --- | --- |
| Entidad origen | [[acuerdo]] (módulo 02) |
| Entidad destino | [[usuario]] (módulo 01) |
| Columna | `propuesto_por` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | sí ↗ |

> [!info] Referencia entre módulos
> Esta FK conecta el módulo 02 con el 01. En los diagramas se documenta en notas al pie y, cuando es polimórfica, se valida por aplicación o trigger en lugar de con una FK física.

## Ver también

- [[02_grupos_turnos]] — justificación de negocio del origen
- [[01_identidad_usuarios]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
