---
tags:
  - entidad
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
tabla: beneficiario_final
clase: BeneficiarioFinal
modulo: "12 — Cumplimiento Regulatorio y Consumidor Financiero"
clave_primaria: [id]
columnas: 8
fk_salientes: 1
fk_entrantes: 0
append_only: false
---

# `beneficiario_final`

> Módulo [[12_cumplimiento_asfi|12 — Cumplimiento Regulatorio y Consumidor Financiero]] · clase `BeneficiarioFinal`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `usuario_id` | UUID | FK IDX | no | FK, IDX, M1 |
| `nombre` | VARCHAR(150) | — | no | — |
| `documento` | VARCHAR(30) | — | no | — |
| `porcentaje_participacion` | DECIMAL(5,2) | — | no | — |
| `tipo_control` | VARCHAR(30) | — | no | CK |
| `verificado` | BOOLEAN | — | no | — |
| `registrado_en` | TIMESTAMPTZ | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `usuario_id` | [[usuario]] | ↗ 01 | no | [[beneficiario_final.usuario_id → usuario]] |

## Entidades vecinas

[[usuario]]

## Ver también

- Justificación de negocio: [[12_cumplimiento_asfi]]
- Diagramas: `docs/entidades/12_cumplimiento_asfi.puml`
- Índice: [[_Entidades]] · [[Index]]
