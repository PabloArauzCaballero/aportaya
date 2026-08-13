---
tags:
  - entidad
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
tabla: perfil_transaccional
clase: PerfilTransaccional
modulo: "12 — Cumplimiento Regulatorio y Consumidor Financiero"
clave_primaria: [id]
columnas: 12
fk_salientes: 1
fk_entrantes: 1
append_only: false
---

# `perfil_transaccional`

> Módulo [[12_cumplimiento_asfi|12 — Cumplimiento Regulatorio y Consumidor Financiero]] · clase `PerfilTransaccional`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `usuario_id` | UUID | FK IDX | no | FK, IDX, M1 |
| `tipo` | VARCHAR(10) | — | no | CK |
| `monto_mensual_estimado` | DECIMAL(16,2) | — | no | — |
| `cantidad_operaciones_estimada` | INTEGER | — | no | — |
| `actividad_economica` | VARCHAR(120) | — | no | — |
| `codigo_ciiu` | VARCHAR(10) | — | sí | NULL |
| `origen_fondos_declarado` | VARCHAR(200) | — | no | — |
| `moneda` | CHAR(3) | — | no | — |
| `fuente` | VARCHAR(30) | — | no | — |
| `vigente_desde` | TIMESTAMPTZ | — | no | — |
| `actualizado_en` | TIMESTAMPTZ | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `usuario_id` | [[usuario]] | ↗ 01 | no | [[perfil_transaccional.usuario_id → usuario]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[desvio_perfil]] | `perfil_transaccional_id` | 12 | [[desvio_perfil.perfil_transaccional_id → perfil_transaccional]] |

## Entidades vecinas

[[desvio_perfil]] · [[usuario]]

## Ver también

- Justificación de negocio: [[12_cumplimiento_asfi]]
- Diagramas: `docs/entidades/12_cumplimiento_asfi.puml`
- Índice: [[_Entidades]] · [[Index]]
