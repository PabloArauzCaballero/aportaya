-- Plan de cuentas mínimo. El saldo de los usuarios es pasivo exigible (2.1.x), nunca patrimonio.
-- GENERADO desde seeders/minimos/01-plan-de-cuentas.json — no editar a mano.

INSERT INTO cuenta_contable (codigo, nombre, tipo, naturaleza, saldo) VALUES
  ('1.1.01', 'Cuenta de custodia — dinero electrónico', 'ACTIVO', 'DEUDORA', 0),
  ('1.1.02', 'Bancos recaudadores', 'ACTIVO', 'DEUDORA', 0),
  ('1.1.03', 'Efectivo en puntos de atención', 'ACTIVO', 'DEUDORA', 0),
  ('1.2.01', 'Cuentas por cobrar — comisiones', 'ACTIVO', 'DEUDORA', 0),
  ('1.2.02', 'Cuentas por cobrar — subrogación fondo de garantía', 'ACTIVO', 'DEUDORA', 0),
  ('2.1.01', 'Dinero electrónico por pagar — usuarios', 'PASIVO', 'ACREEDORA', 0),
  ('2.1.02', 'Dinero electrónico por pagar — grupos', 'PASIVO', 'ACREEDORA', 0),
  ('2.1.03', 'Fondo de garantía — recursos de los grupos', 'PASIVO', 'ACREEDORA', 0),
  ('2.1.04', 'Saldos en suspenso no identificados', 'PASIVO', 'ACREEDORA', 0),
  ('2.2.01', 'IVA débito fiscal por pagar', 'PASIVO', 'ACREEDORA', 0),
  ('2.2.02', 'Impuesto a las transacciones por pagar', 'PASIVO', 'ACREEDORA', 0),
  ('3.1.01', 'Capital', 'PATRIMONIO', 'ACREEDORA', 0),
  ('3.2.01', 'Resultados acumulados', 'PATRIMONIO', 'ACREEDORA', 0),
  ('4.1.01', 'Ingresos por comisión de servicio', 'INGRESO', 'ACREEDORA', 0),
  ('4.1.02', 'Ingresos por comisión de retiro', 'INGRESO', 'ACREEDORA', 0),
  ('5.1.01', 'Costos de proveedores de pago', 'EGRESO', 'DEUDORA', 0),
  ('5.1.02', 'Costos de mensajería', 'EGRESO', 'DEUDORA', 0),
  ('5.2.01', 'Pérdidas por riesgo operativo', 'EGRESO', 'DEUDORA', 0),
  ('5.2.02', 'Devoluciones y bonificaciones a clientes', 'EGRESO', 'DEUDORA', 0)
ON CONFLICT (codigo) DO NOTHING;
