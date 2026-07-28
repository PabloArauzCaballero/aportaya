---
tags:
  - entidad
  - modulo/08-garantia-incumplimiento-cobranza-y-sanciones
tabla: descargo_participante
clase: DescargoParticipante
modulo: "08 — Garantía, Incumplimiento, Cobranza y Sanciones"
clave_primaria: [id]
columnas: 10
fk_salientes: 3
fk_entrantes: 0
append_only: false
---

# `descargo_participante`

> Módulo [[08_garantia_incumplimiento|08 — Garantía, Incumplimiento, Cobranza y Sanciones]] · clase `DescargoParticipante`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `registro_id` | UUID | FK IDX | no | FK, IDX |
| `participante_id` | UUID | FK | no | FK |
| `argumento` | TEXT | — | no | — |
| `evidencias` | JSONB | — | no | — |
| `estado` | VARCHAR(15) | — | no | CK |
| `resolucion` | VARCHAR(400) | — | sí | NULL |
| `resuelto_por` | UUID | FK | sí | FK, NULL |
| `presentado_en` | TIMESTAMPTZ | — | no | — |
| `resuelto_en` | TIMESTAMPTZ | — | sí | NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `participante_id` | [[participante]] | ↗ 02 | no | [[descargo_participante.participante_id → participante]] |
| `registro_id` | [[registro_incumplimiento]] | 08 | no | [[descargo_participante.registro_id → registro_incumplimiento]] |
| `resuelto_por` | [[usuario]] | ↗ 01 | sí | [[descargo_participante.resuelto_por → usuario]] |

## Entidades vecinas

[[participante]] · [[registro_incumplimiento]] · [[usuario]]

## Ver también

- Justificación de negocio: [[08_garantia_incumplimiento]]
- Diagramas: `docs/entidades/08_garantia_incumplimiento.puml`
- Índice: [[_Entidades]] · [[Index]]
