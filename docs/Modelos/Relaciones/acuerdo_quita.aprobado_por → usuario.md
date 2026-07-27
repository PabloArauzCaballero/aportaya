---
tags:
  - relacion
  - fk
  - modulo/08-garantia-incumplimiento-cobranza-y-sanciones
  - cross-modulo
origen: acuerdo_quita
columna: aprobado_por
destino: usuario
modulo_origen: "08"
modulo_destino: "01"
cross_modulo: true
opcional: false
cardinalidad: "no declarada en el diagrama"
---

# acuerdo_quita.aprobado_por → usuario

> **[[acuerdo_quita]]** `.aprobado_por` → **[[usuario]]**

| | |
| --- | --- |
| Entidad origen | [[acuerdo_quita]] (módulo 08) |
| Entidad destino | [[usuario]] (módulo 01) |
| Columna | `aprobado_por` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | sí ↗ |

> [!info] Referencia entre módulos
> Esta FK conecta el módulo 08 con el 01. En los diagramas se documenta en notas al pie y, cuando es polimórfica, se valida por aplicación o trigger en lugar de con una FK física.

## Ver también

- [[08_garantia_incumplimiento]] — justificación de negocio del origen
- [[01_identidad_usuarios]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
