-- Consultas de control: TODAS deben devolver cero filas.
-- GENERADO desde docs/Restricciones.md — no editar a mano.
-- Se ejecutan en cada despliegue y en el control diario,
-- no forman parte de sql/aplicar.sql.

-- 1) Transacciones descuadradas
SELECT t.id FROM transaccion_billetera t
  JOIN movimiento_billetera m ON m.transaccion_id = t.id
 WHERE t.estado = 'APLICADA'
 GROUP BY t.id
HAVING SUM(CASE WHEN m.sentido='DEBITO' THEN m.monto ELSE -m.monto END) <> 0;

-- 2) Saldo cacheado que no coincide con el libro
SELECT c.id, c.saldo_disponible, SUM(CASE WHEN m.sentido='CREDITO' THEN m.monto
                                          ELSE -m.monto END) AS calculado
  FROM cuenta_billetera c
  LEFT JOIN movimiento_billetera m ON m.cuenta_billetera_id = c.id
 GROUP BY c.id, c.saldo_disponible
HAVING c.saldo_disponible + c.saldo_retenido
     <> COALESCE(SUM(CASE WHEN m.sentido='CREDITO' THEN m.monto ELSE -m.monto END),0);

-- 3) Días con encaje incumplido
SELECT fecha, ratio_cobertura FROM conciliacion_custodia WHERE NOT cumple_encaje;

-- 4) Obligaciones de reporte vencidas
SELECT codigo, periodo, fecha_limite FROM reporte_regulatorio r
  JOIN catalogo_reporte_regulatorio c ON c.id = r.catalogo_reporte_id
 WHERE r.estado <> 'ENVIADO' AND r.fecha_limite < current_date;

-- 5) Entregas con comisión no trazable al tarifario
SELECT d.id FROM deduccion_entrega d
  LEFT JOIN cargo_comision cc ON cc.deduccion_entrega_id = d.id
 WHERE d.tipo = 'COMISION_PLATAFORMA' AND cc.id IS NULL;

-- 6) Reclamos cerrados favorables sin reparación
SELECT codigo FROM reclamo_cliente
 WHERE estado='CERRADO' AND resultado='FAVORABLE'
   AND monto_reclamado IS NOT NULL AND devolucion_comision_id IS NULL;
