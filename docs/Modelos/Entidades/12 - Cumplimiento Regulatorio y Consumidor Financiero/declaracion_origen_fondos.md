---
tags:
  - entidad
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
tabla: declaracion_origen_fondos
clase: DeclaracionOrigenFondos
modulo: "12 — Cumplimiento Regulatorio y Consumidor Financiero"
clave_primaria: [id]
columnas: 12
fk_salientes: 3
fk_entrantes: 1
append_only: false
---

# `declaracion_origen_fondos`

> Módulo [[12_cumplimiento_asfi|12 — Cumplimiento Regulatorio y Consumidor Financiero]] · clase `DeclaracionOrigenFondos`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `usuario_id` | UUID | FK IDX | no | FK, IDX, M1 |
| `transaccion_id` | UUID | FK | sí | FK, NULL, M10 |
| `verificada_por` | UUID | FK | sí | FK, NULL |
| `monto` | DECIMAL(16,2) | — | no | — |
| `moneda` | CHAR(3) | — | no | — |
| `origen` | VARCHAR(20) | — | no | CK |
| `descripcion` | VARCHAR(300) | — | no | — |
| `documento_respaldo_url` | VARCHAR(255) | — | sí | NULL |
| `hash_documento` | VARCHAR(64) | — | sí | NULL |
| `estado` | VARCHAR(15) | — | no | CK |
| `declarada_en` | TIMESTAMPTZ | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `transaccion_id` | [[transaccion_billetera]] | ↗ 10 | sí | [[declaracion_origen_fondos.transaccion_id → transaccion_billetera]] |
| `usuario_id` | [[usuario]] | ↗ 01 | no | [[declaracion_origen_fondos.usuario_id → usuario]] |
| `verificada_por` | [[usuario]] | ↗ 01 | sí | [[declaracion_origen_fondos.verificada_por → usuario]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[registro_operacion_relevante]] | `declaracion_origen_fondos_id` | 12 | [[registro_operacion_relevante.declaracion_origen_fondos_id → declaracion_origen_fondos]] |

## Entidades vecinas

[[registro_operacion_relevante]] · [[transaccion_billetera]] · [[usuario]]

## Ver también

- Justificación de negocio: [[12_cumplimiento_asfi]]
- Diagramas: `docs/entidades/12_cumplimiento_asfi.puml`
- Índice: [[_Entidades]] · [[Index]]
