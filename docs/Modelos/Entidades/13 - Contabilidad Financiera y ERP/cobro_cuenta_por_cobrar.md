---
tags:
  - entidad
  - modulo/13-contabilidad-financiera-y-erp
  - append-only
tabla: cobro_cuenta_por_cobrar
clase: CobroCuentaPorCobrar
modulo: "13 — Contabilidad Financiera y ERP"
clave_primaria: [id]
columnas: 7
fk_salientes: 2
fk_entrantes: 0
append_only: true
---

# `cobro_cuenta_por_cobrar`

> Módulo [[13_contabilidad_erp|13 — Contabilidad Financiera y ERP]] · clase `CobroCuentaPorCobrar` · **append-only** (sin `UPDATE`/`DELETE`)

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `cuenta_por_cobrar_id` | UUID | FK IDX | no | FK, IDX |
| `monto` | DECIMAL(14,2) | — | no | CK: > 0 |
| `moneda` | CHAR(3) | — | no | — |
| `fecha_cobro` | TIMESTAMPTZ | — | no | — |
| `forma_cobro` | VARCHAR(20) | — | no | CK |
| `asiento_contable_id` | UUID | FK | sí | FK, NULL, M3 |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `asiento_contable_id` | [[asiento_contable]] | ↗ 03 | sí | [[cobro_cuenta_por_cobrar.asiento_contable_id → asiento_contable]] |
| `cuenta_por_cobrar_id` | [[cuenta_por_cobrar]] | 13 | no | [[cobro_cuenta_por_cobrar.cuenta_por_cobrar_id → cuenta_por_cobrar]] |

## Entidades vecinas

[[asiento_contable]] · [[cuenta_por_cobrar]]

## Ver también

- Justificación de negocio: [[13_contabilidad_erp]]
- Diagramas: `docs/entidades/13_contabilidad_erp.puml`
- Índice: [[_Entidades]] · [[Index]]
