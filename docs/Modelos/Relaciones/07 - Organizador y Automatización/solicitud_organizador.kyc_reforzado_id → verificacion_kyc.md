---
tags:
  - relacion
  - fk
  - modulo/07-organizador-y-automatizacion
  - cross-modulo
origen: solicitud_organizador
columna: kyc_reforzado_id
destino: verificacion_kyc
modulo_origen: "07"
modulo_destino: "01"
cross_modulo: true
opcional: true
cardinalidad: "no declarada en el diagrama"
---

# solicitud_organizador.kyc_reforzado_id → verificacion_kyc

> **[[solicitud_organizador]]** `.kyc_reforzado_id` → **[[verificacion_kyc]]**

| | |
| --- | --- |
| Entidad origen | [[solicitud_organizador]] (módulo 07) |
| Entidad destino | [[verificacion_kyc]] (módulo 01) |
| Columna | `kyc_reforzado_id` — UUID |
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
