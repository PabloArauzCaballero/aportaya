---
tags:
  - entidad
  - modulo/09-auditoria-reportes-y-cumplimiento
tabla: umbral_operativo
clase: UmbralOperativo
modulo: "09 — Auditoría, Reportes y Cumplimiento"
estereotipo: Política configurable
clave_primaria: [id]
columnas: 6
fk_salientes: 0
fk_entrantes: 0
append_only: false
---

# `umbral_operativo`

> Módulo [[09_auditoria_reportes|09 — Auditoría, Reportes y Cumplimiento]] · clase `UmbralOperativo` · Política configurable

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `concepto` | VARCHAR(30) | UQ | no | UQ+nivel_kyc_requerido |
| `nivel_kyc_requerido` | VARCHAR(15) | — | no | CK |
| `monto_maximo` | DECIMAL(16,2) | — | no | — |
| `moneda` | CHAR(3) | — | no | — |
| `vigente_desde` | DATE | — | no | — |

## Ver también

- Justificación de negocio: [[09_auditoria_reportes]]
- Diagramas: `docs/entidades/09_auditoria_reportes.puml`
- Índice: [[_Entidades]] · [[Index]]
