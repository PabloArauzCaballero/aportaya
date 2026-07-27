---
tags:
  - entidad
  - modulo/01-identidad-usuarios-y-seguridad
tabla: preferencia_notificacion
clase: PreferenciaNotificacion
modulo: "01 — Identidad, Usuarios y Seguridad"
clave_primaria: [id]
columnas: 11
fk_salientes: 1
fk_entrantes: 0
append_only: false
---

# `preferencia_notificacion`

> Módulo [[01_identidad_usuarios|01 — Identidad, Usuarios y Seguridad]] · clase `PreferenciaNotificacion`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `usuario_id` | UUID | FK UQ | no | FK, UQ |
| `canal_primario` | VARCHAR(20) | — | no | CK |
| `canal_respaldo` | VARCHAR(20) | — | sí | CK, NULL |
| `acepta_whatsapp` | BOOLEAN | — | no | — |
| `acepta_correo` | BOOLEAN | — | no | — |
| `acepta_sms` | BOOLEAN | — | no | — |
| `acepta_push` | BOOLEAN | — | no | — |
| `hora_no_molestar_desde` | TIME | — | sí | NULL |
| `hora_no_molestar_hasta` | TIME | — | sí | NULL |
| `frecuencia_resumen` | VARCHAR(15) | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `usuario_id` | [[usuario]] | 01 | no | [[preferencia_notificacion.usuario_id → usuario]] |

## Entidades vecinas

[[usuario]]

## Ver también

- Justificación de negocio: [[01_identidad_usuarios]]
- Diagramas: `docs/entidades/01_identidad_usuarios.puml`
- Índice: [[_Entidades]] · [[Index]]
