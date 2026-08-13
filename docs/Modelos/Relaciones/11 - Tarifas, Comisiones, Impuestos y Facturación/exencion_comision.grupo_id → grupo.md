---
tags:
  - relacion
  - fk
  - modulo/11-tarifas-comisiones-impuestos-y-facturacion
  - cross-modulo
origen: exencion_comision
columna: grupo_id
destino: grupo
modulo_origen: "11"
modulo_destino: "02"
cross_modulo: true
opcional: true
cardinalidad: "no declarada en el diagrama"
---

# exencion_comision.grupo_id → grupo

> **[[exencion_comision]]** `.grupo_id` → **[[grupo]]**

| | |
| --- | --- |
| Entidad origen | [[exencion_comision]] (módulo 11) |
| Entidad destino | [[grupo]] (módulo 02) |
| Columna | `grupo_id` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | sí ↗ |

> [!info] Referencia entre módulos
> Esta FK conecta el módulo 11 con el 02. En los diagramas se documenta en notas al pie y, cuando es polimórfica, se valida por aplicación o trigger en lugar de con una FK física.

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[11_tarifas_comisiones]] — justificación de negocio del origen
- [[02_grupos_turnos]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
