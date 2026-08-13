---
tags:
  - entidad
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
tabla: desvio_perfil
clase: DesvioPerfil
modulo: "12 — Cumplimiento Regulatorio y Consumidor Financiero"
clave_primaria: [id]
columnas: 12
fk_salientes: 3
fk_entrantes: 0
append_only: false
---

# `desvio_perfil`

> Módulo [[12_cumplimiento_asfi|12 — Cumplimiento Regulatorio y Consumidor Financiero]] · clase `DesvioPerfil`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `usuario_id` | UUID | FK IDX | no | FK, IDX, M1 |
| `perfil_transaccional_id` | UUID | FK | no | FK |
| `alerta_monitoreo_id` | UUID | FK | sí | FK, NULL |
| `periodo` | CHAR(7) | UQ | no | UQ+usuario_id |
| `monto_observado` | DECIMAL(16,2) | — | no | — |
| `monto_esperado` | DECIMAL(16,2) | — | no | — |
| `desvio_porcentual` | DECIMAL(8,2) | IDX | no | IDX |
| `severidad` | VARCHAR(10) | — | no | CK |
| `estado` | VARCHAR(15) | IDX | no | CK, IDX |
| `justificacion` | VARCHAR(500) | — | sí | NULL |
| `detectado_en` | TIMESTAMPTZ | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `alerta_monitoreo_id` | [[alerta_monitoreo_lft]] | 12 | sí | [[desvio_perfil.alerta_monitoreo_id → alerta_monitoreo_lft]] |
| `perfil_transaccional_id` | [[perfil_transaccional]] | 12 | no | [[desvio_perfil.perfil_transaccional_id → perfil_transaccional]] |
| `usuario_id` | [[usuario]] | ↗ 01 | no | [[desvio_perfil.usuario_id → usuario]] |

## Entidades vecinas

[[alerta_monitoreo_lft]] · [[perfil_transaccional]] · [[usuario]]

## Ver también

- Justificación de negocio: [[12_cumplimiento_asfi]]
- Diagramas: `docs/entidades/12_cumplimiento_asfi.puml`
- Índice: [[_Entidades]] · [[Index]]
