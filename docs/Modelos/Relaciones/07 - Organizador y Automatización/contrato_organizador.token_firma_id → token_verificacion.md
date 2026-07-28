---
tags:
  - relacion
  - fk
  - modulo/07-organizador-y-automatizacion
  - cross-modulo
origen: contrato_organizador
columna: token_firma_id
destino: token_verificacion
modulo_origen: "07"
modulo_destino: "01"
cross_modulo: true
opcional: true
cardinalidad: "no declarada en el diagrama"
---

# contrato_organizador.token_firma_id → token_verificacion

> **[[contrato_organizador]]** `.token_firma_id` → **[[token_verificacion]]**

| | |
| --- | --- |
| Entidad origen | [[contrato_organizador]] (módulo 07) |
| Entidad destino | [[token_verificacion]] (módulo 01) |
| Columna | `token_firma_id` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | sí ↗ |

> [!info] Referencia entre módulos
> Esta FK conecta el módulo 07 con el 01. En los diagramas se documenta en notas al pie y, cuando es polimórfica, se valida por aplicación o trigger en lugar de con una FK física.

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[07_organizador_automatizacion]] — justificación de negocio del origen
- [[01_identidad_usuarios]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
