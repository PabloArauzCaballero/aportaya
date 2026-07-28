---
tags:
  - entidad
  - modulo/08-garantia-incumplimiento-cobranza-y-sanciones
tabla: liquidacion_participante
clase: LiquidacionParticipante
modulo: "08 — Garantía, Incumplimiento, Cobranza y Sanciones"
clave_primaria: [id]
columnas: 8
fk_salientes: 2
fk_entrantes: 0
append_only: false
---

# `liquidacion_participante`

> Módulo [[08_garantia_incumplimiento|08 — Garantía, Incumplimiento, Cobranza y Sanciones]] · clase `LiquidacionParticipante`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `disolucion_id` | UUID | FK IDX | no | FK, IDX |
| `participante_id` | UUID | FK | no | FK |
| `total_aportado` | DECIMAL(14,2) | — | no | — |
| `total_cobrado` | DECIMAL(14,2) | — | no | — |
| `deuda_pendiente` | DECIMAL(14,2) | — | no | — |
| `posicion_neta` | DECIMAL(14,2) | — | no | — |
| `estado` | VARCHAR(15) | — | no | CK |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `disolucion_id` | [[disolucion_anticipada]] | 08 | no | [[liquidacion_participante.disolucion_id → disolucion_anticipada]] |
| `participante_id` | [[participante]] | ↗ 02 | no | [[liquidacion_participante.participante_id → participante]] |

## Entidades vecinas

[[disolucion_anticipada]] · [[participante]]

## Ver también

- Justificación de negocio: [[08_garantia_incumplimiento]]
- Diagramas: `docs/entidades/08_garantia_incumplimiento.puml`
- Índice: [[_Entidades]] · [[Index]]
