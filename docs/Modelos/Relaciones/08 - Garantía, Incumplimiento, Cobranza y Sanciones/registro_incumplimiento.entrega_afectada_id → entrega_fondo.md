---
tags:
  - relacion
  - fk
  - modulo/08-garantia-incumplimiento-cobranza-y-sanciones
  - cross-modulo
origen: registro_incumplimiento
columna: entrega_afectada_id
destino: entrega_fondo
modulo_origen: "08"
modulo_destino: "04"
cross_modulo: true
opcional: true
cardinalidad: "no declarada en el diagrama"
---

# registro_incumplimiento.entrega_afectada_id → entrega_fondo

> **[[registro_incumplimiento]]** `.entrega_afectada_id` → **[[entrega_fondo]]**

| | |
| --- | --- |
| Entidad origen | [[registro_incumplimiento]] (módulo 08) |
| Entidad destino | [[entrega_fondo]] (módulo 04) |
| Columna | `entrega_afectada_id` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | sí ↗ |

> [!info] Referencia entre módulos
> Esta FK conecta el módulo 08 con el 04. En los diagramas se documenta en notas al pie y, cuando es polimórfica, se valida por aplicación o trigger en lugar de con una FK física.

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[08_garantia_incumplimiento]] — justificación de negocio del origen
- [[04_entregas_fondo]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
