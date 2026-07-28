---
tags:
  - entidad
  - modulo/05-notificaciones-y-comunicaciones
tabla: proveedor_mensajeria
clase: ProveedorMensajeria
modulo: "05 — Notificaciones y Comunicaciones"
clave_primaria: [id]
columnas: 11
fk_salientes: 0
fk_entrantes: 1
append_only: false
---

# `proveedor_mensajeria`

> Módulo [[05_notificaciones|05 — Notificaciones y Comunicaciones]] · clase `ProveedorMensajeria`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `codigo` | VARCHAR(30) | UQ | no | UQ |
| `nombre` | VARCHAR(80) | — | no | — |
| `canales_soportados` | VARCHAR(120) | — | no | — |
| `url_base` | VARCHAR(200) | — | no | — |
| `referencia_credenciales` | VARCHAR(120) | — | no | — |
| `costo_por_mensaje` | DECIMAL(10,4) | — | no | — |
| `limite_mensajes_por_segundo` | SMALLINT | — | no | — |
| `prioridad` | SMALLINT | — | no | — |
| `activo` | BOOLEAN | — | no | — |
| `salud_porcentaje` | DECIMAL(5,2) | — | no | — |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[envio_notificacion]] | `proveedor_id` | 05 | [[envio_notificacion.proveedor_id → proveedor_mensajeria]] |

## Entidades vecinas

[[envio_notificacion]]

## Ver también

- Justificación de negocio: [[05_notificaciones]]
- Diagramas: `docs/entidades/05_notificaciones.puml`
- Índice: [[_Entidades]] · [[Index]]
