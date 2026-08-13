---
tags:
  - relacion
  - fk
  - modulo/11-tarifas-comisiones-impuestos-y-facturacion
  - cross-modulo
origen: tarifa_congelada_grupo
columna: acuerdo_id
destino: acuerdo
modulo_origen: "11"
modulo_destino: "02"
cross_modulo: true
opcional: true
cardinalidad: "no declarada en el diagrama"
---

# tarifa_congelada_grupo.acuerdo_id → acuerdo

> **[[tarifa_congelada_grupo]]** `.acuerdo_id` → **[[acuerdo]]**

| | |
| --- | --- |
| Entidad origen | [[tarifa_congelada_grupo]] (módulo 11) |
| Entidad destino | [[acuerdo]] (módulo 02) |
| Columna | `acuerdo_id` — UUID |
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
