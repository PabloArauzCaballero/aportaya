---
tags:
  - entidad
  - modulo/09-auditoria-reportes-y-cumplimiento
  - append-only
tabla: bitacora_evento
clase: BitacoraEvento
modulo: "09 — Auditoría, Reportes y Cumplimiento"
clave_primaria: [id]
columnas: 21
fk_salientes: 3
fk_entrantes: 0
append_only: true
---

# `bitacora_evento`

> Módulo [[09_auditoria_reportes|09 — Auditoría, Reportes y Cumplimiento]] · clase `BitacoraEvento` · **append-only** (sin `UPDATE`/`DELETE`)

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `secuencia` | BIGSERIAL | UQ | no | UQ |
| `entidad` | VARCHAR(50) | IDX | no | IDX |
| `entidad_id` | UUID | IDX | no | IDX |
| `accion` | VARCHAR(30) | IDX | no | CK, IDX |
| `actor_usuario_id` | UUID | FK IDX | sí | FK, NULL, IDX |
| `actor_rol` | VARCHAR(30) | — | sí | NULL |
| `suplantando_a_usuario_id` | UUID | FK | sí | FK, NULL |
| `origen` | VARCHAR(25) | — | no | CK |
| `ip_origen` | INET | — | sí | NULL |
| `agente_usuario` | VARCHAR(255) | — | sí | NULL |
| `correlation_id` | UUID | IDX | no | IDX |
| `request_id` | UUID | — | sí | NULL |
| `valor_anterior` | JSONB | — | sí | NULL |
| `valor_nuevo` | JSONB | — | sí | NULL |
| `campos_modificados` | VARCHAR(400) | — | sí | NULL |
| `motivo` | VARCHAR(300) | — | sí | NULL |
| `grupo_id` | UUID | FK IDX | sí | FK, NULL, IDX |
| `hash_registro` | VARCHAR(64) | UQ | no | UQ |
| `hash_anterior` | VARCHAR(64) | — | no | — |
| `fecha_hora` | TIMESTAMPTZ | IDX | no | IDX, particion |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `actor_usuario_id` | [[usuario]] | ↗ 01 | sí | [[bitacora_evento.actor_usuario_id → usuario]] |
| `grupo_id` | [[grupo]] | ↗ 02 | sí | [[bitacora_evento.grupo_id → grupo]] |
| `suplantando_a_usuario_id` | [[usuario]] | ↗ 01 | sí | [[bitacora_evento.suplantando_a_usuario_id → usuario]] |

## Entidades vecinas

[[grupo]] · [[usuario]]

## Notas del modelo

> **Cadena de integridad**
> hash_registro = SHA256(secuencia || entidad ||
> entidad_id || accion || valor_nuevo ||
> fecha_hora || hash_anterior).
> REVOKE UPDATE, DELETE ON bitacora_evento
> FROM rol_aplicacion;
> entidad_id es referencia polimorfica a
> cualquier PK de los modulos 1-8: se valida en
> aplicacion, no por FK, para no acoplar la
> auditoria al esquema que audita.

## Ver también

- Justificación de negocio: [[09_auditoria_reportes]]
- Diagramas: `docs/entidades/09_auditoria_reportes.puml`
- Índice: [[_Entidades]] · [[Index]]
