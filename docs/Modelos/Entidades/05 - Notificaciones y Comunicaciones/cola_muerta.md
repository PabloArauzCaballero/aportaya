---
tags:
  - entidad
  - modulo/05-notificaciones-y-comunicaciones
tabla: cola_muerta
clase: ColaMuerta
modulo: "05 — Notificaciones y Comunicaciones"
clave_primaria: [id]
columnas: 6
fk_salientes: 1
fk_entrantes: 0
append_only: false
---

# `cola_muerta`

> Módulo [[05_notificaciones|05 — Notificaciones y Comunicaciones]] · clase `ColaMuerta`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `envio_id` | UUID | FK IDX | no | FK, IDX |
| `motivo` | VARCHAR(200) | — | no | — |
| `payload` | JSONB | — | no | — |
| `fecha` | TIMESTAMPTZ | — | no | — |
| `reprocesado_en` | TIMESTAMPTZ | — | sí | NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `envio_id` | [[envio_notificacion]] | 05 | no | [[cola_muerta.envio_id → envio_notificacion]] |

## Entidades vecinas

[[envio_notificacion]]

## Ver también

- Justificación de negocio: [[05_notificaciones]]
- Diagramas: `docs/entidades/05_notificaciones.puml`
- Índice: [[_Entidades]] · [[Index]]
