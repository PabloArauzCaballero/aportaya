---
tags:
  - relacion
  - fk
  - modulo/09-auditoria-reportes-y-cumplimiento
  - cross-modulo
origen: coincidencia_lista
columna: revisada_por
destino: usuario
modulo_origen: "09"
modulo_destino: "01"
cross_modulo: true
opcional: true
cardinalidad: "no declarada en el diagrama"
---

# coincidencia_lista.revisada_por → usuario

> **[[coincidencia_lista]]** `.revisada_por` → **[[usuario]]**

| | |
| --- | --- |
| Entidad origen | [[coincidencia_lista]] (módulo 09) |
| Entidad destino | [[usuario]] (módulo 01) |
| Columna | `revisada_por` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | sí ↗ |

> [!info] Referencia entre módulos
> Esta FK conecta el módulo 09 con el 01. En los diagramas se documenta en notas al pie y, cuando es polimórfica, se valida por aplicación o trigger en lugar de con una FK física.

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[09_auditoria_reportes]] — justificación de negocio del origen
- [[01_identidad_usuarios]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
