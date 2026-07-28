---
tags:
  - entidad
  - modulo/08-garantia-incumplimiento-cobranza-y-sanciones
tabla: apelacion_sancion
clase: ApelacionSancion
modulo: "08 — Garantía, Incumplimiento, Cobranza y Sanciones"
clave_primaria: [id]
columnas: 12
fk_salientes: 3
fk_entrantes: 0
append_only: false
---

# `apelacion_sancion`

> Módulo [[08_garantia_incumplimiento|08 — Garantía, Incumplimiento, Cobranza y Sanciones]] · clase `ApelacionSancion`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `sancion_id` | UUID | FK IDX | no | FK, IDX |
| `apelante_id` | UUID | FK | no | FK |
| `resuelta_por` | UUID | FK | sí | FK, NULL |
| `argumento` | TEXT | — | no | — |
| `evidencias` | JSONB | — | no | — |
| `estado` | VARCHAR(15) | — | no | CK |
| `instancia` | VARCHAR(25) | — | no | CK |
| `resolucion` | VARCHAR(500) | — | sí | NULL |
| `presentada_en` | TIMESTAMPTZ | — | no | — |
| `fecha_limite_resolucion` | TIMESTAMPTZ | — | no | — |
| `resuelta_en` | TIMESTAMPTZ | — | sí | NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `apelante_id` | [[usuario]] | ↗ 01 | no | [[apelacion_sancion.apelante_id → usuario]] |
| `resuelta_por` | [[usuario]] | ↗ 01 | sí | [[apelacion_sancion.resuelta_por → usuario]] |
| `sancion_id` | [[sancion]] | 08 | no | [[apelacion_sancion.sancion_id → sancion]] |

## Entidades vecinas

[[sancion]] · [[usuario]]

## Ver también

- Justificación de negocio: [[08_garantia_incumplimiento]]
- Diagramas: `docs/entidades/08_garantia_incumplimiento.puml`
- Índice: [[_Entidades]] · [[Index]]
