---
tags:
  - entidad
  - modulo/02-grupos-cupos-turnos-y-gobernanza
tabla: configuracion_grupo
clase: ConfiguracionGrupo
modulo: "02 — Grupos, Cupos, Turnos y Gobernanza"
clave_primaria: [grupo_id]
columnas: 10
fk_salientes: 3
fk_entrantes: 0
append_only: false
---

# `configuracion_grupo`

> Módulo [[02_grupos_turnos|02 — Grupos, Cupos, Turnos y Gobernanza]] · clase `ConfiguracionGrupo`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `grupo_id` | UUID | PK FK | no | PK, FK |
| `permite_cupos_multiples` | BOOLEAN | — | no | — |
| `max_cupos_por_persona` | SMALLINT | — | no | — |
| `permite_permuta_turnos` | BOOLEAN | — | no | — |
| `requiere_avalista` | BOOLEAN | — | no | — |
| `permite_ingreso_tardio` | BOOLEAN | — | no | — |
| `hora_limite_pago` | TIME | — | no | — |
| `tolerancia_monto_parcial` | DECIMAL(5,2) | — | no | — |
| `politica_mora_id` | UUID | FK | sí | FK, NULL |
| `politica_sancion_id` | UUID | FK | sí | FK, NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `grupo_id` | [[grupo]] | 02 | no | [[configuracion_grupo.grupo_id → grupo]] |
| `politica_mora_id` | [[politica_mora]] | ↗ 03 | sí | [[configuracion_grupo.politica_mora_id → politica_mora]] |
| `politica_sancion_id` | [[politica_sancion]] | ↗ 08 | sí | [[configuracion_grupo.politica_sancion_id → politica_sancion]] |

## Entidades vecinas

[[grupo]] · [[politica_mora]] · [[politica_sancion]]

## Ver también

- Justificación de negocio: [[02_grupos_turnos]]
- Diagramas: `docs/entidades/02_grupos_turnos.puml`
- Índice: [[_Entidades]] · [[Index]]
