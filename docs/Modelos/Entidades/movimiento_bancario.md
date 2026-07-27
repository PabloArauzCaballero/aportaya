---
tags:
  - entidad
  - modulo/03-aportes-pagos-qr-y-conciliacion
tabla: movimiento_bancario
clase: MovimientoBancario
modulo: "03 — Aportes, Pagos QR y Conciliación"
clave_primaria: [id]
columnas: 9
fk_salientes: 1
fk_entrantes: 1
append_only: false
---

# `movimiento_bancario`

> Módulo [[03_aportes_pagos_qr|03 — Aportes, Pagos QR y Conciliación]] · clase `MovimientoBancario`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `extracto_id` | UUID | FK IDX | no | FK, IDX |
| `fecha_movimiento` | DATE | IDX | no | IDX |
| `monto` | DECIMAL(14,2) | — | no | — |
| `moneda` | CHAR(3) | — | no | — |
| `glosa` | VARCHAR(200) | IDX | no | IDX full-text |
| `referencia_banco` | VARCHAR(80) | UQ | no | UQ+extracto_id |
| `cuenta_origen` | VARCHAR(40) | — | sí | NULL |
| `conciliado` | BOOLEAN | IDX | no | IDX |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `extracto_id` | [[extracto_bancario]] | 03 | no | [[movimiento_bancario.extracto_id → extracto_bancario]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[conciliacion]] | `movimiento_bancario_id` | 03 | [[conciliacion.movimiento_bancario_id → movimiento_bancario]] |

## Entidades vecinas

[[conciliacion]] · [[extracto_bancario]]

## Ver también

- Justificación de negocio: [[03_aportes_pagos_qr]]
- Diagramas: `docs/entidades/03_aportes_pagos_qr.puml`
- Índice: [[_Entidades]] · [[Index]]
