---
tags:
  - relacion
  - fk
  - modulo/10-billetera-custodia-y-dinero-electronico
  - cross-modulo
origen: transaccion_billetera
columna: dispositivo_id
destino: dispositivo
modulo_origen: "10"
modulo_destino: "01"
cross_modulo: true
opcional: true
cardinalidad: "no declarada en el diagrama"
---

# transaccion_billetera.dispositivo_id → dispositivo

> **[[transaccion_billetera]]** `.dispositivo_id` → **[[dispositivo]]**

| | |
| --- | --- |
| Entidad origen | [[transaccion_billetera]] (módulo 10) |
| Entidad destino | [[dispositivo]] (módulo 01) |
| Columna | `dispositivo_id` — UUID |
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
