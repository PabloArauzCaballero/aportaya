---
tags:
  - entidad
  - modulo/05-notificaciones-y-comunicaciones
tabla: version_plantilla
clase: VersionPlantilla
modulo: "05 — Notificaciones y Comunicaciones"
clave_primaria: [id]
columnas: 11
fk_salientes: 1
fk_entrantes: 1
append_only: false
---

# `version_plantilla`

> Módulo [[05_notificaciones|05 — Notificaciones y Comunicaciones]] · clase `VersionPlantilla`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `plantilla_id` | UUID | FK IDX | no | FK, IDX |
| `version` | SMALLINT | UQ | no | UQ+plantilla_id+idioma |
| `idioma` | VARCHAR(10) | — | no | — |
| `asunto` | VARCHAR(160) | — | sí | NULL |
| `cuerpo` | TEXT | — | no | — |
| `variables` | JSONB | — | no | — |
| `botones` | JSONB | — | sí | NULL |
| `url_encabezado_media` | VARCHAR(255) | — | sí | NULL |
| `vigente_desde` | TIMESTAMPTZ | — | no | — |
| `vigente_hasta` | TIMESTAMPTZ | — | sí | NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `plantilla_id` | [[plantilla_mensaje]] | 05 | no | [[version_plantilla.plantilla_id → plantilla_mensaje]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[envio_notificacion]] | `version_plantilla_id` | 05 | [[envio_notificacion.version_plantilla_id → version_plantilla]] |

## Entidades vecinas

[[envio_notificacion]] · [[plantilla_mensaje]]

## Ver también

- Justificación de negocio: [[05_notificaciones]]
- Diagramas: `docs/entidades/05_notificaciones.puml`
- Índice: [[_Entidades]] · [[Index]]
