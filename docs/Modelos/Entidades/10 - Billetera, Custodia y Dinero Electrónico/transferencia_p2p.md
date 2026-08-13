---
tags:
  - entidad
  - modulo/10-billetera-custodia-y-dinero-electronico
tabla: transferencia_p2p
clase: TransferenciaP2P
modulo: "10 — Billetera, Custodia y Dinero Electrónico"
clave_primaria: [id]
columnas: 11
fk_salientes: 5
fk_entrantes: 0
append_only: false
---

# `transferencia_p2p`

> Módulo [[10_billetera_custodia|10 — Billetera, Custodia y Dinero Electrónico]] · clase `TransferenciaP2P`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `transaccion_id` | UUID | FK UQ | no | FK, UQ |
| `cuenta_billetera_origen_id` | UUID | FK IDX | no | FK, IDX |
| `cuenta_billetera_destino_id` | UUID | FK IDX | no | FK, IDX |
| `grupo_id` | UUID | FK | sí | FK, NULL |
| `obligacion_id` | UUID | FK | sí | FK, NULL, M3 |
| `monto` | DECIMAL(16,2) | — | no | CK: > 0 |
| `moneda` | CHAR(3) | — | no | — |
| `concepto` | VARCHAR(140) | — | no | — |
| `estado` | VARCHAR(15) | — | no | CK |
| `ejecutada_en` | TIMESTAMPTZ | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `cuenta_billetera_destino_id` | [[cuenta_billetera]] | 10 | no | [[transferencia_p2p.cuenta_billetera_destino_id → cuenta_billetera]] |
| `cuenta_billetera_origen_id` | [[cuenta_billetera]] | 10 | no | [[transferencia_p2p.cuenta_billetera_origen_id → cuenta_billetera]] |
| `grupo_id` | [[grupo]] | ↗ 02 | sí | [[transferencia_p2p.grupo_id → grupo]] |
| `obligacion_id` | [[obligacion_aporte]] | ↗ 03 | sí | [[transferencia_p2p.obligacion_id → obligacion_aporte]] |
| `transaccion_id` | [[transaccion_billetera]] | 10 | no | [[transferencia_p2p.transaccion_id → transaccion_billetera]] |

## Entidades vecinas

[[cuenta_billetera]] · [[grupo]] · [[obligacion_aporte]] · [[transaccion_billetera]]

## Ver también

- Justificación de negocio: [[10_billetera_custodia]]
- Diagramas: `docs/entidades/10_billetera_custodia.puml`
- Índice: [[_Entidades]] · [[Index]]
