---
tags:
  - entidad
  - modulo/08-garantia-incumplimiento-cobranza-y-sanciones
tabla: politica_cobertura
clase: PoliticaCobertura
modulo: "08 — Garantía, Incumplimiento, Cobranza y Sanciones"
estereotipo: Política configurable
clave_primaria: [id]
columnas: 13
fk_salientes: 1
fk_entrantes: 1
append_only: false
---

# `politica_cobertura`

> Módulo [[08_garantia_incumplimiento|08 — Garantía, Incumplimiento, Cobranza y Sanciones]] · clase `PoliticaCobertura` · Política configurable

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `grupo_id` | UUID | FK | sí | FK, NULL |
| `porcentaje_constitucion` | DECIMAL(5,2) | — | no | — |
| `dias_mora_para_activar` | SMALLINT | — | no | — |
| `porcentaje_maximo_cobertura_por_aporte` | DECIMAL(5,2) | — | no | — |
| `tope_cobertura_por_participante` | DECIMAL(14,2) | — | no | — |
| `tope_cobertura_por_periodo` | DECIMAL(14,2) | — | no | — |
| `max_coberturas_por_participante` | SMALLINT | — | no | — |
| `exige_aval_previo` | BOOLEAN | — | no | — |
| `requiere_aprobacion_manual_desde` | DECIMAL(14,2) | — | no | — |
| `plazo_recuperacion_dias` | SMALLINT | — | no | — |
| `tasa_recargo_recuperacion` | DECIMAL(5,2) | — | no | — |
| `vigente_desde` | TIMESTAMPTZ | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `grupo_id` | [[grupo]] | ↗ 02 | sí | [[politica_cobertura.grupo_id → grupo]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[fondo_garantia]] | `politica_cobertura_id` | 08 | [[fondo_garantia.politica_cobertura_id → politica_cobertura]] |

## Entidades vecinas

[[fondo_garantia]] · [[grupo]]

## Ver también

- Justificación de negocio: [[08_garantia_incumplimiento]]
- Diagramas: `docs/entidades/08_garantia_incumplimiento.puml`
- Índice: [[_Entidades]] · [[Index]]
