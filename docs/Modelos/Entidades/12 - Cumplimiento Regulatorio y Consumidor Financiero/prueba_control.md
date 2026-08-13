---
tags:
  - entidad
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
tabla: prueba_control
clase: PruebaControl
modulo: "12 — Cumplimiento Regulatorio y Consumidor Financiero"
clave_primaria: [id]
columnas: 9
fk_salientes: 2
fk_entrantes: 0
append_only: false
---

# `prueba_control`

> Módulo [[12_cumplimiento_asfi|12 — Cumplimiento Regulatorio y Consumidor Financiero]] · clase `PruebaControl`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `control_id` | UUID | FK IDX | no | FK, IDX |
| `ejecutada_por` | UUID | FK | no | FK |
| `periodo` | CHAR(7) | UQ | no | UQ+control_id |
| `tamanio_muestra` | INTEGER | — | no | — |
| `excepciones` | INTEGER | — | no | — |
| `resultado` | VARCHAR(12) | IDX | no | CK, IDX |
| `evidencia_url` | VARCHAR(255) | — | sí | NULL |
| `ejecutada_en` | TIMESTAMPTZ | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `control_id` | [[control_interno]] | 12 | no | [[prueba_control.control_id → control_interno]] |
| `ejecutada_por` | [[usuario]] | ↗ 01 | no | [[prueba_control.ejecutada_por → usuario]] |

## Entidades vecinas

[[control_interno]] · [[usuario]]

## Ver también

- Justificación de negocio: [[12_cumplimiento_asfi]]
- Diagramas: `docs/entidades/12_cumplimiento_asfi.puml`
- Índice: [[_Entidades]] · [[Index]]
