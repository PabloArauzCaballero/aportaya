---
tags:
  - entidad
  - modulo/10-billetera-custodia-y-dinero-electronico
  - append-only
tabla: movimiento_custodia
clase: MovimientoCustodia
modulo: "10 — Billetera, Custodia y Dinero Electrónico"
estereotipo: Objeto de valor
clave_primaria: [id]
columnas: 11
fk_salientes: 2
fk_entrantes: 0
append_only: true
---

# `movimiento_custodia`

> Módulo [[10_billetera_custodia|10 — Billetera, Custodia y Dinero Electrónico]] · clase `MovimientoCustodia` · Objeto de valor · **append-only** (sin `UPDATE`/`DELETE`)

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `cuenta_custodia_id` | UUID | FK IDX | no | FK, IDX |
| `movimiento_bancario_id` | UUID | FK UQ | sí | FK, NULL, UQ, M3 |
| `fecha_valor` | DATE | IDX | no | IDX |
| `tipo` | VARCHAR(20) | — | no | CK |
| `sentido` | VARCHAR(7) | — | no | CK |
| `monto` | DECIMAL(18,2) | — | no | CK: > 0 |
| `referencia_bancaria` | VARCHAR(80) | UQ | no | UQ |
| `glosa` | VARCHAR(200) | — | no | — |
| `conciliado` | BOOLEAN | IDX | no | IDX |
| `registrado_en` | TIMESTAMPTZ | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `cuenta_custodia_id` | [[cuenta_custodia]] | 10 | no | [[movimiento_custodia.cuenta_custodia_id → cuenta_custodia]] |
| `movimiento_bancario_id` | [[movimiento_bancario]] | ↗ 03 | sí | [[movimiento_custodia.movimiento_bancario_id → movimiento_bancario]] |

## Entidades vecinas

[[cuenta_custodia]] · [[movimiento_bancario]]

## Ver también

- Justificación de negocio: [[10_billetera_custodia]]
- Diagramas: `docs/entidades/10_billetera_custodia.puml`
- Índice: [[_Entidades]] · [[Index]]
