---
tags:
  - entidad
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
tabla: contrato_adhesion
clase: ContratoAdhesion
modulo: "12 — Cumplimiento Regulatorio y Consumidor Financiero"
estereotipo: Raíz de agregado
clave_primaria: [id]
columnas: 13
fk_salientes: 1
fk_entrantes: 1
append_only: false
---

# `contrato_adhesion`

> Módulo [[12_cumplimiento_asfi|12 — Cumplimiento Regulatorio y Consumidor Financiero]] · clase `ContratoAdhesion` · Raíz de agregado

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `codigo` | VARCHAR(30) | UQ | no | UQ+version |
| `version` | SMALLINT | — | no | — |
| `tipo` | VARCHAR(25) | IDX | no | CK, IDX |
| `estado` | VARCHAR(15) | — | no | CK |
| `url_documento` | VARCHAR(255) | — | no | — |
| `hash_documento` | VARCHAR(64) | — | no | — |
| `registrado_ante_regulador` | BOOLEAN | — | no | — |
| `numero_registro` | VARCHAR(60) | — | sí | NULL |
| `fecha_registro` | DATE | — | sí | NULL |
| `vigente_desde` | TIMESTAMPTZ | — | no | — |
| `vigente_hasta` | TIMESTAMPTZ | — | sí | NULL |
| `aprobado_por` | UUID | FK | sí | FK, NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `aprobado_por` | [[usuario]] | ↗ 01 | sí | [[contrato_adhesion.aprobado_por → usuario]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[aceptacion_contrato]] | `contrato_adhesion_id` | 12 | [[aceptacion_contrato.contrato_adhesion_id → contrato_adhesion]] |

## Entidades vecinas

[[aceptacion_contrato]] · [[usuario]]

## Ver también

- Justificación de negocio: [[12_cumplimiento_asfi]]
- Diagramas: `docs/entidades/12_cumplimiento_asfi.puml`
- Índice: [[_Entidades]] · [[Index]]
