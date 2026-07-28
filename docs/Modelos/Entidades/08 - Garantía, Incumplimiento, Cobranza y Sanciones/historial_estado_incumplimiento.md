---
tags:
  - entidad
  - modulo/08-garantia-incumplimiento-cobranza-y-sanciones
  - append-only
tabla: historial_estado_incumplimiento
clase: HistorialEstadoIncumplimiento
modulo: "08 — Garantía, Incumplimiento, Cobranza y Sanciones"
clave_primaria: [id]
columnas: 9
fk_salientes: 2
fk_entrantes: 0
append_only: true
---

# `historial_estado_incumplimiento`

> Módulo [[08_garantia_incumplimiento|08 — Garantía, Incumplimiento, Cobranza y Sanciones]] · clase `HistorialEstadoIncumplimiento` · **append-only** (sin `UPDATE`/`DELETE`)

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `registro_id` | UUID | FK IDX | no | FK, IDX |
| `estado_anterior` | VARCHAR(30) | — | sí | NULL |
| `estado_nuevo` | VARCHAR(30) | — | no | — |
| `motivo` | VARCHAR(300) | — | no | — |
| `monto_asociado` | DECIMAL(14,2) | — | sí | NULL |
| `ejecutado_por` | UUID | FK | sí | FK, NULL |
| `es_automatico` | BOOLEAN | — | no | — |
| `fecha_hora` | TIMESTAMPTZ | IDX | no | IDX |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `ejecutado_por` | [[usuario]] | ↗ 01 | sí | [[historial_estado_incumplimiento.ejecutado_por → usuario]] |
| `registro_id` | [[registro_incumplimiento]] | 08 | no | [[historial_estado_incumplimiento.registro_id → registro_incumplimiento]] |

## Entidades vecinas

[[registro_incumplimiento]] · [[usuario]]

## Ver también

- Justificación de negocio: [[08_garantia_incumplimiento]]
- Diagramas: `docs/entidades/08_garantia_incumplimiento.puml`
- Índice: [[_Entidades]] · [[Index]]
