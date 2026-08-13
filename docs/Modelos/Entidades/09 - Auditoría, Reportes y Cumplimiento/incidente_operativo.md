---
tags:
  - entidad
  - modulo/09-auditoria-reportes-y-cumplimiento
tabla: incidente_operativo
clase: IncidenteOperativo
modulo: "09 — Auditoría, Reportes y Cumplimiento"
clave_primaria: [id]
columnas: 13
fk_salientes: 0
fk_entrantes: 3
append_only: false
---

# `incidente_operativo`

> Módulo [[09_auditoria_reportes|09 — Auditoría, Reportes y Cumplimiento]] · clase `IncidenteOperativo`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `codigo` | VARCHAR(20) | UQ | no | UQ |
| `titulo` | VARCHAR(160) | — | no | — |
| `severidad` | VARCHAR(6) | — | no | CK |
| `sistema_afectado` | VARCHAR(60) | — | no | — |
| `descripcion` | TEXT | — | no | — |
| `impacto_usuarios` | INTEGER | — | no | — |
| `impacto_monetario` | DECIMAL(16,2) | — | no | — |
| `estado` | VARCHAR(15) | — | no | CK |
| `detectado_en` | TIMESTAMPTZ | — | no | — |
| `resuelto_en` | TIMESTAMPTZ | — | sí | NULL |
| `causa_raiz` | TEXT | — | sí | NULL |
| `acciones_correctivas` | TEXT | — | sí | NULL |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[descuadre_custodia]] | `incidente_operativo_id` | ↗ 10 | [[descuadre_custodia.incidente_operativo_id → incidente_operativo]] |
| [[evento_riesgo_operativo]] | `incidente_operativo_id` | ↗ 12 | [[evento_riesgo_operativo.incidente_operativo_id → incidente_operativo]] |
| [[incidente_seguridad]] | `incidente_operativo_id` | ↗ 12 | [[incidente_seguridad.incidente_operativo_id → incidente_operativo]] |

## Entidades vecinas

[[descuadre_custodia]] · [[evento_riesgo_operativo]] · [[incidente_seguridad]]

## Ver también

- Justificación de negocio: [[09_auditoria_reportes]]
- Diagramas: `docs/entidades/09_auditoria_reportes.puml`
- Índice: [[_Entidades]] · [[Index]]
