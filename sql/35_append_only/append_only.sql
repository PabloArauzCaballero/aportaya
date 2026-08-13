-- R-AUD-01 · tablas append-only: sin UPDATE ni DELETE.
-- Generado por scripts/generar_ddl.py desde la lista APPEND_ONLY del modelo:
-- agregar una tabla a esa lista alcanza para que quede sellada.

CREATE OR REPLACE FUNCTION fn_aud_bloquear_mutacion() RETURNS trigger AS $$
BEGIN
  RAISE EXCEPTION 'R-AUD-01: % es append-only; corrija con el movimiento inverso',
        TG_TABLE_NAME;
END $$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS tg_abono_recuperacion_append_only ON abono_recuperacion;
CREATE TRIGGER tg_abono_recuperacion_append_only
  BEFORE UPDATE OR DELETE ON abono_recuperacion
  FOR EACH ROW EXECUTE FUNCTION fn_aud_bloquear_mutacion();

DROP TRIGGER IF EXISTS tg_acta_comite_append_only ON acta_comite;
CREATE TRIGGER tg_acta_comite_append_only
  BEFORE UPDATE OR DELETE ON acta_comite
  FOR EACH ROW EXECUTE FUNCTION fn_aud_bloquear_mutacion();

DROP TRIGGER IF EXISTS tg_asiento_contable_append_only ON asiento_contable;
CREATE TRIGGER tg_asiento_contable_append_only
  BEFORE UPDATE OR DELETE ON asiento_contable
  FOR EACH ROW EXECUTE FUNCTION fn_aud_bloquear_mutacion();

DROP TRIGGER IF EXISTS tg_bitacora_evento_append_only ON bitacora_evento;
CREATE TRIGGER tg_bitacora_evento_append_only
  BEFORE UPDATE OR DELETE ON bitacora_evento
  FOR EACH ROW EXECUTE FUNCTION fn_aud_bloquear_mutacion();

DROP TRIGGER IF EXISTS tg_devengo_comision_append_only ON devengo_comision;
CREATE TRIGGER tg_devengo_comision_append_only
  BEFORE UPDATE OR DELETE ON devengo_comision
  FOR EACH ROW EXECUTE FUNCTION fn_aud_bloquear_mutacion();

DROP TRIGGER IF EXISTS tg_evento_dominio_append_only ON evento_dominio;
CREATE TRIGGER tg_evento_dominio_append_only
  BEFORE UPDATE OR DELETE ON evento_dominio
  FOR EACH ROW EXECUTE FUNCTION fn_aud_bloquear_mutacion();

DROP TRIGGER IF EXISTS tg_evento_reputacion_append_only ON evento_reputacion;
CREATE TRIGGER tg_evento_reputacion_append_only
  BEFORE UPDATE OR DELETE ON evento_reputacion
  FOR EACH ROW EXECUTE FUNCTION fn_aud_bloquear_mutacion();

DROP TRIGGER IF EXISTS tg_evento_riesgo_operativo_append_only ON evento_riesgo_operativo;
CREATE TRIGGER tg_evento_riesgo_operativo_append_only
  BEFORE UPDATE OR DELETE ON evento_riesgo_operativo
  FOR EACH ROW EXECUTE FUNCTION fn_aud_bloquear_mutacion();

DROP TRIGGER IF EXISTS tg_historial_estado_incumplimiento_append_only ON historial_estado_incumplimiento;
CREATE TRIGGER tg_historial_estado_incumplimiento_append_only
  BEFORE UPDATE OR DELETE ON historial_estado_incumplimiento
  FOR EACH ROW EXECUTE FUNCTION fn_aud_bloquear_mutacion();

DROP TRIGGER IF EXISTS tg_movimiento_billetera_append_only ON movimiento_billetera;
CREATE TRIGGER tg_movimiento_billetera_append_only
  BEFORE UPDATE OR DELETE ON movimiento_billetera
  FOR EACH ROW EXECUTE FUNCTION fn_aud_bloquear_mutacion();

DROP TRIGGER IF EXISTS tg_movimiento_contable_append_only ON movimiento_contable;
CREATE TRIGGER tg_movimiento_contable_append_only
  BEFORE UPDATE OR DELETE ON movimiento_contable
  FOR EACH ROW EXECUTE FUNCTION fn_aud_bloquear_mutacion();

DROP TRIGGER IF EXISTS tg_movimiento_custodia_append_only ON movimiento_custodia;
CREATE TRIGGER tg_movimiento_custodia_append_only
  BEFORE UPDATE OR DELETE ON movimiento_custodia
  FOR EACH ROW EXECUTE FUNCTION fn_aud_bloquear_mutacion();

DROP TRIGGER IF EXISTS tg_movimiento_fondo_append_only ON movimiento_fondo;
CREATE TRIGGER tg_movimiento_fondo_append_only
  BEFORE UPDATE OR DELETE ON movimiento_fondo
  FOR EACH ROW EXECUTE FUNCTION fn_aud_bloquear_mutacion();

DROP TRIGGER IF EXISTS tg_registro_acceso_datos_append_only ON registro_acceso_datos;
CREATE TRIGGER tg_registro_acceso_datos_append_only
  BEFORE UPDATE OR DELETE ON registro_acceso_datos
  FOR EACH ROW EXECUTE FUNCTION fn_aud_bloquear_mutacion();

DROP TRIGGER IF EXISTS tg_registro_incumplimiento_append_only ON registro_incumplimiento;
CREATE TRIGGER tg_registro_incumplimiento_append_only
  BEFORE UPDATE OR DELETE ON registro_incumplimiento
  FOR EACH ROW EXECUTE FUNCTION fn_aud_bloquear_mutacion();

DROP TRIGGER IF EXISTS tg_registro_operacion_relevante_append_only ON registro_operacion_relevante;
CREATE TRIGGER tg_registro_operacion_relevante_append_only
  BEFORE UPDATE OR DELETE ON registro_operacion_relevante
  FOR EACH ROW EXECUTE FUNCTION fn_aud_bloquear_mutacion();

DROP TRIGGER IF EXISTS tg_registro_sellado_append_only ON registro_sellado;
CREATE TRIGGER tg_registro_sellado_append_only
  BEFORE UPDATE OR DELETE ON registro_sellado
  FOR EACH ROW EXECUTE FUNCTION fn_aud_bloquear_mutacion();

DROP TRIGGER IF EXISTS tg_saldo_diario_billetera_append_only ON saldo_diario_billetera;
CREATE TRIGGER tg_saldo_diario_billetera_append_only
  BEFORE UPDATE OR DELETE ON saldo_diario_billetera
  FOR EACH ROW EXECUTE FUNCTION fn_aud_bloquear_mutacion();

DROP TRIGGER IF EXISTS tg_transaccion_billetera_append_only ON transaccion_billetera;
CREATE TRIGGER tg_transaccion_billetera_append_only
  BEFORE UPDATE OR DELETE ON transaccion_billetera
  FOR EACH ROW EXECUTE FUNCTION fn_aud_bloquear_mutacion();
