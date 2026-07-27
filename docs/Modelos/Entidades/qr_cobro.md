---
tags:
  - entidad
  - modulo/03-aportes-pagos-qr-y-conciliacion
tabla: qr_cobro
clase: QRCobro
modulo: "03 — Aportes, Pagos QR y Conciliación"
clave_primaria: [id]
columnas: 9
fk_salientes: 1
fk_entrantes: 0
append_only: false
---

# `qr_cobro`

> Módulo [[03_aportes_pagos_qr|03 — Aportes, Pagos QR y Conciliación]] · clase `QRCobro`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `orden_cobro_id` | UUID | FK UQ | no | FK, UQ |
| `payload_emv` | TEXT | — | no | — |
| `url_imagen` | VARCHAR(255) | — | no | — |
| `crc` | VARCHAR(8) | — | no | — |
| `banco_emisor` | VARCHAR(60) | — | no | — |
| `cuenta_abono` | VARCHAR(40) | — | no | — |
| `es_reutilizable` | BOOLEAN | — | no | — |
| `escaneos` | SMALLINT | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `orden_cobro_id` | [[orden_cobro]] | 03 | no | [[qr_cobro.orden_cobro_id → orden_cobro]] |

## Entidades vecinas

[[orden_cobro]]

## Ver también

- Justificación de negocio: [[03_aportes_pagos_qr]]
- Diagramas: `docs/entidades/03_aportes_pagos_qr.puml`
- Índice: [[_Entidades]] · [[Index]]
