---
tags:
  - entidad
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
tabla: instancia_reclamo
clase: InstanciaReclamo
modulo: "12 — Cumplimiento Regulatorio y Consumidor Financiero"
clave_primaria: [id]
columnas: 9
fk_salientes: 1
fk_entrantes: 0
append_only: false
---

# `instancia_reclamo`

> Módulo [[12_cumplimiento_asfi|12 — Cumplimiento Regulatorio y Consumidor Financiero]] · clase `InstanciaReclamo`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `reclamo_id` | UUID | FK IDX | no | FK, IDX |
| `instancia` | VARCHAR(15) | — | no | CK |
| `fecha_elevacion` | TIMESTAMPTZ | — | no | — |
| `numero_expediente` | VARCHAR(60) | — | sí | NULL |
| `estado` | VARCHAR(15) | — | no | CK |
| `resolucion` | TEXT | — | sí | NULL |
| `fecha_resolucion` | TIMESTAMPTZ | — | sí | NULL |
| `monto_resarcido` | DECIMAL(14,2) | — | sí | NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `reclamo_id` | [[reclamo_cliente]] | 12 | no | [[instancia_reclamo.reclamo_id → reclamo_cliente]] |

## Entidades vecinas

[[reclamo_cliente]]

## Ver también

- Justificación de negocio: [[12_cumplimiento_asfi]]
- Diagramas: `docs/entidades/12_cumplimiento_asfi.puml`
- Índice: [[_Entidades]] · [[Index]]
