-- Claves foráneas del módulo 14 — Publicidad y Campañas
-- Generado por scripts/generar_ddl.py — no editar a mano.
-- Se aplican después de crear todas las tablas: el modelo tiene
-- referencias circulares entre módulos.

ALTER TABLE anunciante
  ADD CONSTRAINT fk_anunciante_organizador_id
  FOREIGN KEY (organizador_id) REFERENCES organizador (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE anunciante
  ADD CONSTRAINT fk_anunciante_socio_comercial_id
  FOREIGN KEY (socio_comercial_id) REFERENCES socio_comercial (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE anuncio
  ADD CONSTRAINT fk_anuncio_conjunto_anuncios_id
  FOREIGN KEY (conjunto_anuncios_id) REFERENCES conjunto_anuncios (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE anuncio
  ADD CONSTRAINT fk_anuncio_pieza_creativa_id
  FOREIGN KEY (pieza_creativa_id) REFERENCES pieza_creativa (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE campana_publicitaria
  ADD CONSTRAINT fk_campana_publicitaria_aprobada_por
  FOREIGN KEY (aprobada_por) REFERENCES usuario (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE campana_publicitaria
  ADD CONSTRAINT fk_campana_publicitaria_cuenta_publicitaria_id
  FOREIGN KEY (cuenta_publicitaria_id) REFERENCES cuenta_publicitaria (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE clic_anuncio
  ADD CONSTRAINT fk_clic_anuncio_impresion_id
  FOREIGN KEY (impresion_id) REFERENCES impresion_anuncio (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE clic_anuncio
  ADD CONSTRAINT fk_clic_anuncio_usuario_id
  FOREIGN KEY (usuario_id) REFERENCES usuario (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE conjunto_anuncios
  ADD CONSTRAINT fk_conjunto_anuncios_campana_publicitaria_id
  FOREIGN KEY (campana_publicitaria_id) REFERENCES campana_publicitaria (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE conjunto_anuncios
  ADD CONSTRAINT fk_conjunto_anuncios_espacio_publicitario_id
  FOREIGN KEY (espacio_publicitario_id) REFERENCES espacio_publicitario (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE conjunto_anuncios
  ADD CONSTRAINT fk_conjunto_anuncios_segmento_audiencia_id
  FOREIGN KEY (segmento_audiencia_id) REFERENCES segmento_audiencia (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE conversion_anuncio
  ADD CONSTRAINT fk_conversion_anuncio_clic_id
  FOREIGN KEY (clic_id) REFERENCES clic_anuncio (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE conversion_anuncio
  ADD CONSTRAINT fk_conversion_anuncio_impresion_id
  FOREIGN KEY (impresion_id) REFERENCES impresion_anuncio (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE cuenta_publicitaria
  ADD CONSTRAINT fk_cuenta_publicitaria_anunciante_id
  FOREIGN KEY (anunciante_id) REFERENCES anunciante (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE factura_publicidad
  ADD CONSTRAINT fk_factura_publicidad_cuenta_por_cobrar_id
  FOREIGN KEY (cuenta_por_cobrar_id) REFERENCES cuenta_por_cobrar (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE factura_publicidad
  ADD CONSTRAINT fk_factura_publicidad_cuenta_publicitaria_id
  FOREIGN KEY (cuenta_publicitaria_id) REFERENCES cuenta_publicitaria (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE factura_publicidad
  ADD CONSTRAINT fk_factura_publicidad_factura_electronica_id
  FOREIGN KEY (factura_electronica_id) REFERENCES factura_electronica (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE impresion_anuncio
  ADD CONSTRAINT fk_impresion_anuncio_anuncio_id
  FOREIGN KEY (anuncio_id) REFERENCES anuncio (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE impresion_anuncio
  ADD CONSTRAINT fk_impresion_anuncio_usuario_id
  FOREIGN KEY (usuario_id) REFERENCES usuario (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE pieza_creativa
  ADD CONSTRAINT fk_pieza_creativa_anunciante_id
  FOREIGN KEY (anunciante_id) REFERENCES anunciante (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE revision_creativa
  ADD CONSTRAINT fk_revision_creativa_pieza_creativa_id
  FOREIGN KEY (pieza_creativa_id) REFERENCES pieza_creativa (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE revision_creativa
  ADD CONSTRAINT fk_revision_creativa_revisada_por
  FOREIGN KEY (revisada_por) REFERENCES usuario (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE segmento_audiencia
  ADD CONSTRAINT fk_segmento_audiencia_creado_por
  FOREIGN KEY (creado_por) REFERENCES usuario (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE socio_comercial
  ADD CONSTRAINT fk_socio_comercial_verificado_por
  FOREIGN KEY (verificado_por) REFERENCES usuario (id) ON DELETE SET NULL ON UPDATE CASCADE;
