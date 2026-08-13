---
tags:
  - entidad
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
tabla: aceptacion_contrato
clase: AceptacionContrato
modulo: "12 — Cumplimiento Regulatorio y Consumidor Financiero"
estereotipo: Objeto de valor
clave_primaria: [id]
columnas: 9
fk_salientes: 4
fk_entrantes: 0
append_only: false
---

# `aceptacion_contrato`

> Módulo [[12_cumplimiento_asfi|12 — Cumplimiento Regulatorio y Consumidor Financiero]] · clase `AceptacionContrato` · Objeto de valor

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `contrato_adhesion_id` | UUID | FK IDX | no | FK, IDX |
| `usuario_id` | UUID | FK IDX | no | FK, IDX, M1 |
| `dispositivo_id` | UUID | FK | sí | FK, NULL, M1 |
| `token_firma_id` | UUID | FK | sí | FK, NULL, M1 |
| `version_aceptada` | SMALLINT | — | no | — |
| `ip` | INET | — | sí | NULL |
| `hash_evidencia` | VARCHAR(64) | — | no | — |
| `aceptado_en` | TIMESTAMPTZ | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `contrato_adhesion_id` | [[contrato_adhesion]] | 12 | no | [[aceptacion_contrato.contrato_adhesion_id → contrato_adhesion]] |
| `dispositivo_id` | [[dispositivo]] | ↗ 01 | sí | [[aceptacion_contrato.dispositivo_id → dispositivo]] |
| `token_firma_id` | [[token_verificacion]] | ↗ 01 | sí | [[aceptacion_contrato.token_firma_id → token_verificacion]] |
| `usuario_id` | [[usuario]] | ↗ 01 | no | [[aceptacion_contrato.usuario_id → usuario]] |

## Entidades vecinas

[[contrato_adhesion]] · [[dispositivo]] · [[token_verificacion]] · [[usuario]]

## Ver también

- Justificación de negocio: [[12_cumplimiento_asfi]]
- Diagramas: `docs/entidades/12_cumplimiento_asfi.puml`
- Índice: [[_Entidades]] · [[Index]]
