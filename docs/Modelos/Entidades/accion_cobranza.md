---
tags:
  - entidad
  - modulo/08-garantia-incumplimiento-cobranza-y-sanciones
tabla: accion_cobranza
clase: AccionCobranza
modulo: "08 — Garantía, Incumplimiento, Cobranza y Sanciones"
clave_primaria: [id]
columnas: 11
fk_salientes: 3
fk_entrantes: 0
append_only: false
---

# `accion_cobranza`

> Módulo [[08_garantia_incumplimiento|08 — Garantía, Incumplimiento, Cobranza y Sanciones]] · clase `AccionCobranza`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `gestion_id` | UUID | FK IDX | no | FK, IDX |
| `notificacion_id` | UUID | FK | sí | FK, NULL, M5 |
| `etapa` | VARCHAR(20) | — | no | CK |
| `tipo` | VARCHAR(30) | — | no | CK |
| `canal` | VARCHAR(20) | — | no | — |
| `resultado` | VARCHAR(30) | — | no | CK |
| `nota_gestor` | VARCHAR(500) | — | sí | NULL |
| `costo` | DECIMAL(10,2) | — | no | — |
| `ejecutada_por` | UUID | FK | sí | FK, NULL |
| `ejecutada_en` | TIMESTAMPTZ | IDX | no | IDX |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `ejecutada_por` | [[usuario]] | ↗ 01 | sí | [[accion_cobranza.ejecutada_por → usuario]] |
| `gestion_id` | [[gestion_cobranza]] | 08 | no | [[accion_cobranza.gestion_id → gestion_cobranza]] |
| `notificacion_id` | [[notificacion]] | ↗ 05 | sí | [[accion_cobranza.notificacion_id → notificacion]] |

## Entidades vecinas

[[gestion_cobranza]] · [[notificacion]] · [[usuario]]

## Ver también

- Justificación de negocio: [[08_garantia_incumplimiento]]
- Diagramas: `docs/entidades/08_garantia_incumplimiento.puml`
- Índice: [[_Entidades]] · [[Index]]
