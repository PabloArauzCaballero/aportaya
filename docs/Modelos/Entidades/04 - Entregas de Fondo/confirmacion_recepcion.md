---
tags:
  - entidad
  - modulo/04-entregas-de-fondo
tabla: confirmacion_recepcion
clase: ConfirmacionRecepcion
modulo: "04 — Entregas de Fondo"
clave_primaria: [id]
columnas: 10
fk_salientes: 2
fk_entrantes: 0
append_only: false
---

# `confirmacion_recepcion`

> Módulo [[04_entregas_fondo|04 — Entregas de Fondo]] · clase `ConfirmacionRecepcion`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `entrega_id` | UUID | FK UQ | no | FK, UQ |
| `estado` | VARCHAR(30) | IDX | no | CK, IDX |
| `monto_confirmado` | DECIMAL(14,2) | — | sí | NULL |
| `token_confirmacion_id` | UUID | FK | sí | FK, NULL, M1 |
| `confirmada_en` | TIMESTAMPTZ | — | sí | NULL |
| `plazo_limite` | TIMESTAMPTZ | IDX | no | IDX |
| `autoconfirmada_por_vencimiento` | BOOLEAN | — | no | — |
| `ip_confirmacion` | INET | — | sí | NULL |
| `comentario` | VARCHAR(300) | — | sí | NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `entrega_id` | [[entrega_fondo]] | 04 | no | [[confirmacion_recepcion.entrega_id → entrega_fondo]] |
| `token_confirmacion_id` | [[token_verificacion]] | ↗ 01 | sí | [[confirmacion_recepcion.token_confirmacion_id → token_verificacion]] |

## Entidades vecinas

[[entrega_fondo]] · [[token_verificacion]]

## Ver también

- Justificación de negocio: [[04_entregas_fondo]]
- Diagramas: `docs/entidades/04_entregas_fondo.puml`
- Índice: [[_Entidades]] · [[Index]]
