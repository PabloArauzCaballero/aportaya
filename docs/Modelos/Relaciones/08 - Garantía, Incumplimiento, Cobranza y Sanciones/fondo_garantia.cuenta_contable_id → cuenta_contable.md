---
tags:
  - relacion
  - fk
  - modulo/08-garantia-incumplimiento-cobranza-y-sanciones
  - cross-modulo
origen: fondo_garantia
columna: cuenta_contable_id
destino: cuenta_contable
modulo_origen: "08"
modulo_destino: "03"
cross_modulo: true
opcional: false
cardinalidad: "no declarada en el diagrama"
---

# fondo_garantia.cuenta_contable_id → cuenta_contable

> **[[fondo_garantia]]** `.cuenta_contable_id` → **[[cuenta_contable]]**

| | |
| --- | --- |
| Entidad origen | [[fondo_garantia]] (módulo 08) |
| Entidad destino | [[cuenta_contable]] (módulo 03) |
| Columna | `cuenta_contable_id` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | sí ↗ |

> [!info] Referencia entre módulos
> Esta FK conecta el módulo 08 con el 03. En los diagramas se documenta en notas al pie y, cuando es polimórfica, se valida por aplicación o trigger en lugar de con una FK física.

## Ver también

- [[08_garantia_incumplimiento]] — justificación de negocio del origen
- [[03_aportes_pagos_qr]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
