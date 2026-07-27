---
tags:
  - entidad
  - modulo/03-aportes-pagos-qr-y-conciliacion
tabla: constancia_pago
clase: ConstanciaPago
modulo: "03 — Aportes, Pagos QR y Conciliación"
clave_primaria: [id]
columnas: 7
fk_salientes: 1
fk_entrantes: 0
append_only: false
---

# `constancia_pago`

> Módulo [[03_aportes_pagos_qr|03 — Aportes, Pagos QR y Conciliación]] · clase `ConstanciaPago`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `pago_id` | UUID | FK UQ | no | FK, UQ |
| `codigo_verificacion` | VARCHAR(40) | UQ | no | UQ |
| `hash_contenido` | VARCHAR(64) | — | no | — |
| `url_publica` | VARCHAR(255) | — | no | — |
| `url_pdf` | VARCHAR(255) | — | no | — |
| `fecha_generacion` | TIMESTAMPTZ | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `pago_id` | [[pago]] | 03 | no | [[constancia_pago.pago_id → pago]] |

## Entidades vecinas

[[pago]]

## Ver también

- Justificación de negocio: [[03_aportes_pagos_qr]]
- Diagramas: `docs/entidades/03_aportes_pagos_qr.puml`
- Índice: [[_Entidades]] · [[Index]]
