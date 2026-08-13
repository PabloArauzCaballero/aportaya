---
tags:
  - relacion
  - fk
  - modulo/11-tarifas-comisiones-impuestos-y-facturacion
  - cross-modulo
origen: devengo_comision
columna: usuario_obligado_id
destino: usuario
modulo_origen: "11"
modulo_destino: "01"
cross_modulo: true
opcional: false
cardinalidad: "no declarada en el diagrama"
---

# devengo_comision.usuario_obligado_id → usuario

> **[[devengo_comision]]** `.usuario_obligado_id` → **[[usuario]]**

| | |
| --- | --- |
| Entidad origen | [[devengo_comision]] (módulo 11) |
| Entidad destino | [[usuario]] (módulo 01) |
| Columna | `usuario_obligado_id` — UUID |
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
