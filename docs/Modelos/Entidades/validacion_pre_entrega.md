---
tags:
  - entidad
  - modulo/04-entregas-de-fondo
tabla: validacion_pre_entrega
clase: ValidacionPreEntrega
modulo: "04 — Entregas de Fondo"
clave_primaria: [id]
columnas: 10
fk_salientes: 3
fk_entrantes: 0
append_only: false
---

# `validacion_pre_entrega`

> Módulo [[04_entregas_fondo|04 — Entregas de Fondo]] · clase `ValidacionPreEntrega`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `entrega_id` | UUID | FK IDX | no | FK, IDX |
| `regla_id` | UUID | FK | no | FK |
| `resultado` | VARCHAR(15) | — | no | CK |
| `valor_esperado` | VARCHAR(80) | — | sí | NULL |
| `valor_obtenido` | VARCHAR(80) | — | sí | NULL |
| `es_bloqueante` | BOOLEAN | — | no | — |
| `omitida_por` | UUID | FK | sí | FK, NULL |
| `justificacion_omision` | VARCHAR(300) | — | sí | NULL |
| `evaluada_en` | TIMESTAMPTZ | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `entrega_id` | [[entrega_fondo]] | 04 | no | [[validacion_pre_entrega.entrega_id → entrega_fondo]] |
| `omitida_por` | [[usuario]] | ↗ 01 | sí | [[validacion_pre_entrega.omitida_por → usuario]] |
| `regla_id` | [[regla_entrega]] | 04 | no | [[validacion_pre_entrega.regla_id → regla_entrega]] |

## Entidades vecinas

[[entrega_fondo]] · [[regla_entrega]] · [[usuario]]

## Ver también

- Justificación de negocio: [[04_entregas_fondo]]
- Diagramas: `docs/entidades/04_entregas_fondo.puml`
- Índice: [[_Entidades]] · [[Index]]
