---
tags:
  - entidad
  - modulo/06-transparencia-y-reputacion
tabla: certificado_reputacion
clase: CertificadoReputacion
modulo: "06 — Transparencia y Reputación"
clave_primaria: [id]
columnas: 10
fk_salientes: 2
fk_entrantes: 0
append_only: false
---

# `certificado_reputacion`

> Módulo [[06_transparencia_reputacion|06 — Transparencia y Reputación]] · clase `CertificadoReputacion`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `usuario_id` | UUID | FK IDX | no | FK, IDX |
| `snapshot_id` | UUID | FK UQ | no | FK, UQ |
| `codigo_verificacion` | VARCHAR(40) | UQ | no | UQ |
| `hash_contenido` | VARCHAR(64) | — | no | — |
| `firma_digital` | VARCHAR(255) | — | no | — |
| `url_publica` | VARCHAR(255) | — | no | — |
| `emitido_en` | TIMESTAMPTZ | — | no | — |
| `expira_en` | TIMESTAMPTZ | — | no | — |
| `revocado_en` | TIMESTAMPTZ | — | sí | NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `snapshot_id` | [[snapshot_reputacion]] | 06 | no | [[certificado_reputacion.snapshot_id → snapshot_reputacion]] |
| `usuario_id` | [[usuario]] | ↗ 01 | no | [[certificado_reputacion.usuario_id → usuario]] |

## Entidades vecinas

[[snapshot_reputacion]] · [[usuario]]

## Ver también

- Justificación de negocio: [[06_transparencia_reputacion]]
- Diagramas: `docs/entidades/06_transparencia_reputacion.puml`
- Índice: [[_Entidades]] · [[Index]]
