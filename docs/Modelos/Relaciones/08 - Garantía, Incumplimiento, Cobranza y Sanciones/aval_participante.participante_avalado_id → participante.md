---
tags:
  - relacion
  - fk
  - modulo/08-garantia-incumplimiento-cobranza-y-sanciones
  - cross-modulo
origen: aval_participante
columna: participante_avalado_id
destino: participante
modulo_origen: "08"
modulo_destino: "02"
cross_modulo: true
opcional: false
cardinalidad: "no declarada en el diagrama"
---

# aval_participante.participante_avalado_id → participante

> **[[aval_participante]]** `.participante_avalado_id` → **[[participante]]**

| | |
| --- | --- |
| Entidad origen | [[aval_participante]] (módulo 08) |
| Entidad destino | [[participante]] (módulo 02) |
| Columna | `participante_avalado_id` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | sí ↗ |

> [!info] Referencia entre módulos
> Esta FK conecta el módulo 08 con el 02. En los diagramas se documenta en notas al pie y, cuando es polimórfica, se valida por aplicación o trigger en lugar de con una FK física.

## Ver también

- [[08_garantia_incumplimiento]] — justificación de negocio del origen
- [[02_grupos_turnos]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
