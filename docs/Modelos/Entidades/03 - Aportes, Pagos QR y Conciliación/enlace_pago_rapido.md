---
tags:
  - entidad
  - modulo/03-aportes-pagos-qr-y-conciliacion
tabla: enlace_pago_rapido
clase: EnlacePagoRapido
modulo: "03 — Aportes, Pagos QR y Conciliación"
clave_primaria: [id]
columnas: 6
fk_salientes: 2
fk_entrantes: 0
append_only: false
---

# `enlace_pago_rapido`

> Módulo [[03_aportes_pagos_qr|03 — Aportes, Pagos QR y Conciliación]] · clase `EnlacePagoRapido`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `orden_cobro_id` | UUID | FK UQ | no | FK, UQ |
| `token_id` | UUID | FK UQ | no | FK, UQ, M1 |
| `url_corta` | VARCHAR(60) | UQ | no | UQ |
| `clicks` | SMALLINT | — | no | — |
| `expira_en` | TIMESTAMPTZ | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `orden_cobro_id` | [[orden_cobro]] | 03 | no | [[enlace_pago_rapido.orden_cobro_id → orden_cobro]] |
| `token_id` | [[token_verificacion]] | ↗ 01 | no | [[enlace_pago_rapido.token_id → token_verificacion]] |

## Entidades vecinas

[[orden_cobro]] · [[token_verificacion]]

## Ver también

- Justificación de negocio: [[03_aportes_pagos_qr]]
- Diagramas: `docs/entidades/03_aportes_pagos_qr.puml`
- Índice: [[_Entidades]] · [[Index]]
