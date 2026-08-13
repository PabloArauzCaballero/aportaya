---
tags:
  - moc
  - modulo/10-billetera-custodia-y-dinero-electronico
modulo: "10 — Billetera, Custodia y Dinero Electrónico"
entidades: 25
---

# 10 — Billetera, Custodia y Dinero Electrónico · entidades

Las **25 tablas** de este módulo. Justificación de negocio en [[10_billetera_custodia]].

[[_Entidades|← Todas las entidades]] · [[Index]]

| Tabla | Columnas | FK sal. | FK ent. |
| --- | --: | --: | --: |
| [[politica_billetera]] | 11 | 1 | 1 |
| [[cuenta_billetera]] | 17 | 4 | 14 |
| [[saldo_diario_billetera]] | 9 | 1 | 0 |
| [[transaccion_billetera]] | 20 | 5 | 14 |
| [[movimiento_billetera]] | 10 | 2 | 0 |
| [[retencion_saldo]] | 12 | 3 | 2 |
| [[reverso_transaccion]] | 10 | 3 | 0 |
| [[instrumento_fondeo]] | 16 | 1 | 2 |
| [[punto_atencion]] | 12 | 1 | 2 |
| [[arqueo_punto_atencion]] | 13 | 2 | 0 |
| [[orden_recarga]] | 17 | 6 | 0 |
| [[orden_retiro]] | 19 | 6 | 1 |
| [[transferencia_p2p]] | 11 | 5 | 0 |
| [[cuenta_custodia]] | 13 | 0 | 2 |
| [[movimiento_custodia]] | 11 | 2 | 0 |
| [[conciliacion_custodia]] | 13 | 3 | 1 |
| [[descuadre_custodia]] | 12 | 3 | 0 |
| [[limite_operativo_billetera]] | 11 | 0 | 1 |
| [[consumo_limite]] | 8 | 2 | 0 |
| [[regla_antifraude]] | 10 | 1 | 0 |
| [[evaluacion_antifraude]] | 11 | 3 | 0 |
| [[bloqueo_saldo]] | 15 | 3 | 1 |
| [[estado_cuenta_billetera]] | 13 | 1 | 0 |
| [[certificado_saldo]] | 10 | 2 | 0 |
| [[solicitud_cierre_billetera]] | 10 | 3 | 0 |
