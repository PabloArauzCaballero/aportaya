---
tags:
  - entidad
  - modulo/09-auditoria-reportes-y-cumplimiento
tabla: proceso_anonimizacion
clase: ProcesoAnonimizacion
modulo: "09 — Auditoría, Reportes y Cumplimiento"
clave_primaria: [id]
columnas: 8
fk_salientes: 2
fk_entrantes: 0
append_only: false
---

# `proceso_anonimizacion`

> Módulo [[09_auditoria_reportes|09 — Auditoría, Reportes y Cumplimiento]] · clase `ProcesoAnonimizacion`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `usuario_id` | UUID | FK UQ | no | FK, UQ |
| `solicitud_id` | UUID | FK | sí | FK, NULL |
| `estrategia` | VARCHAR(25) | — | no | CK |
| `entidades_afectadas` | JSONB | — | no | — |
| `datos_retenidos_por_ley` | JSONB | — | no | — |
| `estado` | VARCHAR(15) | — | no | CK |
| `ejecutado_en` | TIMESTAMPTZ | — | sí | NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `solicitud_id` | [[solicitud_datos_personales]] | 09 | sí | [[proceso_anonimizacion.solicitud_id → solicitud_datos_personales]] |
| `usuario_id` | [[usuario]] | ↗ 01 | no | [[proceso_anonimizacion.usuario_id → usuario]] |

## Entidades vecinas

[[solicitud_datos_personales]] · [[usuario]]

## Ver también

- Justificación de negocio: [[09_auditoria_reportes]]
- Diagramas: `docs/entidades/09_auditoria_reportes.puml`
- Índice: [[_Entidades]] · [[Index]]
