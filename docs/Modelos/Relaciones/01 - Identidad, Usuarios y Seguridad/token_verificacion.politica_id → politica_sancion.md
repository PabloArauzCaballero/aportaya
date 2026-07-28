---
tags:
  - relacion
  - fk
  - modulo/01-identidad-usuarios-y-seguridad
  - cross-modulo
origen: token_verificacion
columna: politica_id
destino: politica_sancion
modulo_origen: "01"
modulo_destino: "08"
cross_modulo: true
opcional: false
cardinalidad: "no declarada en el diagrama"
---

# token_verificacion.politica_id → politica_sancion

> **[[token_verificacion]]** `.politica_id` → **[[politica_sancion]]**

| | |
| --- | --- |
| Entidad origen | [[token_verificacion]] (módulo 01) |
| Entidad destino | [[politica_sancion]] (módulo 08) |
| Columna | `politica_id` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | sí ↗ |

> [!info] Referencia entre módulos
> Esta FK conecta el módulo 01 con el 08. En los diagramas se documenta en notas al pie y, cuando es polimórfica, se valida por aplicación o trigger en lugar de con una FK física.

## Ver también

- [[01_identidad_usuarios]] — justificación de negocio del origen
- [[08_garantia_incumplimiento]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
