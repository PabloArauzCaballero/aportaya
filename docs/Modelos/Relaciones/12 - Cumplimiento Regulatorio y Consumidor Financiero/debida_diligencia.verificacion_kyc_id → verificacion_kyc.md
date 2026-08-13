---
tags:
  - relacion
  - fk
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
  - cross-modulo
origen: debida_diligencia
columna: verificacion_kyc_id
destino: verificacion_kyc
modulo_origen: "12"
modulo_destino: "01"
cross_modulo: true
opcional: true
cardinalidad: "no declarada en el diagrama"
---

# debida_diligencia.verificacion_kyc_id → verificacion_kyc

> **[[debida_diligencia]]** `.verificacion_kyc_id` → **[[verificacion_kyc]]**

| | |
| --- | --- |
| Entidad origen | [[debida_diligencia]] (módulo 12) |
| Entidad destino | [[verificacion_kyc]] (módulo 01) |
| Columna | `verificacion_kyc_id` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | sí ↗ |

> [!info] Referencia entre módulos
> Esta FK conecta el módulo 12 con el 01. En los diagramas se documenta en notas al pie y, cuando es polimórfica, se valida por aplicación o trigger en lugar de con una FK física.

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[12_cumplimiento_asfi]] — justificación de negocio del origen
- [[01_identidad_usuarios]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
