---
tags:
  - entidad
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
tabla: licencia_regulatoria
clase: LicenciaRegulatoria
modulo: "12 — Cumplimiento Regulatorio y Consumidor Financiero"
estereotipo: Raíz de agregado
clave_primaria: [id]
columnas: 14
fk_salientes: 1
fk_entrantes: 1
append_only: false
---

# `licencia_regulatoria`

> Módulo [[12_cumplimiento_asfi|12 — Cumplimiento Regulatorio y Consumidor Financiero]] · clase `LicenciaRegulatoria` · Raíz de agregado

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `organismo` | VARCHAR(10) | IDX | no | CK, IDX |
| `tipo` | VARCHAR(30) | — | no | CK |
| `categoria_actividad` | VARCHAR(40) | — | no | CK |
| `numero_resolucion` | VARCHAR(60) | UQ | sí | UQ, NULL |
| `estado` | VARCHAR(15) | IDX | no | CK, IDX |
| `fecha_solicitud` | DATE | — | no | — |
| `fecha_otorgamiento` | DATE | — | sí | NULL |
| `vigente_hasta` | DATE | — | sí | NULL |
| `alcance_autorizado` | JSONB | — | no | — |
| `garantia_seriedad` | DECIMAL(16,2) | — | sí | NULL |
| `documento_url` | VARCHAR(255) | — | sí | NULL |
| `hash_documento` | VARCHAR(64) | — | sí | NULL |
| `responsable_id` | UUID | FK | sí | FK, NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `responsable_id` | [[usuario]] | ↗ 01 | sí | [[licencia_regulatoria.responsable_id → usuario]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[entorno_prueba_regulado]] | `licencia_regulatoria_id` | 12 | [[entorno_prueba_regulado.licencia_regulatoria_id → licencia_regulatoria]] |

## Entidades vecinas

[[entorno_prueba_regulado]] · [[usuario]]

## Ver también

- Justificación de negocio: [[12_cumplimiento_asfi]]
- Diagramas: `docs/entidades/12_cumplimiento_asfi.puml`
- Índice: [[_Entidades]] · [[Index]]
