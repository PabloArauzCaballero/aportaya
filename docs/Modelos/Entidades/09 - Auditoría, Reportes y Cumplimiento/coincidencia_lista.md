---
tags:
  - entidad
  - modulo/09-auditoria-reportes-y-cumplimiento
tabla: coincidencia_lista
clase: CoincidenciaLista
modulo: "09 — Auditoría, Reportes y Cumplimiento"
clave_primaria: [id]
columnas: 8
fk_salientes: 3
fk_entrantes: 0
append_only: false
---

# `coincidencia_lista`

> Módulo [[09_auditoria_reportes|09 — Auditoría, Reportes y Cumplimiento]] · clase `CoincidenciaLista`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `lista_id` | UUID | FK IDX | no | FK, IDX |
| `usuario_id` | UUID | FK IDX | no | FK, IDX |
| `revisada_por` | UUID | FK | sí | FK, NULL |
| `nombre_coincidente` | VARCHAR(150) | — | no | — |
| `puntaje_similitud` | DECIMAL(5,4) | — | no | — |
| `estado` | VARCHAR(20) | IDX | no | CK, IDX |
| `revisada_en` | TIMESTAMPTZ | — | sí | NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `lista_id` | [[lista_restrictiva_externa]] | 09 | no | [[coincidencia_lista.lista_id → lista_restrictiva_externa]] |
| `revisada_por` | [[usuario]] | ↗ 01 | sí | [[coincidencia_lista.revisada_por → usuario]] |
| `usuario_id` | [[usuario]] | ↗ 01 | no | [[coincidencia_lista.usuario_id → usuario]] |

## Entidades vecinas

[[lista_restrictiva_externa]] · [[usuario]]

## Ver también

- Justificación de negocio: [[09_auditoria_reportes]]
- Diagramas: `docs/entidades/09_auditoria_reportes.puml`
- Índice: [[_Entidades]] · [[Index]]
