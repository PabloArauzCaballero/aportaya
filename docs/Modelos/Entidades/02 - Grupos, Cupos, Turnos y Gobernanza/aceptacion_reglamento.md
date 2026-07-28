---
tags:
  - entidad
  - modulo/02-grupos-cupos-turnos-y-gobernanza
tabla: aceptacion_reglamento
clase: AceptacionReglamento
modulo: "02 — Grupos, Cupos, Turnos y Gobernanza"
clave_primaria: [id]
columnas: 7
fk_salientes: 3
fk_entrantes: 0
append_only: false
---

# `aceptacion_reglamento`

> Módulo [[02_grupos_turnos|02 — Grupos, Cupos, Turnos y Gobernanza]] · clase `AceptacionReglamento`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `reglamento_id` | UUID | FK | no | FK |
| `participante_id` | UUID | FK | no | FK |
| `aceptado_en` | TIMESTAMPTZ | — | no | — |
| `hash_firmado` | VARCHAR(64) | — | no | — |
| `ip_origen` | INET | — | no | — |
| `token_firma_id` | UUID | FK | sí | FK, NULL, M1 |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `participante_id` | [[participante]] | 02 | no | [[aceptacion_reglamento.participante_id → participante]] |
| `reglamento_id` | [[reglamento_grupo]] | 02 | no | [[aceptacion_reglamento.reglamento_id → reglamento_grupo]] |
| `token_firma_id` | [[token_verificacion]] | ↗ 01 | sí | [[aceptacion_reglamento.token_firma_id → token_verificacion]] |

## Entidades vecinas

[[participante]] · [[reglamento_grupo]] · [[token_verificacion]]

## Ver también

- Justificación de negocio: [[02_grupos_turnos]]
- Diagramas: `docs/entidades/02_grupos_turnos.puml`
- Índice: [[_Entidades]] · [[Index]]
