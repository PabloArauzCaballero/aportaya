---
tags:
  - entidad
  - modulo/05-notificaciones-y-comunicaciones
tabla: plantilla_mensaje
clase: PlantillaMensaje
modulo: "05 — Notificaciones y Comunicaciones"
clave_primaria: [id]
columnas: 9
fk_salientes: 1
fk_entrantes: 1
append_only: false
---

# `plantilla_mensaje`

> Módulo [[05_notificaciones|05 — Notificaciones y Comunicaciones]] · clase `PlantillaMensaje`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `codigo` | VARCHAR(50) | UQ | no | UQ |
| `evento_id` | UUID | FK IDX | no | FK, IDX |
| `canal` | VARCHAR(15) | — | no | CK |
| `descripcion` | VARCHAR(200) | — | no | — |
| `categoria_proveedor` | VARCHAR(20) | — | no | CK |
| `estado_aprobacion` | VARCHAR(15) | — | no | CK |
| `id_plantilla_proveedor` | VARCHAR(80) | — | sí | NULL |
| `activa` | BOOLEAN | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `evento_id` | [[evento_notificable]] | 05 | no | [[plantilla_mensaje.evento_id → evento_notificable]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[version_plantilla]] | `plantilla_id` | 05 | [[version_plantilla.plantilla_id → plantilla_mensaje]] |

## Entidades vecinas

[[evento_notificable]] · [[version_plantilla]]

## Ver también

- Justificación de negocio: [[05_notificaciones]]
- Diagramas: `docs/entidades/05_notificaciones.puml`
- Índice: [[_Entidades]] · [[Index]]
