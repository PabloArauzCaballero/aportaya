---
tags:
  - relacion
  - fk
  - modulo/03-aportes-pagos-qr-y-conciliacion
  - cross-modulo
origen: excepcion_conciliacion
columna: asignada_a
destino: usuario
modulo_origen: "03"
modulo_destino: "01"
cross_modulo: true
opcional: true
cardinalidad: "no declarada en el diagrama"
---

# excepcion_conciliacion.asignada_a → usuario

> **[[excepcion_conciliacion]]** `.asignada_a` → **[[usuario]]**

| | |
| --- | --- |
| Entidad origen | [[excepcion_conciliacion]] (módulo 03) |
| Entidad destino | [[usuario]] (módulo 01) |
| Columna | `asignada_a` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | sí ↗ |

> [!info] Referencia entre módulos
> Esta FK conecta el módulo 03 con el 01. En los diagramas se documenta en notas al pie y, cuando es polimórfica, se valida por aplicación o trigger en lugar de con una FK física.

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[03_aportes_pagos_qr]] — justificación de negocio del origen
- [[01_identidad_usuarios]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
