-- Contratos de adhesión. Sin contrato vigente aceptado no se puede operar (R-CON-06).
-- GENERADO desde seeders/minimos/11-contratos-de-adhesion.json — no editar a mano.

INSERT INTO contrato_adhesion (codigo, version, tipo, estado, url_documento, hash_documento, registrado_ante_regulador, vigente_desde) VALUES
  ('CTO-BILLETERA', 1, 'BILLETERA', 'BORRADOR', 'https://pasanaku.bo/legal/contrato-billetera-v1.pdf', repeat('0', 64), FALSE, now()),
  ('CTO-GRUPO', 1, 'GRUPO_PASANAKU', 'BORRADOR', 'https://pasanaku.bo/legal/contrato-grupo-v1.pdf', repeat('0', 64), FALSE, now()),
  ('CTO-TARIFAS', 1, 'TARIFAS', 'BORRADOR', 'https://pasanaku.bo/legal/tarifario-v1.pdf', repeat('0', 64), FALSE, now()),
  ('CTO-DATOS', 1, 'TRATAMIENTO_DATOS', 'BORRADOR', 'https://pasanaku.bo/legal/politica-privacidad-v1.pdf', repeat('0', 64), FALSE, now())
ON CONFLICT (codigo, version) DO NOTHING;
