---
tags:
  - relacion
  - fk
  - modulo/11-tarifas-comisiones-impuestos-y-facturacion
  - cross-modulo
origen: exencion_comision
columna: autorizada_por
destino: usuario
modulo_origen: "11"
modulo_destino: "01"
cross_modulo: true
opcional: false
cardinalidad: "no declarada en el diagrama"
---

# exencion_comision.autorizada_por → usuario

> **[[exencion_comision]]** `.autorizada_por` → **[[usuario]]**

| | |
| --- | --- |
| Entidad origen | [[exencion_comision]] (módulo 11) |
| Entidad destino | [[usuario]] (módulo 01) |
| Columna | `autorizada_por` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | sí ↗ |

> [!info] Referencia entre módulos
> Esta FK conecta el módulo 11 con el 01. En los diagramas se documenta en notas al pie y, cuando es polimórfica, se valida por aplicación o trigger en lugar de con una FK física.

## Ver también

- [[11_tarifas_comisiones]] — justificación de negocio del origen
- [[01_identidad_usuarios]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
