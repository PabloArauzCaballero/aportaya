---
tags:
  - entidad
  - modulo/09-auditoria-reportes-y-cumplimiento
tabla: lista_restrictiva_externa
clase: ListaRestrictivaExterna
modulo: "09 — Auditoría, Reportes y Cumplimiento"
clave_primaria: [id]
columnas: 5
fk_salientes: 0
fk_entrantes: 1
append_only: false
---

# `lista_restrictiva_externa`

> Módulo [[09_auditoria_reportes|09 — Auditoría, Reportes y Cumplimiento]] · clase `ListaRestrictivaExterna`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `nombre_lista` | VARCHAR(30) | UQ | no | UQ+version |
| `version` | VARCHAR(20) | — | no | — |
| `fecha_actualizacion` | DATE | — | no | — |
| `registros` | INTEGER | — | no | — |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[coincidencia_lista]] | `lista_id` | 09 | [[coincidencia_lista.lista_id → lista_restrictiva_externa]] |

## Entidades vecinas

[[coincidencia_lista]]

## Ver también

- Justificación de negocio: [[09_auditoria_reportes]]
- Diagramas: `docs/entidades/09_auditoria_reportes.puml`
- Índice: [[_Entidades]] · [[Index]]
