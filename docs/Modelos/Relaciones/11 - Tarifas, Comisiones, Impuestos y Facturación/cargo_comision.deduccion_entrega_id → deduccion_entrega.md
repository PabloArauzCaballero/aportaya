---
tags:
  - relacion
  - fk
  - modulo/11-tarifas-comisiones-impuestos-y-facturacion
  - cross-modulo
origen: cargo_comision
columna: deduccion_entrega_id
destino: deduccion_entrega
modulo_origen: "11"
modulo_destino: "04"
cross_modulo: true
opcional: true
cardinalidad: "no declarada en el diagrama"
---

# cargo_comision.deduccion_entrega_id → deduccion_entrega

> **[[cargo_comision]]** `.deduccion_entrega_id` → **[[deduccion_entrega]]**

| | |
| --- | --- |
| Entidad origen | [[cargo_comision]] (módulo 11) |
| Entidad destino | [[deduccion_entrega]] (módulo 04) |
| Columna | `deduccion_entrega_id` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | no (admite NULL) |
| Uno a uno | sí (columna UNIQUE) |
| Cruza módulos | sí ↗ |

> [!info] Referencia entre módulos
> Esta FK conecta el módulo 11 con el 04. En los diagramas se documenta en notas al pie y, cuando es polimórfica, se valida por aplicación o trigger en lugar de con una FK física.

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[11_tarifas_comisiones]] — justificación de negocio del origen
- [[04_entregas_fondo]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
