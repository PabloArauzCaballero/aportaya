---
tags:
  - entidad
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
tabla: control_interno
clase: ControlInterno
modulo: "12 — Cumplimiento Regulatorio y Consumidor Financiero"
estereotipo: Política configurable
clave_primaria: [id]
columnas: 10
fk_salientes: 1
fk_entrantes: 1
append_only: false
---

# `control_interno`

> Módulo [[12_cumplimiento_asfi|12 — Cumplimiento Regulatorio y Consumidor Financiero]] · clase `ControlInterno` · Política configurable

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `codigo` | VARCHAR(20) | UQ | no | UQ |
| `proceso` | VARCHAR(60) | IDX | no | IDX |
| `descripcion` | VARCHAR(300) | — | no | — |
| `tipo` | VARCHAR(12) | — | no | CK |
| `frecuencia` | VARCHAR(15) | — | no | CK |
| `automatizado` | BOOLEAN | — | no | — |
| `riesgo_mitigado` | VARCHAR(120) | — | no | — |
| `responsable_id` | UUID | FK | sí | FK, NULL |
| `activo` | BOOLEAN | IDX | no | IDX |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `responsable_id` | [[usuario]] | ↗ 01 | sí | [[control_interno.responsable_id → usuario]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[prueba_control]] | `control_id` | 12 | [[prueba_control.control_id → control_interno]] |

## Entidades vecinas

[[prueba_control]] · [[usuario]]

## Ver también

- Justificación de negocio: [[12_cumplimiento_asfi]]
- Diagramas: `docs/entidades/12_cumplimiento_asfi.puml`
- Índice: [[_Entidades]] · [[Index]]
