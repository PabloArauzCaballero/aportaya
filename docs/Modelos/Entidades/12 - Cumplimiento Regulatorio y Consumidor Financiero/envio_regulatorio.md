---
tags:
  - entidad
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
tabla: envio_regulatorio
clase: EnvioRegulatorio
modulo: "12 — Cumplimiento Regulatorio y Consumidor Financiero"
clave_primaria: [id]
columnas: 10
fk_salientes: 2
fk_entrantes: 1
append_only: false
---

# `envio_regulatorio`

> Módulo [[12_cumplimiento_asfi|12 — Cumplimiento Regulatorio y Consumidor Financiero]] · clase `EnvioRegulatorio`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `reporte_regulatorio_id` | UUID | FK IDX | no | FK, IDX |
| `enviado_por` | UUID | FK | sí | FK, NULL |
| `organismo` | VARCHAR(10) | — | no | CK |
| `canal` | VARCHAR(20) | — | no | CK |
| `fecha_envio` | TIMESTAMPTZ | IDX | no | IDX |
| `numero_constancia` | VARCHAR(60) | UQ | sí | UQ, NULL |
| `estado` | VARCHAR(15) | IDX | no | CK, IDX |
| `respuesta` | JSONB | — | sí | NULL |
| `reintentos` | SMALLINT | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `enviado_por` | [[usuario]] | ↗ 01 | sí | [[envio_regulatorio.enviado_por → usuario]] |
| `reporte_regulatorio_id` | [[reporte_regulatorio]] | 12 | no | [[envio_regulatorio.reporte_regulatorio_id → reporte_regulatorio]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[observacion_regulatoria]] | `envio_regulatorio_id` | 12 | [[observacion_regulatoria.envio_regulatorio_id → envio_regulatorio]] |

## Entidades vecinas

[[observacion_regulatoria]] · [[reporte_regulatorio]] · [[usuario]]

## Ver también

- Justificación de negocio: [[12_cumplimiento_asfi]]
- Diagramas: `docs/entidades/12_cumplimiento_asfi.puml`
- Índice: [[_Entidades]] · [[Index]]
