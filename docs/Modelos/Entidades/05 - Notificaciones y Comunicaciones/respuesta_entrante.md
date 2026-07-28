---
tags:
  - entidad
  - modulo/05-notificaciones-y-comunicaciones
tabla: respuesta_entrante
clase: RespuestaEntrante
modulo: "05 — Notificaciones y Comunicaciones"
clave_primaria: [id]
columnas: 8
fk_salientes: 2
fk_entrantes: 0
append_only: false
---

# `respuesta_entrante`

> Módulo [[05_notificaciones|05 — Notificaciones y Comunicaciones]] · clase `RespuestaEntrante`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `canal_vinculado_id` | UUID | FK IDX | no | FK, IDX |
| `notificacion_relacionada_id` | UUID | FK | sí | FK, NULL |
| `contenido` | TEXT | — | no | — |
| `intencion_detectada` | VARCHAR(30) | — | no | CK |
| `recibida_en` | TIMESTAMPTZ | IDX | no | IDX |
| `procesada_en` | TIMESTAMPTZ | — | sí | NULL |
| `accion_ejecutada` | VARCHAR(120) | — | sí | NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `canal_vinculado_id` | [[canal_vinculado]] | 05 | no | [[respuesta_entrante.canal_vinculado_id → canal_vinculado]] |
| `notificacion_relacionada_id` | [[notificacion]] | 05 | sí | [[respuesta_entrante.notificacion_relacionada_id → notificacion]] |

## Entidades vecinas

[[canal_vinculado]] · [[notificacion]]

## Ver también

- Justificación de negocio: [[05_notificaciones]]
- Diagramas: `docs/entidades/05_notificaciones.puml`
- Índice: [[_Entidades]] · [[Index]]
