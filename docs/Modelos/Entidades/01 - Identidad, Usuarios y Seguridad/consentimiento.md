---
tags:
  - entidad
  - modulo/01-identidad-usuarios-y-seguridad
tabla: consentimiento
clase: Consentimiento
modulo: "01 — Identidad, Usuarios y Seguridad"
clave_primaria: [id]
columnas: 10
fk_salientes: 1
fk_entrantes: 0
append_only: false
---

# `consentimiento`

> Módulo [[01_identidad_usuarios|01 — Identidad, Usuarios y Seguridad]] · clase `Consentimiento`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `usuario_id` | UUID | FK IDX | no | FK, IDX |
| `tipo` | VARCHAR(30) | — | no | CK |
| `version_documento` | VARCHAR(20) | — | no | — |
| `hash_documento` | VARCHAR(64) | — | no | — |
| `otorgado` | BOOLEAN | — | no | — |
| `fecha_hora` | TIMESTAMPTZ | — | no | — |
| `ip_origen` | INET | — | no | — |
| `agente_usuario` | VARCHAR(255) | — | no | — |
| `revocado_en` | TIMESTAMPTZ | — | sí | NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `usuario_id` | [[usuario]] | 01 | no | [[consentimiento.usuario_id → usuario]] |

## Entidades vecinas

[[usuario]]

## Ver también

- Justificación de negocio: [[01_identidad_usuarios]]
- Diagramas: `docs/entidades/01_identidad_usuarios.puml`
- Índice: [[_Entidades]] · [[Index]]
