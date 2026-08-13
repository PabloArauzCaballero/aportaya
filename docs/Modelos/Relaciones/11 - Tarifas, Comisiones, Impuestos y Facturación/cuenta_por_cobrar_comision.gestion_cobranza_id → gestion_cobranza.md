---
tags:
  - relacion
  - fk
  - modulo/11-tarifas-comisiones-impuestos-y-facturacion
  - cross-modulo
origen: cuenta_por_cobrar_comision
columna: gestion_cobranza_id
destino: gestion_cobranza
modulo_origen: "11"
modulo_destino: "08"
cross_modulo: true
opcional: true
cardinalidad: "no declarada en el diagrama"
---

# cuenta_por_cobrar_comision.gestion_cobranza_id → gestion_cobranza

> **[[cuenta_por_cobrar_comision]]** `.gestion_cobranza_id` → **[[gestion_cobranza]]**

| | |
| --- | --- |
| Entidad origen | [[cuenta_por_cobrar_comision]] (módulo 11) |
| Entidad destino | [[gestion_cobranza]] (módulo 08) |
| Columna | `gestion_cobranza_id` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | sí ↗ |

> [!info] Referencia entre módulos
> Esta FK conecta el módulo 11 con el 08. En los diagramas se documenta en notas al pie y, cuando es polimórfica, se valida por aplicación o trigger en lugar de con una FK física.

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[11_tarifas_comisiones]] — justificación de negocio del origen
- [[08_garantia_incumplimiento]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
