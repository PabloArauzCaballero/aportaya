---
tags:
  - entidad
  - modulo/08-garantia-incumplimiento-cobranza-y-sanciones
tabla: candidato_reemplazo
clase: CandidatoReemplazo
modulo: "08 — Garantía, Incumplimiento, Cobranza y Sanciones"
clave_primaria: [id]
columnas: 7
fk_salientes: 2
fk_entrantes: 0
append_only: false
---

# `candidato_reemplazo`

> Módulo [[08_garantia_incumplimiento|08 — Garantía, Incumplimiento, Cobranza y Sanciones]] · clase `CandidatoReemplazo`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `reemplazo_id` | UUID | FK IDX | no | FK, IDX |
| `usuario_id` | UUID | FK | no | FK |
| `puntaje_reputacion` | DECIMAL(6,2) | — | no | — |
| `acepta_condiciones` | BOOLEAN | — | no | — |
| `fuente_candidato` | VARCHAR(20) | — | no | CK |
| `estado` | VARCHAR(15) | — | no | CK |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `reemplazo_id` | [[reemplazo_participante]] | 08 | no | [[candidato_reemplazo.reemplazo_id → reemplazo_participante]] |
| `usuario_id` | [[usuario]] | ↗ 01 | no | [[candidato_reemplazo.usuario_id → usuario]] |

## Entidades vecinas

[[reemplazo_participante]] · [[usuario]]

## Ver también

- Justificación de negocio: [[08_garantia_incumplimiento]]
- Diagramas: `docs/entidades/08_garantia_incumplimiento.puml`
- Índice: [[_Entidades]] · [[Index]]
