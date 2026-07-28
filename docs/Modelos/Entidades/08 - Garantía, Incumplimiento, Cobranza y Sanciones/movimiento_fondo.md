---
tags:
  - entidad
  - modulo/08-garantia-incumplimiento-cobranza-y-sanciones
  - append-only
tabla: movimiento_fondo
clase: MovimientoFondo
modulo: "08 — Garantía, Incumplimiento, Cobranza y Sanciones"
clave_primaria: [id]
columnas: 11
fk_salientes: 3
fk_entrantes: 2
append_only: true
---

# `movimiento_fondo`

> Módulo [[08_garantia_incumplimiento|08 — Garantía, Incumplimiento, Cobranza y Sanciones]] · clase `MovimientoFondo` · **append-only** (sin `UPDATE`/`DELETE`)

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `fondo_id` | UUID | FK IDX | no | FK, IDX |
| `asiento_contable_id` | UUID | FK | sí | FK, NULL, M3 |
| `tipo` | VARCHAR(30) | IDX | no | CK, IDX |
| `monto` | DECIMAL(14,2) | — | no | — |
| `saldo_resultante` | DECIMAL(16,2) | — | no | — |
| `referencia_tipo` | VARCHAR(30) | — | no | — |
| `referencia_id` | UUID | IDX | no | IDX |
| `descripcion` | VARCHAR(200) | — | no | — |
| `fecha` | TIMESTAMPTZ | IDX | no | IDX |
| `registrado_por` | UUID | FK | sí | FK, NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `asiento_contable_id` | [[asiento_contable]] | ↗ 03 | sí | [[movimiento_fondo.asiento_contable_id → asiento_contable]] |
| `fondo_id` | [[fondo_garantia]] | 08 | no | [[movimiento_fondo.fondo_id → fondo_garantia]] |
| `registrado_por` | [[usuario]] | ↗ 01 | sí | [[movimiento_fondo.registrado_por → usuario]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[abono_recuperacion]] | `movimiento_fondo_id` | 08 | [[abono_recuperacion.movimiento_fondo_id → movimiento_fondo]] |
| [[cobertura_incumplimiento]] | `movimiento_fondo_id` | 08 | [[cobertura_incumplimiento.movimiento_fondo_id → movimiento_fondo]] |

## Entidades vecinas

[[abono_recuperacion]] · [[asiento_contable]] · [[cobertura_incumplimiento]] · [[fondo_garantia]] · [[usuario]]

## Ver también

- Justificación de negocio: [[08_garantia_incumplimiento]]
- Diagramas: `docs/entidades/08_garantia_incumplimiento.puml`
- Índice: [[_Entidades]] · [[Index]]
