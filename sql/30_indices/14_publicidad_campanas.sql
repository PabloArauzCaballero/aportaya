-- Índices y restricciones de unicidad del módulo 14 — Publicidad y Campañas
-- Generado por scripts/generar_ddl.py — no editar a mano.

CREATE UNIQUE INDEX IF NOT EXISTS uq_socio_comercial_numero_documento
  ON socio_comercial (numero_documento);

CREATE INDEX IF NOT EXISTS ix_socio_comercial_estado
  ON socio_comercial (estado);

CREATE INDEX IF NOT EXISTS ix_anunciante_tipo
  ON anunciante (tipo);

CREATE INDEX IF NOT EXISTS ix_anunciante_organizador_id
  ON anunciante (organizador_id);

CREATE INDEX IF NOT EXISTS ix_anunciante_socio_comercial_id
  ON anunciante (socio_comercial_id);

CREATE INDEX IF NOT EXISTS ix_anunciante_estado
  ON anunciante (estado);

CREATE UNIQUE INDEX IF NOT EXISTS uq_cuenta_publicitaria_anunciante_id
  ON cuenta_publicitaria (anunciante_id);

CREATE INDEX IF NOT EXISTS ix_cuenta_publicitaria_estado
  ON cuenta_publicitaria (estado);

CREATE INDEX IF NOT EXISTS ix_campana_publicitaria_cuenta_publicitaria_id
  ON campana_publicitaria (cuenta_publicitaria_id);

CREATE INDEX IF NOT EXISTS ix_campana_publicitaria_estado
  ON campana_publicitaria (estado);

CREATE UNIQUE INDEX IF NOT EXISTS uq_espacio_publicitario_codigo
  ON espacio_publicitario (codigo);

CREATE INDEX IF NOT EXISTS ix_conjunto_anuncios_campana_publicitaria_id
  ON conjunto_anuncios (campana_publicitaria_id);

CREATE INDEX IF NOT EXISTS ix_conjunto_anuncios_segmento_audiencia_id
  ON conjunto_anuncios (segmento_audiencia_id);

CREATE INDEX IF NOT EXISTS ix_conjunto_anuncios_espacio_publicitario_id
  ON conjunto_anuncios (espacio_publicitario_id);

CREATE INDEX IF NOT EXISTS ix_conjunto_anuncios_estado
  ON conjunto_anuncios (estado);

CREATE INDEX IF NOT EXISTS ix_pieza_creativa_anunciante_id
  ON pieza_creativa (anunciante_id);

CREATE INDEX IF NOT EXISTS ix_pieza_creativa_estado_moderacion
  ON pieza_creativa (estado_moderacion);

CREATE INDEX IF NOT EXISTS ix_revision_creativa_pieza_creativa_id
  ON revision_creativa (pieza_creativa_id);

CREATE INDEX IF NOT EXISTS ix_anuncio_conjunto_anuncios_id
  ON anuncio (conjunto_anuncios_id);

CREATE INDEX IF NOT EXISTS ix_anuncio_pieza_creativa_id
  ON anuncio (pieza_creativa_id);

CREATE INDEX IF NOT EXISTS ix_anuncio_estado
  ON anuncio (estado);

CREATE INDEX IF NOT EXISTS ix_impresion_anuncio_anuncio_id
  ON impresion_anuncio (anuncio_id);

CREATE INDEX IF NOT EXISTS ix_impresion_anuncio_usuario_id
  ON impresion_anuncio (usuario_id);

CREATE INDEX IF NOT EXISTS ix_impresion_anuncio_mostrada_en
  ON impresion_anuncio (mostrada_en);

CREATE INDEX IF NOT EXISTS ix_clic_anuncio_impresion_id
  ON clic_anuncio (impresion_id);

CREATE INDEX IF NOT EXISTS ix_clic_anuncio_usuario_id
  ON clic_anuncio (usuario_id);

CREATE INDEX IF NOT EXISTS ix_clic_anuncio_clic_en
  ON clic_anuncio (clic_en);

CREATE INDEX IF NOT EXISTS ix_conversion_anuncio_clic_id
  ON conversion_anuncio (clic_id);

CREATE INDEX IF NOT EXISTS ix_conversion_anuncio_impresion_id
  ON conversion_anuncio (impresion_id);

CREATE INDEX IF NOT EXISTS ix_conversion_anuncio_referencia_id
  ON conversion_anuncio (referencia_id);

CREATE INDEX IF NOT EXISTS ix_factura_publicidad_cuenta_publicitaria_id
  ON factura_publicidad (cuenta_publicitaria_id);

CREATE INDEX IF NOT EXISTS ix_factura_publicidad_estado
  ON factura_publicidad (estado);
