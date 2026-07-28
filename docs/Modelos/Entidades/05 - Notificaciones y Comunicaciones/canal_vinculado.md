---
tags:
  - entidad
  - modulo/05-notificaciones-y-comunicaciones
tabla: canal_vinculado
clase: CanalVinculado
modulo: "05 — Notificaciones y Comunicaciones"
clave_primaria: [id]
columnas: 12
fk_salientes: 1
fk_entrantes: 2
append_only: false
---

# `canal_vinculado`

> Módulo [[05_notificaciones|05 — Notificaciones y Comunicaciones]] · clase `CanalVinculado`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `usuario_id` | UUID | FK IDX | no | FK, IDX |
| `tipo` | VARCHAR(15) | — | no | CK |
| `identificador` | VARCHAR(150) | UQ | no | UQ+tipo |
| `verificado` | BOOLEAN | — | no | — |
| `verificado_en` | TIMESTAMPTZ | — | sí | NULL |
| `opt_in_en` | TIMESTAMPTZ | — | sí | NULL |
| `opt_out_en` | TIMESTAMPTZ | — | sí | NULL |
| `motivo_opt_out` | VARCHAR(120) | — | sí | NULL |
| `ventana_conversacion_hasta` | TIMESTAMPTZ | — | sí | NULL |
| `rebotes_consecutivos` | SMALLINT | — | no | — |
| `estado` | VARCHAR(25) | IDX | no | CK, IDX |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `usuario_id` | [[usuario]] | ↗ 01 | no | [[canal_vinculado.usuario_id → usuario]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[envio_notificacion]] | `canal_vinculado_id` | 05 | [[envio_notificacion.canal_vinculado_id → canal_vinculado]] |
| [[respuesta_entrante]] | `canal_vinculado_id` | 05 | [[respuesta_entrante.canal_vinculado_id → canal_vinculado]] |

## Entidades vecinas

[[envio_notificacion]] · [[respuesta_entrante]] · [[usuario]]

## Notas del modelo

> usuario_id -> usuario.id (modulo 1).
> Antes de cada envio se consulta
> lista_supresion: si el numero se quejo por
> spam o rebota en duro, no se le vuelve a
> escribir por ese canal (proteccion de la
> reputacion del remitente).

## Ver también

- Justificación de negocio: [[05_notificaciones]]
- Diagramas: `docs/entidades/05_notificaciones.puml`
- Índice: [[_Entidades]] · [[Index]]
