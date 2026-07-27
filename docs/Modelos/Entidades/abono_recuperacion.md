---
tags:
  - entidad
  - modulo/08-garantia-incumplimiento-cobranza-y-sanciones
  - append-only
tabla: abono_recuperacion
clase: AbonoRecuperacion
modulo: "08 — Garantía, Incumplimiento, Cobranza y Sanciones"
clave_primaria: [id]
columnas: 13
fk_salientes: 5
fk_entrantes: 0
append_only: true
---

# `abono_recuperacion`

> Módulo [[08_garantia_incumplimiento|08 — Garantía, Incumplimiento, Cobranza y Sanciones]] · clase `AbonoRecuperacion` · **append-only** (sin `UPDATE`/`DELETE`)

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `deuda_id` | UUID | FK IDX | no | FK, IDX |
| `pago_id` | UUID | FK | sí | FK, NULL, M3 |
| `entrega_id` | UUID | FK | sí | FK, NULL, M4 |
| `movimiento_fondo_id` | UUID | FK | sí | FK, NULL |
| `monto` | DECIMAL(14,2) <<CK: > 0>> | — | no | — |
| `origen` | VARCHAR(30) | — | no | CK |
| `aplicado_a_capital` | DECIMAL(14,2) | — | no | — |
| `aplicado_a_recargos` | DECIMAL(14,2) | — | no | — |
| `saldo_resultante` | DECIMAL(14,2) | — | no | — |
| `fecha` | TIMESTAMPTZ | IDX | no | IDX |
| `registrado_por` | UUID | FK | sí | FK, NULL |
| `revertido_en` | TIMESTAMPTZ | — | sí | NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `deuda_id` | [[deuda_participante]] | 08 | no | [[abono_recuperacion.deuda_id → deuda_participante]] |
| `entrega_id` | [[entrega_fondo]] | ↗ 04 | sí | [[abono_recuperacion.entrega_id → entrega_fondo]] |
| `movimiento_fondo_id` | [[movimiento_fondo]] | 08 | sí | [[abono_recuperacion.movimiento_fondo_id → movimiento_fondo]] |
| `pago_id` | [[pago]] | ↗ 03 | sí | [[abono_recuperacion.pago_id → pago]] |
| `registrado_por` | [[usuario]] | ↗ 01 | sí | [[abono_recuperacion.registrado_por → usuario]] |

## Entidades vecinas

[[deuda_participante]] · [[entrega_fondo]] · [[movimiento_fondo]] · [[pago]] · [[usuario]]

## Ver también

- Justificación de negocio: [[08_garantia_incumplimiento]]
- Diagramas: `docs/entidades/08_garantia_incumplimiento.puml`
- Índice: [[_Entidades]] · [[Index]]
