---
tags:
  - entidad
  - modulo/09-auditoria-reportes-y-cumplimiento
tabla: regla_cumplimiento
clase: ReglaCumplimiento
modulo: "09 — Auditoría, Reportes y Cumplimiento"
estereotipo: Política configurable
clave_primaria: [id]
columnas: 10
fk_salientes: 0
fk_entrantes: 1
append_only: false
---

# `regla_cumplimiento`

> Módulo [[09_auditoria_reportes|09 — Auditoría, Reportes y Cumplimiento]] · clase `ReglaCumplimiento` · Política configurable

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `codigo` | VARCHAR(40) | UQ | no | UQ |
| `descripcion` | VARCHAR(300) | — | no | — |
| `categoria` | VARCHAR(25) | — | no | CK |
| `expresion` | VARCHAR(400) | — | no | — |
| `umbral` | DECIMAL(16,2) | — | sí | NULL |
| `ventana_horas` | SMALLINT | — | sí | NULL |
| `severidad` | VARCHAR(10) | — | no | CK |
| `accion_automatica` | VARCHAR(20) | — | no | CK |
| `activa` | BOOLEAN | — | no | — |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[alerta_cumplimiento]] | `regla_id` | 09 | [[alerta_cumplimiento.regla_id → regla_cumplimiento]] |

## Entidades vecinas

[[alerta_cumplimiento]]

## Ver también

- Justificación de negocio: [[09_auditoria_reportes]]
- Diagramas: `docs/entidades/09_auditoria_reportes.puml`
- Índice: [[_Entidades]] · [[Index]]
