---
tags:
  - relacion
  - fk
  - modulo/10-billetera-custodia-y-dinero-electronico
  - cross-modulo
origen: politica_billetera
columna: aprobada_por
destino: usuario
modulo_origen: "10"
modulo_destino: "01"
cross_modulo: true
opcional: true
cardinalidad: "no declarada en el diagrama"
---

# politica_billetera.aprobada_por → usuario

> **[[politica_billetera]]** `.aprobada_por` → **[[usuario]]**

| | |
| --- | --- |
| Entidad origen | [[politica_billetera]] (módulo 10) |
| Entidad destino | [[usuario]] (módulo 01) |
| Columna | `aprobada_por` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | sí ↗ |

> [!info] Referencia entre módulos
> Esta FK conecta el módulo 10 con el 01. En los diagramas se documenta en notas al pie y, cuando es polimórfica, se valida por aplicación o trigger en lugar de con una FK física.

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[10_billetera_custodia]] — justificación de negocio del origen
- [[01_identidad_usuarios]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
