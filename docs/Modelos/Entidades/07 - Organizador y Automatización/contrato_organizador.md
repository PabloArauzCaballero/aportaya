---
tags:
  - entidad
  - modulo/07-organizador-y-automatizacion
tabla: contrato_organizador
clase: ContratoOrganizador
modulo: "07 — Organizador y Automatización"
clave_primaria: [id]
columnas: 12
fk_salientes: 2
fk_entrantes: 0
append_only: false
---

# `contrato_organizador`

> Módulo [[07_organizador_automatizacion|07 — Organizador y Automatización]] · clase `ContratoOrganizador`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `organizador_id` | UUID | FK IDX | no | FK, IDX |
| `version` | VARCHAR(20) | — | no | — |
| `contenido_hash` | VARCHAR(64) | — | no | — |
| `obligaciones` | TEXT | — | no | — |
| `causales_rescision` | TEXT | — | no | — |
| `firmado_en` | TIMESTAMPTZ | — | sí | NULL |
| `token_firma_id` | UUID | FK | sí | FK, NULL, M1 |
| `vigente_desde` | DATE | — | no | — |
| `vigente_hasta` | DATE | — | sí | NULL |
| `rescindido_en` | TIMESTAMPTZ | — | sí | NULL |
| `motivo_rescision` | VARCHAR(300) | — | sí | NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `organizador_id` | [[organizador]] | 07 | no | [[contrato_organizador.organizador_id → organizador]] |
| `token_firma_id` | [[token_verificacion]] | ↗ 01 | sí | [[contrato_organizador.token_firma_id → token_verificacion]] |

## Entidades vecinas

[[organizador]] · [[token_verificacion]]

## Ver también

- Justificación de negocio: [[07_organizador_automatizacion]]
- Diagramas: `docs/entidades/07_organizador_automatizacion.puml`
- Índice: [[_Entidades]] · [[Index]]
