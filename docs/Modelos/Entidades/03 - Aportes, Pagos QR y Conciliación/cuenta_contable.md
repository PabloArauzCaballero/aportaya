---
tags:
  - entidad
  - modulo/03-aportes-pagos-qr-y-conciliacion
tabla: cuenta_contable
clase: CuentaContable
modulo: "03 — Aportes, Pagos QR y Conciliación"
clave_primaria: [id]
columnas: 8
fk_salientes: 2
fk_entrantes: 5
append_only: false
---

# `cuenta_contable`

> Módulo [[03_aportes_pagos_qr|03 — Aportes, Pagos QR y Conciliación]] · clase `CuentaContable`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `codigo` | VARCHAR(20) | UQ | no | UQ |
| `nombre` | VARCHAR(80) | — | no | — |
| `tipo` | VARCHAR(15) | — | no | CK |
| `naturaleza` | VARCHAR(12) | — | no | CK |
| `grupo_id` | UUID | FK | sí | FK, NULL |
| `participante_id` | UUID | FK | sí | FK, NULL |
| `saldo` | DECIMAL(16,2) | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `grupo_id` | [[grupo]] | ↗ 02 | sí | [[cuenta_contable.grupo_id → grupo]] |
| `participante_id` | [[participante]] | ↗ 02 | sí | [[cuenta_contable.participante_id → participante]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[concepto_tarifa]] | `cuenta_ingreso_id` | ↗ 11 | [[concepto_tarifa.cuenta_ingreso_id → cuenta_contable]] |
| [[cuenta_billetera]] | `cuenta_contable_id` | ↗ 10 | [[cuenta_billetera.cuenta_contable_id → cuenta_contable]] |
| [[fondo_garantia]] | `cuenta_contable_id` | ↗ 08 | [[fondo_garantia.cuenta_contable_id → cuenta_contable]] |
| [[impuesto]] | `cuenta_contable_id` | ↗ 11 | [[impuesto.cuenta_contable_id → cuenta_contable]] |
| [[movimiento_contable]] | `cuenta_id` | 03 | [[movimiento_contable.cuenta_id → cuenta_contable]] |

## Entidades vecinas

[[concepto_tarifa]] · [[cuenta_billetera]] · [[fondo_garantia]] · [[grupo]] · [[impuesto]] · [[movimiento_contable]] · [[participante]]

## Ver también

- Justificación de negocio: [[03_aportes_pagos_qr]]
- Diagramas: `docs/entidades/03_aportes_pagos_qr.puml`
- Índice: [[_Entidades]] · [[Index]]
