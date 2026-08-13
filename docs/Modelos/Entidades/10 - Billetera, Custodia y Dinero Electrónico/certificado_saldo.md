---
tags:
  - entidad
  - modulo/10-billetera-custodia-y-dinero-electronico
tabla: certificado_saldo
clase: CertificadoSaldo
modulo: "10 — Billetera, Custodia y Dinero Electrónico"
clave_primaria: [id]
columnas: 10
fk_salientes: 2
fk_entrantes: 0
append_only: false
---

# `certificado_saldo`

> Módulo [[10_billetera_custodia|10 — Billetera, Custodia y Dinero Electrónico]] · clase `CertificadoSaldo`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `cuenta_billetera_id` | UUID | FK IDX | no | FK, IDX |
| `solicitado_por` | UUID | FK | no | FK |
| `folio` | VARCHAR(30) | UQ | no | UQ |
| `motivo` | VARCHAR(120) | — | no | — |
| `saldo_certificado` | DECIMAL(16,2) | — | no | — |
| `fecha_corte` | TIMESTAMPTZ | — | no | — |
| `hash_documento` | VARCHAR(64) | — | no | — |
| `url_documento` | VARCHAR(255) | — | no | — |
| `emitido_en` | TIMESTAMPTZ | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `cuenta_billetera_id` | [[cuenta_billetera]] | 10 | no | [[certificado_saldo.cuenta_billetera_id → cuenta_billetera]] |
| `solicitado_por` | [[usuario]] | ↗ 01 | no | [[certificado_saldo.solicitado_por → usuario]] |

## Entidades vecinas

[[cuenta_billetera]] · [[usuario]]

## Ver también

- Justificación de negocio: [[10_billetera_custodia]]
- Diagramas: `docs/entidades/10_billetera_custodia.puml`
- Índice: [[_Entidades]] · [[Index]]
