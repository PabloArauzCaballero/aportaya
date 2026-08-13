---
tags:
  - entidad
  - modulo/03-aportes-pagos-qr-y-conciliacion
tabla: cierre_diario
clase: CierreDiario
modulo: "03 — Aportes, Pagos QR y Conciliación"
clave_primaria: [id]
columnas: 10
fk_salientes: 1
fk_entrantes: 1
append_only: false
---

# `cierre_diario`

> Módulo [[03_aportes_pagos_qr|03 — Aportes, Pagos QR y Conciliación]] · clase `CierreDiario`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `fecha` | DATE | UQ | no | UQ |
| `total_recaudado` | DECIMAL(16,2) | — | no | — |
| `total_conciliado` | DECIMAL(16,2) | — | no | — |
| `total_excepciones` | DECIMAL(16,2) | — | no | — |
| `cantidad_pagos` | INTEGER | — | no | — |
| `cuadrado` | BOOLEAN | — | no | — |
| `cerrado_por` | UUID | FK | no | FK |
| `cerrado_en` | TIMESTAMPTZ | — | no | — |
| `reabierto_en` | TIMESTAMPTZ | — | sí | NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `cerrado_por` | [[usuario]] | ↗ 01 | no | [[cierre_diario.cerrado_por → usuario]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[conciliacion_custodia]] | `cierre_diario_id` | ↗ 10 | [[conciliacion_custodia.cierre_diario_id → cierre_diario]] |

## Entidades vecinas

[[conciliacion_custodia]] · [[usuario]]

## Ver también

- Justificación de negocio: [[03_aportes_pagos_qr]]
- Diagramas: `docs/entidades/03_aportes_pagos_qr.puml`
- Índice: [[_Entidades]] · [[Index]]
