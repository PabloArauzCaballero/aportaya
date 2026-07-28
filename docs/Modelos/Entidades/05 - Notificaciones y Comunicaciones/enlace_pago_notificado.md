---
tags:
  - entidad
  - modulo/05-notificaciones-y-comunicaciones
tabla: enlace_pago_notificado
clase: EnlacePagoNotificado
modulo: "05 — Notificaciones y Comunicaciones"
clave_primaria: [id]
columnas: 9
fk_salientes: 3
fk_entrantes: 0
append_only: false
---

# `enlace_pago_notificado`

> Módulo [[05_notificaciones|05 — Notificaciones y Comunicaciones]] · clase `EnlacePagoNotificado`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `notificacion_id` | UUID | FK UQ | no | FK, UQ |
| `orden_cobro_id` | UUID | FK | no | FK, M3 |
| `token_id` | UUID | FK UQ | no | FK, UQ, M1 |
| `url_corta` | VARCHAR(60) | UQ | no | UQ |
| `clicks` | SMALLINT | — | no | — |
| `primer_click_en` | TIMESTAMPTZ | — | sí | NULL |
| `convertido_en_pago` | BOOLEAN | — | no | — |
| `expira_en` | TIMESTAMPTZ | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `notificacion_id` | [[notificacion]] | 05 | no | [[enlace_pago_notificado.notificacion_id → notificacion]] |
| `orden_cobro_id` | [[orden_cobro]] | ↗ 03 | no | [[enlace_pago_notificado.orden_cobro_id → orden_cobro]] |
| `token_id` | [[token_verificacion]] | ↗ 01 | no | [[enlace_pago_notificado.token_id → token_verificacion]] |

## Entidades vecinas

[[notificacion]] · [[orden_cobro]] · [[token_verificacion]]

## Notas del modelo

> orden_cobro_id -> orden_cobro.id (modulo 3);
> token_id -> token_verificacion.id (modulo 1),
> subtipo ENLACE firmado con HMAC y uso unico:
> el "pago en un toque" no expone datos del grupo.

## Ver también

- Justificación de negocio: [[05_notificaciones]]
- Diagramas: `docs/entidades/05_notificaciones.puml`
- Índice: [[_Entidades]] · [[Index]]
