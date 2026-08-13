---
tags:
  - entidad
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
tabla: contrato_tercero
clase: ContratoTercero
modulo: "12 — Cumplimiento Regulatorio y Consumidor Financiero"
estereotipo: Raíz de agregado
clave_primaria: [id]
columnas: 18
fk_salientes: 1
fk_entrantes: 2
append_only: false
---

# `contrato_tercero`

> Módulo [[12_cumplimiento_asfi|12 — Cumplimiento Regulatorio y Consumidor Financiero]] · clase `ContratoTercero` · Raíz de agregado

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `responsable_id` | UUID | FK | sí | FK, NULL |
| `razon_social` | VARCHAR(150) | — | no | — |
| `nit` | VARCHAR(20) | — | sí | NULL |
| `servicio_contratado` | VARCHAR(160) | — | no | — |
| `es_critico` | BOOLEAN | IDX | no | IDX |
| `accede_a_datos_personales` | BOOLEAN | IDX | no | IDX |
| `pais_procesamiento` | CHAR(2) | — | no | — |
| `nivel_riesgo` | VARCHAR(10) | — | no | CK |
| `evaluacion_riesgo_url` | VARCHAR(255) | — | sí | NULL |
| `clausula_confidencialidad` | BOOLEAN | — | no | — |
| `clausula_auditoria` | BOOLEAN | — | no | — |
| `clausula_continuidad` | BOOLEAN | — | no | — |
| `acuerdo_nivel_servicio` | JSONB | — | no | — |
| `comunicado_al_organismo` | BOOLEAN | — | no | — |
| `vigente_desde` | DATE | — | no | — |
| `vigente_hasta` | DATE | — | sí | NULL |
| `estado` | VARCHAR(15) | IDX | no | CK, IDX |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `responsable_id` | [[usuario]] | ↗ 01 | sí | [[contrato_tercero.responsable_id → usuario]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[activo_informacion]] | `contrato_tercero_id` | 12 | [[activo_informacion.contrato_tercero_id → contrato_tercero]] |
| [[evaluacion_tercero]] | `contrato_tercero_id` | 12 | [[evaluacion_tercero.contrato_tercero_id → contrato_tercero]] |

## Entidades vecinas

[[activo_informacion]] · [[evaluacion_tercero]] · [[usuario]]

## Ver también

- Justificación de negocio: [[12_cumplimiento_asfi]]
- Diagramas: `docs/entidades/12_cumplimiento_asfi.puml`
- Índice: [[_Entidades]] · [[Index]]
