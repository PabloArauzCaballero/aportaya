---
tags:
  - entidad
  - modulo/08-garantia-incumplimiento-cobranza-y-sanciones
tabla: sancion
clase: Sancion
modulo: "08 — Garantía, Incumplimiento, Cobranza y Sanciones"
clave_primaria: [id]
columnas: 16
fk_salientes: 6
fk_entrantes: 1
append_only: false
---

# `sancion`

> Módulo [[08_garantia_incumplimiento|08 — Garantía, Incumplimiento, Cobranza y Sanciones]] · clase `Sancion`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `registro_id` | UUID | FK IDX | no | FK, IDX |
| `usuario_id` | UUID | FK IDX | no | FK, IDX |
| `participante_id` | UUID | FK | sí | FK, NULL |
| `matriz_id` | UUID | FK | sí | FK, NULL |
| `acuerdo_grupo_id` | UUID | FK | sí | FK, NULL, M2 |
| `aplicada_por` | UUID | FK | sí | FK, NULL |
| `tipo` | VARCHAR(35) | IDX | no | CK, IDX |
| `descripcion` | VARCHAR(300) | — | no | — |
| `monto_recargo` | DECIMAL(14,2) | — | sí | NULL |
| `impacto_reputacion` | DECIMAL(6,2) | — | sí | NULL |
| `vigente_desde` | TIMESTAMPTZ | — | no | — |
| `vigente_hasta` | TIMESTAMPTZ | — | sí | NULL |
| `estado` | VARCHAR(20) | IDX | no | CK, IDX |
| `notificada_en` | TIMESTAMPTZ | — | sí | NULL |
| `firme_en` | TIMESTAMPTZ | — | sí | NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `acuerdo_grupo_id` | [[acuerdo]] | ↗ 02 | sí | [[sancion.acuerdo_grupo_id → acuerdo]] |
| `aplicada_por` | [[usuario]] | ↗ 01 | sí | [[sancion.aplicada_por → usuario]] |
| `matriz_id` | [[matriz_sancion]] | 08 | sí | [[sancion.matriz_id → matriz_sancion]] |
| `participante_id` | [[participante]] | ↗ 02 | sí | [[sancion.participante_id → participante]] |
| `registro_id` | [[registro_incumplimiento]] | 08 | no | [[sancion.registro_id → registro_incumplimiento]] |
| `usuario_id` | [[usuario]] | ↗ 01 | no | [[sancion.usuario_id → usuario]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[apelacion_sancion]] | `sancion_id` | 08 | [[apelacion_sancion.sancion_id → sancion]] |

## Entidades vecinas

[[acuerdo]] · [[apelacion_sancion]] · [[matriz_sancion]] · [[participante]] · [[registro_incumplimiento]] · [[usuario]]

## Notas del modelo

> Solo se ejecuta cuando estado = 'FIRME':
> antes hubo notificacion, plazo de descargo y,
> si se apelo, resolucion. Toda transicion queda
> en la bitacora del modulo 9 y genera
> evento_reputacion en el modulo 6.

## Ver también

- Justificación de negocio: [[08_garantia_incumplimiento]]
- Diagramas: `docs/entidades/08_garantia_incumplimiento.puml`
- Índice: [[_Entidades]] · [[Index]]
