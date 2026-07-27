---
tags:
  - entidad
  - modulo/03-aportes-pagos-qr-y-conciliacion
tabla: comprobante_manual
modulo: "03 — Aportes, Pagos QR y Conciliación"
clave_primaria: [id]
columnas: 9
fk_salientes: 3
fk_entrantes: 0
append_only: false
---

# `comprobante_manual`

> Módulo [[03_aportes_pagos_qr|03 — Aportes, Pagos QR y Conciliación]]

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `pago_id` | UUID | FK UQ | no | FK, UQ |
| `archivo_url` | VARCHAR(255) | — | no | — |
| `hash_archivo` | VARCHAR(64) | — | no | — |
| `estado_revision` | VARCHAR(15) | — | no | CK |
| `revisado_por` | UUID | FK | sí | FK, NULL |
| `segunda_revision_por` | UUID | FK | sí | FK, NULL |
| `motivo_rechazo` | VARCHAR(200) | — | sí | NULL |
| `fecha_revision` | TIMESTAMPTZ | — | sí | NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `pago_id` | [[pago]] | 03 | no | [[comprobante_manual.pago_id → pago]] |
| `revisado_por` | [[usuario]] | ↗ 01 | sí | [[comprobante_manual.revisado_por → usuario]] |
| `segunda_revision_por` | [[usuario]] | ↗ 01 | sí | [[comprobante_manual.segunda_revision_por → usuario]] |

## Entidades vecinas

[[pago]] · [[usuario]]

## Ver también

- Justificación de negocio: [[03_aportes_pagos_qr]]
- Diagramas: `docs/entidades/03_aportes_pagos_qr.puml`
- Índice: [[_Entidades]] · [[Index]]
