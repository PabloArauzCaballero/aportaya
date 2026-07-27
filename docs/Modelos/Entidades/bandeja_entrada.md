---
tags:
  - entidad
  - modulo/05-notificaciones-y-comunicaciones
tabla: bandeja_entrada
clase: BandejaEntrada
modulo: "05 — Notificaciones y Comunicaciones"
clave_primaria: [id]
columnas: 9
fk_salientes: 2
fk_entrantes: 0
append_only: false
---

# `bandeja_entrada`

> Módulo [[05_notificaciones|05 — Notificaciones y Comunicaciones]] · clase `BandejaEntrada`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `usuario_id` | UUID | FK IDX | no | FK, IDX |
| `notificacion_id` | UUID | FK UQ | no | FK, UQ |
| `titulo` | VARCHAR(120) | — | no | — |
| `resumen` | VARCHAR(300) | — | no | — |
| `url_accion` | VARCHAR(255) | — | sí | NULL |
| `leida` | BOOLEAN | IDX | no | IDX |
| `leida_en` | TIMESTAMPTZ | — | sí | NULL |
| `archivada` | BOOLEAN | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `notificacion_id` | [[notificacion]] | 05 | no | [[bandeja_entrada.notificacion_id → notificacion]] |
| `usuario_id` | [[usuario]] | ↗ 01 | no | [[bandeja_entrada.usuario_id → usuario]] |

## Entidades vecinas

[[notificacion]] · [[usuario]]

## Ver también

- Justificación de negocio: [[05_notificaciones]]
- Diagramas: `docs/entidades/05_notificaciones.puml`
- Índice: [[_Entidades]] · [[Index]]
