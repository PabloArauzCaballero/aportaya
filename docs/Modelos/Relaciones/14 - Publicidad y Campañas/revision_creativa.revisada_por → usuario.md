---
tags:
  - relacion
  - fk
  - modulo/14-publicidad-y-campanas
  - cross-modulo
origen: revision_creativa
columna: revisada_por
destino: usuario
modulo_origen: "14"
modulo_destino: "01"
cross_modulo: true
opcional: false
cardinalidad: "no declarada en el diagrama"
---

# revision_creativa.revisada_por → usuario

> **[[revision_creativa]]** `.revisada_por` → **[[usuario]]**

| | |
| --- | --- |
| Entidad origen | [[revision_creativa]] (módulo 14) |
| Entidad destino | [[usuario]] (módulo 01) |
| Columna | `revisada_por` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | sí ↗ |

> [!info] Referencia entre módulos
> Esta FK conecta el módulo 14 con el 01. En los diagramas se documenta en notas al pie y, cuando es polimórfica, se valida por aplicación o trigger en lugar de con una FK física.

## Ver también

- [[14_publicidad_campanas]] — justificación de negocio del origen
- [[01_identidad_usuarios]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
