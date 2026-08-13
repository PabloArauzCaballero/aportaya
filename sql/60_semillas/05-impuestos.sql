-- Impuestos vigentes. La alícuota se guarda con vigencia: un cambio es una fila nueva.
-- GENERADO desde seeders/minimos/05-impuestos.json — no editar a mano.

INSERT INTO impuesto (codigo, nombre, alicuota, tipo_calculo, base_legal, vigente_desde, cuenta_contable_id) VALUES
  ('IVA', 'Impuesto al Valor Agregado', 0.13, 'INCLUIDO_EN_PRECIO', 'Ley 843 — verificar vigencia con el área tributaria', current_date, (SELECT id FROM cuenta_contable WHERE codigo = '2.2.01')),
  ('IT', 'Impuesto a las Transacciones', 0.03, 'SOBRE_PRECIO', 'Ley 843 — verificar vigencia con el área tributaria', current_date, (SELECT id FROM cuenta_contable WHERE codigo = '2.2.02'))
ON CONFLICT (codigo, vigente_desde) DO NOTHING;
