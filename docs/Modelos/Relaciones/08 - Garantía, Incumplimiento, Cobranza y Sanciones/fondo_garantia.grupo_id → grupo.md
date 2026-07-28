---
tags:
  - relacion
  - fk
  - modulo/08-garantia-incumplimiento-cobranza-y-sanciones
  - cross-modulo
origen: fondo_garantia
columna: grupo_id
destino: grupo
modulo_origen: "08"
modulo_destino: "02"
cross_modulo: true
opcional: true
cardinalidad: "no declarada en el diagrama"
---

# fondo_garantia.grupo_id → grupo

> **[[fondo_garantia]]** `.grupo_id` → **[[grupo]]**

| | |
| --- | --- |
| Entidad origen | [[fondo_garantia]] (módulo 08) |
| Entidad destino | [[grupo]] (módulo 02) |
| Columna | `grupo_id` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | no (admite NULL) |
| Uno a uno | sí (columna UNIQUE) |
| Cruza módulos | sí ↗ |

> [!info] Referencia entre módulos
> Esta FK conecta el módulo 08 con el 02. En los diagramas se documenta en notas al pie y, cuando es polimórfica, se valida por aplicación o trigger en lugar de con una FK física.

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[08_garantia_incumplimiento]] — justificación de negocio del origen
- [[02_grupos_turnos]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
