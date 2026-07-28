---
tags:
  - relacion
  - fk
  - modulo/07-organizador-y-automatizacion
  - cross-modulo
origen: sancion_organizador
columna: aplicada_por
destino: usuario
modulo_origen: "07"
modulo_destino: "01"
cross_modulo: true
opcional: false
cardinalidad: "no declarada en el diagrama"
---

# sancion_organizador.aplicada_por → usuario

> **[[sancion_organizador]]** `.aplicada_por` → **[[usuario]]**

| | |
| --- | --- |
| Entidad origen | [[sancion_organizador]] (módulo 07) |
| Entidad destino | [[usuario]] (módulo 01) |
| Columna | `aplicada_por` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | sí ↗ |

> [!info] Referencia entre módulos
> Esta FK conecta el módulo 07 con el 01. En los diagramas se documenta en notas al pie y, cuando es polimórfica, se valida por aplicación o trigger en lugar de con una FK física.

## Ver también

- [[07_organizador_automatizacion]] — justificación de negocio del origen
- [[01_identidad_usuarios]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
