---
tags:
  - entidad
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
tabla: activo_informacion
clase: ActivoInformacion
modulo: "12 — Cumplimiento Regulatorio y Consumidor Financiero"
clave_primaria: [id]
columnas: 14
fk_salientes: 3
fk_entrantes: 1
append_only: false
---

# `activo_informacion`

> Módulo [[12_cumplimiento_asfi|12 — Cumplimiento Regulatorio y Consumidor Financiero]] · clase `ActivoInformacion`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `propietario_id` | UUID | FK | sí | FK, NULL |
| `custodio_id` | UUID | FK | sí | FK, NULL |
| `contrato_tercero_id` | UUID | FK | sí | FK, NULL |
| `codigo` | VARCHAR(30) | UQ | no | UQ |
| `nombre` | VARCHAR(120) | — | no | — |
| `tipo` | VARCHAR(25) | — | no | CK |
| `clasificacion` | VARCHAR(15) | IDX | no | CK, IDX |
| `contiene_datos_personales` | BOOLEAN | IDX | no | IDX |
| `contiene_datos_sensibles` | BOOLEAN | — | no | — |
| `criticidad` | VARCHAR(10) | — | no | CK |
| `ubicacion` | VARCHAR(120) | — | no | — |
| `exige_cifrado` | BOOLEAN | — | no | — |
| `ultima_revision` | DATE | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `contrato_tercero_id` | [[contrato_tercero]] | 12 | sí | [[activo_informacion.contrato_tercero_id → contrato_tercero]] |
| `custodio_id` | [[usuario]] | ↗ 01 | sí | [[activo_informacion.custodio_id → usuario]] |
| `propietario_id` | [[usuario]] | ↗ 01 | sí | [[activo_informacion.propietario_id → usuario]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[incidente_seguridad]] | `activo_informacion_id` | 12 | [[incidente_seguridad.activo_informacion_id → activo_informacion]] |

## Entidades vecinas

[[contrato_tercero]] · [[incidente_seguridad]] · [[usuario]]

## Ver también

- Justificación de negocio: [[12_cumplimiento_asfi]]
- Diagramas: `docs/entidades/12_cumplimiento_asfi.puml`
- Índice: [[_Entidades]] · [[Index]]
