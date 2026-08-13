---
tags:
  - entidad
  - modulo/03-aportes-pagos-qr-y-conciliacion
  - append-only
tabla: asiento_contable
clase: AsientoContable
modulo: "03 — Aportes, Pagos QR y Conciliación"
clave_primaria: [id]
columnas: 10
fk_salientes: 3
fk_entrantes: 8
append_only: true
---

# `asiento_contable`

> Módulo [[03_aportes_pagos_qr|03 — Aportes, Pagos QR y Conciliación]] · clase `AsientoContable` · **append-only** (sin `UPDATE`/`DELETE`)

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `numero` | BIGSERIAL | UQ | no | UQ |
| `fecha` | TIMESTAMPTZ | IDX | no | IDX |
| `glosa` | VARCHAR(200) | — | no | — |
| `origen_tipo` | VARCHAR(20) | — | no | CK |
| `origen_id` | UUID | IDX | no | IDX, polimorfica |
| `grupo_id` | UUID | FK IDX | sí | FK, NULL, IDX |
| `estado` | VARCHAR(15) | — | no | CK |
| `asiento_reversa_id` | UUID | FK | sí | FK, NULL |
| `registrado_por` | UUID | FK | sí | FK, NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `asiento_reversa_id` | [[asiento_contable]] | 03 | sí | [[asiento_contable.asiento_reversa_id → asiento_contable]] |
| `grupo_id` | [[grupo]] | ↗ 02 | sí | [[asiento_contable.grupo_id → grupo]] |
| `registrado_por` | [[usuario]] | ↗ 01 | sí | [[asiento_contable.registrado_por → usuario]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[asiento_contable]] | `asiento_reversa_id` | 03 | [[asiento_contable.asiento_reversa_id → asiento_contable]] |
| [[castigo_deuda]] | `asiento_contable_id` | ↗ 08 | [[castigo_deuda.asiento_contable_id → asiento_contable]] |
| [[cobertura_incumplimiento]] | `asiento_contable_id` | ↗ 08 | [[cobertura_incumplimiento.asiento_contable_id → asiento_contable]] |
| [[devengo_comision]] | `asiento_contable_id` | ↗ 11 | [[devengo_comision.asiento_contable_id → asiento_contable]] |
| [[liquidacion_ingresos]] | `asiento_contable_id` | ↗ 11 | [[liquidacion_ingresos.asiento_contable_id → asiento_contable]] |
| [[movimiento_contable]] | `asiento_id` | 03 | [[movimiento_contable.asiento_id → asiento_contable]] |
| [[movimiento_fondo]] | `asiento_contable_id` | ↗ 08 | [[movimiento_fondo.asiento_contable_id → asiento_contable]] |
| [[transaccion_billetera]] | `asiento_contable_id` | ↗ 10 | [[transaccion_billetera.asiento_contable_id → asiento_contable]] |

## Entidades vecinas

[[asiento_contable]] · [[castigo_deuda]] · [[cobertura_incumplimiento]] · [[devengo_comision]] · [[grupo]] · [[liquidacion_ingresos]] · [[movimiento_contable]] · [[movimiento_fondo]] · [[transaccion_billetera]] · [[usuario]]

## Notas del modelo

> **Invariante contable**
> Trigger AFTER: por cada asiento CONFIRMADO,
> SUM(debe) = SUM(haber). Los asientos no se
> editan ni borran: se reversan (asiento_reversa_id).
> origen_id es polimorfica: pago.id, entrega.id (M4)
> y cobertura_incumplimiento.id (M8).

## Ver también

- Justificación de negocio: [[03_aportes_pagos_qr]]
- Diagramas: `docs/entidades/03_aportes_pagos_qr.puml`
- Índice: [[_Entidades]] · [[Index]]
