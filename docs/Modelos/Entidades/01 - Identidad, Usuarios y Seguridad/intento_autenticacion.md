---
tags:
  - entidad
  - modulo/01-identidad-usuarios-y-seguridad
tabla: intento_autenticacion
clase: IntentoAutenticacion
modulo: "01 — Identidad, Usuarios y Seguridad"
clave_primaria: [id]
columnas: 10
fk_salientes: 1
fk_entrantes: 0
append_only: false
---

# `intento_autenticacion`

> Módulo [[01_identidad_usuarios|01 — Identidad, Usuarios y Seguridad]] · clase `IntentoAutenticacion`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `usuario_id` | UUID | FK IDX | sí | FK, NULL, IDX |
| `identificador_usado` | VARCHAR(150) | IDX | no | IDX |
| `fecha_hora` | TIMESTAMPTZ | IDX | no | IDX |
| `exitoso` | BOOLEAN | — | no | — |
| `motivo_fallo` | VARCHAR(60) | — | sí | NULL |
| `ip_origen` | INET | IDX | no | IDX |
| `agente_usuario` | VARCHAR(255) | — | no | — |
| `huella_dispositivo` | VARCHAR(128) | — | sí | NULL |
| `puntaje_riesgo` | DECIMAL(5,2) | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `usuario_id` | [[usuario]] | 01 | sí | [[intento_autenticacion.usuario_id → usuario]] |

## Entidades vecinas

[[usuario]]

## Ver también

- Justificación de negocio: [[01_identidad_usuarios]]
- Diagramas: `docs/entidades/01_identidad_usuarios.puml`
- Índice: [[_Entidades]] · [[Index]]
