---
tags:
  - relacion
  - fk
  - modulo/08-garantia-incumplimiento-cobranza-y-sanciones
  - cross-modulo
origen: abono_recuperacion
columna: registrado_por
destino: usuario
modulo_origen: "08"
modulo_destino: "01"
cross_modulo: true
opcional: true
cardinalidad: "no declarada en el diagrama"
---

# abono_recuperacion.registrado_por → usuario

> **[[abono_recuperacion]]** `.registrado_por` → **[[usuario]]**

| | |
| --- | --- |
| Entidad origen | [[abono_recuperacion]] (módulo 08) |
| Entidad destino | [[usuario]] (módulo 01) |
| Columna | `registrado_por` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | sí ↗ |

> [!info] Referencia entre módulos
> Esta FK conecta el módulo 08 con el 01. En los diagramas se documenta en notas al pie y, cuando es polimórfica, se valida por aplicación o trigger en lugar de con una FK física.

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[08_garantia_incumplimiento]] — justificación de negocio del origen
- [[01_identidad_usuarios]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
