---
tags:
  - entidad
  - modulo/08-garantia-incumplimiento-cobranza-y-sanciones
tabla: deuda_participante
clase: DeudaParticipante
modulo: "08 — Garantía, Incumplimiento, Cobranza y Sanciones"
estereotipo: Raíz de agregado
clave_primaria: [id]
columnas: 18
fk_salientes: 5
fk_entrantes: 4
append_only: false
---

# `deuda_participante`

> Módulo [[08_garantia_incumplimiento|08 — Garantía, Incumplimiento, Cobranza y Sanciones]] · clase `DeudaParticipante` · Raíz de agregado

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `usuario_id` | UUID | FK IDX | no | FK, IDX |
| `participante_id` | UUID | FK | no | FK |
| `grupo_id` | UUID | FK IDX | no | FK, IDX |
| `registro_id` | UUID | FK UQ | no | FK, UQ |
| `cobertura_id` | UUID | FK UQ | sí | FK, NULL, UQ |
| `acreedor` | VARCHAR(20) | — | no | CK |
| `capital_original` | DECIMAL(14,2) | — | no | — |
| `recargos_acumulados` | DECIMAL(14,2) | — | no | — |
| `total_abonado` | DECIMAL(14,2) | — | no | — |
| `saldo_actual` | DECIMAL(14,2) <<CK: >= 0, IDX>> | — | no | — |
| `moneda` | CHAR(3) | — | no | — |
| `estado` | VARCHAR(20) | IDX | no | CK, IDX |
| `es_subrogada` | BOOLEAN | — | no | — |
| `fecha_exigibilidad` | DATE | — | no | — |
| `fecha_prescripcion` | DATE | IDX | no | IDX |
| `dias_vencida` | SMALLINT | — | no | — |
| `version` | INTEGER | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `cobertura_id` | [[cobertura_incumplimiento]] | 08 | sí | [[deuda_participante.cobertura_id → cobertura_incumplimiento]] |
| `grupo_id` | [[grupo]] | ↗ 02 | no | [[deuda_participante.grupo_id → grupo]] |
| `participante_id` | [[participante]] | ↗ 02 | no | [[deuda_participante.participante_id → participante]] |
| `registro_id` | [[registro_incumplimiento]] | 08 | no | [[deuda_participante.registro_id → registro_incumplimiento]] |
| `usuario_id` | [[usuario]] | ↗ 01 | no | [[deuda_participante.usuario_id → usuario]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[abono_recuperacion]] | `deuda_id` | 08 | [[abono_recuperacion.deuda_id → deuda_participante]] |
| [[castigo_deuda]] | `deuda_id` | 08 | [[castigo_deuda.deuda_id → deuda_participante]] |
| [[ejecucion_aval]] | `deuda_id` | 08 | [[ejecucion_aval.deuda_id → deuda_participante]] |
| [[subrogacion]] | `deuda_id` | 08 | [[subrogacion.deuda_id → deuda_participante]] |

## Entidades vecinas

[[abono_recuperacion]] · [[castigo_deuda]] · [[cobertura_incumplimiento]] · [[ejecucion_aval]] · [[grupo]] · [[participante]] · [[registro_incumplimiento]] · [[subrogacion]] · [[usuario]]

## Notas del modelo

> **La deuda sobrevive al grupo**
> Vive a nivel usuario, no solo participante:
> si el grupo termina, la deuda sigue exigible y
> bloquea el ingreso a nuevos grupos mediante
> restriccion_usuario (M1).
> CHECK: saldo_actual = capital_original
> + recargos_acumulados - total_abonado.

## Ver también

- Justificación de negocio: [[08_garantia_incumplimiento]]
- Diagramas: `docs/entidades/08_garantia_incumplimiento.puml`
- Índice: [[_Entidades]] · [[Index]]
