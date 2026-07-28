---
tags:
  - entidad
  - modulo/09-auditoria-reportes-y-cumplimiento
tabla: solicitud_datos_personales
clase: SolicitudDatosPersonales
modulo: "09 — Auditoría, Reportes y Cumplimiento"
clave_primaria: [id]
columnas: 10
fk_salientes: 2
fk_entrantes: 1
append_only: false
---

# `solicitud_datos_personales`

> Módulo [[09_auditoria_reportes|09 — Auditoría, Reportes y Cumplimiento]] · clase `SolicitudDatosPersonales`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `usuario_id` | UUID | FK IDX | no | FK, IDX |
| `atendida_por` | UUID | FK | sí | FK, NULL |
| `tipo` | VARCHAR(20) | — | no | CK |
| `descripcion` | VARCHAR(400) | — | no | — |
| `estado` | VARCHAR(15) | IDX | no | CK, IDX |
| `fecha_limite_legal` | TIMESTAMPTZ | IDX | no | IDX |
| `respuesta` | TEXT | — | sí | NULL |
| `recibida_en` | TIMESTAMPTZ | — | no | — |
| `atendida_en` | TIMESTAMPTZ | — | sí | NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `atendida_por` | [[usuario]] | ↗ 01 | sí | [[solicitud_datos_personales.atendida_por → usuario]] |
| `usuario_id` | [[usuario]] | ↗ 01 | no | [[solicitud_datos_personales.usuario_id → usuario]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[proceso_anonimizacion]] | `solicitud_id` | 09 | [[proceso_anonimizacion.solicitud_id → solicitud_datos_personales]] |

## Entidades vecinas

[[proceso_anonimizacion]] · [[usuario]]

## Ver también

- Justificación de negocio: [[09_auditoria_reportes]]
- Diagramas: `docs/entidades/09_auditoria_reportes.puml`
- Índice: [[_Entidades]] · [[Index]]
