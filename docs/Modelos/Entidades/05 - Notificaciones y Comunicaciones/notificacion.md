---
tags:
  - entidad
  - modulo/05-notificaciones-y-comunicaciones
tabla: notificacion
clase: Notificacion
modulo: "05 — Notificaciones y Comunicaciones"
estereotipo: Raíz de agregado
clave_primaria: [id]
columnas: 11
fk_salientes: 2
fk_entrantes: 5
append_only: false
---

# `notificacion`

> Módulo [[05_notificaciones|05 — Notificaciones y Comunicaciones]] · clase `Notificacion` · Raíz de agregado

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `usuario_id` | UUID | FK IDX | no | FK, IDX |
| `evento_id` | UUID | FK | no | FK |
| `prioridad` | VARCHAR(10) | — | no | CK |
| `contexto` | JSONB | — | no | — |
| `clave_deduplicacion` | VARCHAR(120) | UQ | no | UQ parcial |
| `estado` | VARCHAR(15) | IDX | no | CK, IDX |
| `programada_para` | TIMESTAMPTZ | IDX | no | IDX |
| `creada_en` | TIMESTAMPTZ | IDX | no | IDX, particion |
| `finalizada_en` | TIMESTAMPTZ | — | sí | NULL |
| `correlation_id` | UUID | IDX | no | IDX |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `evento_id` | [[evento_notificable]] | 05 | no | [[notificacion.evento_id → evento_notificable]] |
| `usuario_id` | [[usuario]] | ↗ 01 | no | [[notificacion.usuario_id → usuario]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[accion_cobranza]] | `notificacion_id` | ↗ 08 | [[accion_cobranza.notificacion_id → notificacion]] |
| [[bandeja_entrada]] | `notificacion_id` | 05 | [[bandeja_entrada.notificacion_id → notificacion]] |
| [[enlace_pago_notificado]] | `notificacion_id` | 05 | [[enlace_pago_notificado.notificacion_id → notificacion]] |
| [[envio_notificacion]] | `notificacion_id` | 05 | [[envio_notificacion.notificacion_id → notificacion]] |
| [[respuesta_entrante]] | `notificacion_relacionada_id` | 05 | [[respuesta_entrante.notificacion_relacionada_id → notificacion]] |

## Entidades vecinas

[[accion_cobranza]] · [[bandeja_entrada]] · [[enlace_pago_notificado]] · [[envio_notificacion]] · [[evento_notificable]] · [[respuesta_entrante]] · [[usuario]]

## Notas del modelo

> **Deduplicacion**
> CREATE UNIQUE INDEX ON notificacion
> (clave_deduplicacion)
> WHERE estado NOT IN ('CANCELADA','SUPRIMIDA');
> La clave incluye la ventana temporal del evento
> (ventana_deduplicacion_min), de modo que el
> mismo recordatorio no se emite dos veces el
> mismo dia aunque el job corra varias veces.

## Ver también

- Justificación de negocio: [[05_notificaciones]]
- Diagramas: `docs/entidades/05_notificaciones.puml`
- Índice: [[_Entidades]] · [[Index]]
