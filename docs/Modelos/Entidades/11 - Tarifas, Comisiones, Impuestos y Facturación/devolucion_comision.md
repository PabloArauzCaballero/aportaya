---
tags:
  - entidad
  - modulo/11-tarifas-comisiones-impuestos-y-facturacion
tabla: devolucion_comision
clase: DevolucionComision
modulo: "11 — Tarifas, Comisiones, Impuestos y Facturación"
clave_primaria: [id]
columnas: 12
fk_salientes: 4
fk_entrantes: 2
append_only: false
---

# `devolucion_comision`

> Módulo [[11_tarifas_comisiones|11 — Tarifas, Comisiones, Impuestos y Facturación]] · clase `DevolucionComision`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `devengo_id` | UUID | FK IDX | no | FK, IDX |
| `transaccion_id` | UUID | FK | sí | FK, NULL, M10 |
| `reclamo_id` | UUID | FK | sí | FK, NULL, M12 |
| `autorizada_por` | UUID | FK | no | FK |
| `motivo` | VARCHAR(30) | — | no | CK |
| `detalle` | VARCHAR(300) | — | no | — |
| `monto_devuelto` | DECIMAL(12,2) | — | no | CK: > 0 |
| `forma` | VARCHAR(25) | — | no | CK |
| `estado` | VARCHAR(15) | IDX | no | CK, IDX |
| `solicitada_en` | TIMESTAMPTZ | — | no | — |
| `ejecutada_en` | TIMESTAMPTZ | — | sí | NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `autorizada_por` | [[usuario]] | ↗ 01 | no | [[devolucion_comision.autorizada_por → usuario]] |
| `devengo_id` | [[devengo_comision]] | 11 | no | [[devolucion_comision.devengo_id → devengo_comision]] |
| `reclamo_id` | [[reclamo_cliente]] | ↗ 12 | sí | [[devolucion_comision.reclamo_id → reclamo_cliente]] |
| `transaccion_id` | [[transaccion_billetera]] | ↗ 10 | sí | [[devolucion_comision.transaccion_id → transaccion_billetera]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[nota_credito_debito]] | `devolucion_comision_id` | 11 | [[nota_credito_debito.devolucion_comision_id → devolucion_comision]] |
| [[reclamo_cliente]] | `devolucion_comision_id` | ↗ 12 | [[reclamo_cliente.devolucion_comision_id → devolucion_comision]] |

## Entidades vecinas

[[devengo_comision]] · [[nota_credito_debito]] · [[reclamo_cliente]] · [[transaccion_billetera]] · [[usuario]]

## Ver también

- Justificación de negocio: [[11_tarifas_comisiones]]
- Diagramas: `docs/entidades/11_tarifas_comisiones.puml`
- Índice: [[_Entidades]] · [[Index]]
