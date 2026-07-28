---
tags:
  - entidad
  - modulo/05-notificaciones-y-comunicaciones
tabla: cola_envio
clase: ColaEnvio
modulo: "05 — Notificaciones y Comunicaciones"
clave_primaria: [id]
columnas: 6
fk_salientes: 1
fk_entrantes: 0
append_only: false
---

# `cola_envio`

> Módulo [[05_notificaciones|05 — Notificaciones y Comunicaciones]] · clase `ColaEnvio`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `envio_id` | UUID | FK UQ | no | FK, UQ |
| `particion` | VARCHAR(20) | IDX | no | IDX |
| `disponible_en` | TIMESTAMPTZ | IDX | no | IDX |
| `intentos` | SMALLINT | — | no | — |
| `bloqueada_hasta` | TIMESTAMPTZ | — | sí | NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `envio_id` | [[envio_notificacion]] | 05 | no | [[cola_envio.envio_id → envio_notificacion]] |

## Entidades vecinas

[[envio_notificacion]]

## Ver también

- Justificación de negocio: [[05_notificaciones]]
- Diagramas: `docs/entidades/05_notificaciones.puml`
- Índice: [[_Entidades]] · [[Index]]
