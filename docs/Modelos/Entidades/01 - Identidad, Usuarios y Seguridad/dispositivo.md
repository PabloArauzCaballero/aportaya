---
tags:
  - entidad
  - modulo/01-identidad-usuarios-y-seguridad
tabla: dispositivo
clase: Dispositivo
modulo: "01 — Identidad, Usuarios y Seguridad"
clave_primaria: [id]
columnas: 11
fk_salientes: 1
fk_entrantes: 4
append_only: false
---

# `dispositivo`

> Módulo [[01_identidad_usuarios|01 — Identidad, Usuarios y Seguridad]] · clase `Dispositivo`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `usuario_id` | UUID | FK IDX | no | FK, IDX |
| `huella` | VARCHAR(128) | UQ | no | UQ+usuario_id |
| `plataforma` | VARCHAR(15) | — | no | CK |
| `modelo` | VARCHAR(60) | — | no | — |
| `version_app` | VARCHAR(20) | — | no | — |
| `token_push` | VARCHAR(255) | — | sí | NULL |
| `es_confiable` | BOOLEAN | — | no | — |
| `autorizado_en` | TIMESTAMPTZ | — | sí | NULL |
| `ultimo_uso_en` | TIMESTAMPTZ | — | no | — |
| `revocado_en` | TIMESTAMPTZ | — | sí | NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `usuario_id` | [[usuario]] | 01 | no | [[dispositivo.usuario_id → usuario]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[aceptacion_contrato]] | `dispositivo_id` | ↗ 12 | [[aceptacion_contrato.dispositivo_id → dispositivo]] |
| [[sesion]] | `dispositivo_id` | 01 | [[sesion.dispositivo_id → dispositivo]] |
| [[token_verificacion]] | `dispositivo_id` | 01 | [[token_verificacion.dispositivo_id → dispositivo]] |
| [[transaccion_billetera]] | `dispositivo_id` | ↗ 10 | [[transaccion_billetera.dispositivo_id → dispositivo]] |

## Entidades vecinas

[[aceptacion_contrato]] · [[sesion]] · [[token_verificacion]] · [[transaccion_billetera]] · [[usuario]]

## Ver también

- Justificación de negocio: [[01_identidad_usuarios]]
- Diagramas: `docs/entidades/01_identidad_usuarios.puml`
- Índice: [[_Entidades]] · [[Index]]
