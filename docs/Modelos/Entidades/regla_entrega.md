---
tags:
  - entidad
  - modulo/04-entregas-de-fondo
tabla: regla_entrega
clase: ReglaEntrega
modulo: "04 — Entregas de Fondo"
estereotipo: Política configurable
clave_primaria: [id]
columnas: 8
fk_salientes: 0
fk_entrantes: 1
append_only: false
---

# `regla_entrega`

> Módulo [[04_entregas_fondo|04 — Entregas de Fondo]] · clase `ReglaEntrega` · Política configurable

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `codigo` | VARCHAR(40) | UQ | no | UQ |
| `descripcion` | VARCHAR(200) | — | no | — |
| `es_bloqueante` | BOOLEAN | — | no | — |
| `permite_omision` | BOOLEAN | — | no | — |
| `rol_que_puede_omitir` | VARCHAR(30) | — | sí | NULL |
| `orden` | SMALLINT | — | no | — |
| `activa` | BOOLEAN | — | no | — |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[validacion_pre_entrega]] | `regla_id` | 04 | [[validacion_pre_entrega.regla_id → regla_entrega]] |

## Entidades vecinas

[[validacion_pre_entrega]]

## Ver también

- Justificación de negocio: [[04_entregas_fondo]]
- Diagramas: `docs/entidades/04_entregas_fondo.puml`
- Índice: [[_Entidades]] · [[Index]]
