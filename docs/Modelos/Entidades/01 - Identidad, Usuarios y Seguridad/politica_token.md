---
tags:
  - entidad
  - modulo/01-identidad-usuarios-y-seguridad
tabla: politica_token
clase: PoliticaToken
modulo: "01 — Identidad, Usuarios y Seguridad"
estereotipo: Política configurable
clave_primaria: [id]
columnas: 12
fk_salientes: 0
fk_entrantes: 0
append_only: false
---

# `politica_token`

> Módulo [[01_identidad_usuarios|01 — Identidad, Usuarios y Seguridad]] · clase `PoliticaToken` · Política configurable

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `proposito` | VARCHAR(35) | UQ | no | UQ+vigente_desde |
| `ttl_segundos` | INTEGER | — | no | — |
| `longitud_codigo` | SMALLINT | — | no | — |
| `max_intentos_validacion` | SMALLINT | — | no | — |
| `max_reenvios_por_hora` | SMALLINT | — | no | — |
| `cooldown_reenvio_segundos` | INTEGER | — | no | — |
| `max_emisiones_por_dia` | SMALLINT | — | no | — |
| `canales_permitidos` | VARCHAR(120) | — | no | — |
| `exige_dispositivo_conocido` | BOOLEAN | — | no | — |
| `invalida_anteriores` | BOOLEAN | — | no | — |
| `vigente_desde` | TIMESTAMPTZ | — | no | — |

## Ver también

- Justificación de negocio: [[01_identidad_usuarios]]
- Diagramas: `docs/entidades/01_identidad_usuarios.puml`
- Índice: [[_Entidades]] · [[Index]]
