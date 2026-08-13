---
tags:
  - entidad
  - modulo/04-entregas-de-fondo
tabla: historial_estado_entrega
clase: HistorialEstadoEntrega
modulo: "04 — Entregas de Fondo"
clave_primaria: [id]
columnas: 7
fk_salientes: 2
fk_entrantes: 0
append_only: false
---

# `historial_estado_entrega`

> Módulo [[04_entregas_fondo|04 — Entregas de Fondo]] · clase `HistorialEstadoEntrega`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `entrega_id` | UUID | FK IDX | no | FK, IDX |
| `estado_anterior` | VARCHAR(35) | — | no | — |
| `estado_nuevo` | VARCHAR(35) | — | no | — |
| `motivo` | VARCHAR(200) | — | no | — |
| `ejecutado_por` | UUID | FK | sí | FK, NULL |
| `fecha_hora` | TIMESTAMPTZ | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `ejecutado_por` | [[usuario]] | ↗ 01 | sí | [[historial_estado_entrega.ejecutado_por → usuario]] |
| `entrega_id` | [[entrega_fondo]] | 04 | no | [[historial_estado_entrega.entrega_id → entrega_fondo]] |

## Entidades vecinas

[[entrega_fondo]] · [[usuario]]

## Ver también

- Justificación de negocio: [[04_entregas_fondo]]
- Diagramas: `docs/entidades/04_entregas_fondo.puml`
- Índice: [[_Entidades]] · [[Index]]
