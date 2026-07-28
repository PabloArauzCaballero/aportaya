---
tags:
  - relacion
  - fk
  - modulo/06-transparencia-y-reputacion
  - cross-modulo
origen: puntaje_reputacion
columna: usuario_id
destino: usuario
modulo_origen: "06"
modulo_destino: "01"
cross_modulo: true
opcional: false
cardinalidad: "no declarada en el diagrama"
---

# puntaje_reputacion.usuario_id → usuario

> **[[puntaje_reputacion]]** `.usuario_id` → **[[usuario]]**

| | |
| --- | --- |
| Entidad origen | [[puntaje_reputacion]] (módulo 06) |
| Entidad destino | [[usuario]] (módulo 01) |
| Columna | `usuario_id` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | sí |
| Uno a uno | sí (columna UNIQUE) |
| Cruza módulos | sí ↗ |

> [!info] Referencia entre módulos
> Esta FK conecta el módulo 06 con el 01. En los diagramas se documenta en notas al pie y, cuando es polimórfica, se valida por aplicación o trigger en lugar de con una FK física.

## Ver también

- [[06_transparencia_reputacion]] — justificación de negocio del origen
- [[01_identidad_usuarios]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
