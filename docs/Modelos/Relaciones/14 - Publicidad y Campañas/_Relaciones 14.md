---
tags:
  - moc
  - modulo/14-publicidad-y-campanas
modulo: "14 — Publicidad y Campañas"
relaciones_fk: 24
---

# 14 — Publicidad y Campañas · relaciones

Las **24 claves foráneas** que salen de las tablas de este módulo.

[[_Relaciones|← Todas las relaciones]] · [[Index]]

| Relación | Destino | Cruza | Opcional |
| --- | --- | :-: | :-: |
| [[anunciante.organizador_id → organizador]] | [[organizador]] | ↗ 07 | sí |
| [[anunciante.socio_comercial_id → socio_comercial]] | [[socio_comercial]] | — | sí |
| [[anuncio.conjunto_anuncios_id → conjunto_anuncios]] | [[conjunto_anuncios]] | — | no |
| [[anuncio.pieza_creativa_id → pieza_creativa]] | [[pieza_creativa]] | — | no |
| [[campana_publicitaria.aprobada_por → usuario]] | [[usuario]] | ↗ 01 | sí |
| [[campana_publicitaria.cuenta_publicitaria_id → cuenta_publicitaria]] | [[cuenta_publicitaria]] | — | no |
| [[clic_anuncio.impresion_id → impresion_anuncio]] | [[impresion_anuncio]] | — | no |
| [[clic_anuncio.usuario_id → usuario]] | [[usuario]] | ↗ 01 | sí |
| [[conjunto_anuncios.campana_publicitaria_id → campana_publicitaria]] | [[campana_publicitaria]] | — | no |
| [[conjunto_anuncios.espacio_publicitario_id → espacio_publicitario]] | [[espacio_publicitario]] | — | no |
| [[conjunto_anuncios.segmento_audiencia_id → segmento_audiencia]] | [[segmento_audiencia]] | — | no |
| [[conversion_anuncio.clic_id → clic_anuncio]] | [[clic_anuncio]] | — | sí |
| [[conversion_anuncio.impresion_id → impresion_anuncio]] | [[impresion_anuncio]] | — | sí |
| [[cuenta_publicitaria.anunciante_id → anunciante]] | [[anunciante]] | — | no |
| [[factura_publicidad.cuenta_por_cobrar_id → cuenta_por_cobrar]] | [[cuenta_por_cobrar]] | ↗ 13 | sí |
| [[factura_publicidad.cuenta_publicitaria_id → cuenta_publicitaria]] | [[cuenta_publicitaria]] | — | no |
| [[factura_publicidad.factura_electronica_id → factura_electronica]] | [[factura_electronica]] | ↗ 11 | sí |
| [[impresion_anuncio.anuncio_id → anuncio]] | [[anuncio]] | — | no |
| [[impresion_anuncio.usuario_id → usuario]] | [[usuario]] | ↗ 01 | sí |
| [[pieza_creativa.anunciante_id → anunciante]] | [[anunciante]] | — | no |
| [[revision_creativa.pieza_creativa_id → pieza_creativa]] | [[pieza_creativa]] | — | no |
| [[revision_creativa.revisada_por → usuario]] | [[usuario]] | ↗ 01 | no |
| [[segmento_audiencia.creado_por → usuario]] | [[usuario]] | ↗ 01 | no |
| [[socio_comercial.verificado_por → usuario]] | [[usuario]] | ↗ 01 | sí |
