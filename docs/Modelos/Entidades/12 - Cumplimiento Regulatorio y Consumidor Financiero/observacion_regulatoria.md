---
tags:
  - entidad
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
tabla: observacion_regulatoria
clase: ObservacionRegulatoria
modulo: "12 — Cumplimiento Regulatorio y Consumidor Financiero"
clave_primaria: [id]
columnas: 13
fk_salientes: 2
fk_entrantes: 0
append_only: false
---

# `observacion_regulatoria`

> Módulo [[12_cumplimiento_asfi|12 — Cumplimiento Regulatorio y Consumidor Financiero]] · clase `ObservacionRegulatoria`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `envio_regulatorio_id` | UUID | FK | sí | FK, NULL |
| `responsable_id` | UUID | FK | sí | FK, NULL |
| `organismo` | VARCHAR(10) | — | no | CK |
| `tipo` | VARCHAR(15) | IDX | no | CK, IDX |
| `numero_documento` | VARCHAR(60) | UQ | no | UQ |
| `descripcion` | TEXT | — | no | — |
| `monto_multa` | DECIMAL(16,2) | — | sí | NULL |
| `plazo_respuesta` | DATE | IDX | no | IDX |
| `estado` | VARCHAR(15) | IDX | no | CK, IDX |
| `respuesta` | TEXT | — | sí | NULL |
| `recibida_en` | TIMESTAMPTZ | — | no | — |
| `respondida_en` | TIMESTAMPTZ | — | sí | NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `envio_regulatorio_id` | [[envio_regulatorio]] | 12 | sí | [[observacion_regulatoria.envio_regulatorio_id → envio_regulatorio]] |
| `responsable_id` | [[usuario]] | ↗ 01 | sí | [[observacion_regulatoria.responsable_id → usuario]] |

## Entidades vecinas

[[envio_regulatorio]] · [[usuario]]

## Ver también

- Justificación de negocio: [[12_cumplimiento_asfi]]
- Diagramas: `docs/entidades/12_cumplimiento_asfi.puml`
- Índice: [[_Entidades]] · [[Index]]
