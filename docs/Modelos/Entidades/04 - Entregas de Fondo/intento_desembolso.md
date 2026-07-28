---
tags:
  - entidad
  - modulo/04-entregas-de-fondo
tabla: intento_desembolso
clase: IntentoDesembolso
modulo: "04 — Entregas de Fondo"
clave_primaria: [id]
columnas: 9
fk_salientes: 1
fk_entrantes: 0
append_only: false
---

# `intento_desembolso`

> Módulo [[04_entregas_fondo|04 — Entregas de Fondo]] · clase `IntentoDesembolso`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `orden_desembolso_id` | UUID | FK IDX | no | FK, IDX |
| `numero_intento` | SMALLINT | — | no | — |
| `iniciado_en` | TIMESTAMPTZ | — | no | — |
| `finalizado_en` | TIMESTAMPTZ | — | sí | NULL |
| `resultado` | VARCHAR(20) | — | no | CK |
| `codigo_error` | VARCHAR(40) | — | sí | NULL |
| `mensaje_proveedor` | VARCHAR(255) | — | sí | NULL |
| `reintentable_en` | TIMESTAMPTZ | — | sí | NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `orden_desembolso_id` | [[orden_desembolso]] | 04 | no | [[intento_desembolso.orden_desembolso_id → orden_desembolso]] |

## Entidades vecinas

[[orden_desembolso]]

## Ver también

- Justificación de negocio: [[04_entregas_fondo]]
- Diagramas: `docs/entidades/04_entregas_fondo.puml`
- Índice: [[_Entidades]] · [[Index]]
