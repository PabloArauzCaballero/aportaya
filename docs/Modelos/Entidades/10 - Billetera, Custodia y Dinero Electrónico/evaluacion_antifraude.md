---
tags:
  - entidad
  - modulo/10-billetera-custodia-y-dinero-electronico
tabla: evaluacion_antifraude
clase: EvaluacionAntifraude
modulo: "10 — Billetera, Custodia y Dinero Electrónico"
estereotipo: Objeto de valor
clave_primaria: [id]
columnas: 11
fk_salientes: 3
fk_entrantes: 0
append_only: false
---

# `evaluacion_antifraude`

> Módulo [[10_billetera_custodia|10 — Billetera, Custodia y Dinero Electrónico]] · clase `EvaluacionAntifraude` · Objeto de valor

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `transaccion_id` | UUID | FK IDX | sí | FK, NULL, IDX |
| `cuenta_billetera_id` | UUID | FK IDX | no | FK, IDX |
| `revisada_por` | UUID | FK | sí | FK, NULL |
| `motor_version` | VARCHAR(20) | — | no | — |
| `puntaje_riesgo` | DECIMAL(5,2) | IDX | no | IDX |
| `decision` | VARCHAR(20) | IDX | no | CK, IDX |
| `reglas_disparadas` | JSONB | — | no | — |
| `latencia_ms` | INTEGER | — | no | — |
| `evaluada_en` | TIMESTAMPTZ | IDX | no | IDX |
| `revisada_en` | TIMESTAMPTZ | — | sí | NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `cuenta_billetera_id` | [[cuenta_billetera]] | 10 | no | [[evaluacion_antifraude.cuenta_billetera_id → cuenta_billetera]] |
| `revisada_por` | [[usuario]] | ↗ 01 | sí | [[evaluacion_antifraude.revisada_por → usuario]] |
| `transaccion_id` | [[transaccion_billetera]] | 10 | sí | [[evaluacion_antifraude.transaccion_id → transaccion_billetera]] |

## Entidades vecinas

[[cuenta_billetera]] · [[transaccion_billetera]] · [[usuario]]

## Ver también

- Justificación de negocio: [[10_billetera_custodia]]
- Diagramas: `docs/entidades/10_billetera_custodia.puml`
- Índice: [[_Entidades]] · [[Index]]
