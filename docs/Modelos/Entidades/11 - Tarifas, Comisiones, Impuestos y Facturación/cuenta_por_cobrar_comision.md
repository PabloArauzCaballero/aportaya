---
tags:
  - entidad
  - modulo/11-tarifas-comisiones-impuestos-y-facturacion
tabla: cuenta_por_cobrar_comision
clase: CuentaPorCobrarComision
modulo: "11 — Tarifas, Comisiones, Impuestos y Facturación"
clave_primaria: [id]
columnas: 10
fk_salientes: 3
fk_entrantes: 0
append_only: false
---

# `cuenta_por_cobrar_comision`

> Módulo [[11_tarifas_comisiones|11 — Tarifas, Comisiones, Impuestos y Facturación]] · clase `CuentaPorCobrarComision`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `devengo_id` | UUID | FK UQ | no | FK, UQ |
| `usuario_id` | UUID | FK IDX | no | FK, IDX, M1 |
| `gestion_cobranza_id` | UUID | FK | sí | FK, NULL, M8 |
| `monto` | DECIMAL(12,2) | — | no | — |
| `saldo` | DECIMAL(12,2) | — | no | — |
| `dias_vencido` | SMALLINT | IDX | no | IDX |
| `estado` | VARCHAR(15) | IDX | no | CK, IDX |
| `vence_en` | DATE | — | no | — |
| `castigada_en` | TIMESTAMPTZ | — | sí | NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `devengo_id` | [[devengo_comision]] | 11 | no | [[cuenta_por_cobrar_comision.devengo_id → devengo_comision]] |
| `gestion_cobranza_id` | [[gestion_cobranza]] | ↗ 08 | sí | [[cuenta_por_cobrar_comision.gestion_cobranza_id → gestion_cobranza]] |
| `usuario_id` | [[usuario]] | ↗ 01 | no | [[cuenta_por_cobrar_comision.usuario_id → usuario]] |

## Entidades vecinas

[[devengo_comision]] · [[gestion_cobranza]] · [[usuario]]

## Ver también

- Justificación de negocio: [[11_tarifas_comisiones]]
- Diagramas: `docs/entidades/11_tarifas_comisiones.puml`
- Índice: [[_Entidades]] · [[Index]]
