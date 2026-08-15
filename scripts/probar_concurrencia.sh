#!/usr/bin/env bash
# Prueba de concurrencia contra una base real.
#
#   scripts/probar_concurrencia.sh [contenedor] [base]
#
# Abre N conexiones simultáneas que compiten por la misma cuenta y verifica que
# los controles de dinero y de cadena aguantan. Un solo hilo no reproduce estos
# defectos: hay que hacer competir dos transacciones por la misma fila.
set -euo pipefail

CONTENEDOR="${1:-pg-aportaya}"
BASE="${2:-aportaya_auditoria}"
PARALELAS="${PARALELAS:-8}"

psql_() { docker exec -e PGPASSWORD="${PGPASS:-postgres}" -i "$CONTENEDOR" psql -U postgres -d "$BASE" "$@"; }

fallas=0

# ---------------------------------------------------------------------
# Escenario 1 — interleaving determinista.
#
# Lanzar N procesos en paralelo NO reproduce el defecto: el arranque de cada
# psql cuesta más que la ventana de carrera, así que en la práctica se
# serializan solos y la prueba pasa aunque el bug esté presente. Hay que forzar
# el solapamiento: A abre la transacción y la mantiene abierta mientras B entra.
#
#   A: BEGIN; INSERT movimiento;  (el trigger toma el bloqueo de fila) ... espera
#   B:        BEGIN; INSERT movimiento;  -> su SELECT SUM no ve la fila de A,
#             y su UPDATE queda esperando el bloqueo
#   A: COMMIT
#   B: COMMIT  -> sin FOR UPDATE, escribe el saldo que calculó con el snapshot
#                 viejo y el movimiento de A desaparece del saldo
# ---------------------------------------------------------------------
echo "== escenario 1 · interleaving determinista =="
CUENTA=$(psql_ -At -c "SELECT prueba_preparar_cuenta();")
echo "cuenta: $CUENTA · saldo inicial: $(psql_ -At -c "SELECT saldo_disponible FROM cuenta_billetera WHERE id='$CUENTA';")"

psql_ -q -c "BEGIN; SELECT prueba_debitar('$CUENTA', 40); SELECT pg_sleep(3); COMMIT;" \
  >/dev/null 2>&1 &
pid_a=$!
sleep 1
psql_ -q -c "BEGIN; SELECT prueba_debitar('$CUENTA', 30); COMMIT;" >/dev/null 2>&1 &
pid_b=$!
wait "$pid_a" || true
wait "$pid_b" || true

saldo=$(psql_ -At -c "SELECT saldo_disponible FROM cuenta_billetera WHERE id='$CUENTA';")
libro=$(psql_ -At -c "SELECT COALESCE(SUM(CASE WHEN sentido='CREDITO' THEN monto ELSE -monto END),0)
                        FROM movimiento_billetera WHERE cuenta_billetera_id='$CUENTA';")
echo "saldo en la cuenta: $saldo · saldo según el libro: $libro (esperado: 30.00)"
if [ "$saldo" != "$libro" ]; then
  echo "FALLA · P0-1 se perdió un movimiento del saldo (carrera de lectura sin bloqueo)"
  fallas=$((fallas + 1))
else
  echo "OK · el saldo siguió al libro pese al solapamiento"
fi
echo
psql_ -c "SELECT * FROM prueba_veredicto('$CUENTA');"

# ---------------------------------------------------------------------
# Escenario 2 — estrés: N débitos simultáneos sobre un saldo que alcanza para 1.
# ---------------------------------------------------------------------
echo "== escenario 2 · $PARALELAS débitos simultáneos de 100 sobre un saldo de 100 =="
CUENTA2=$(psql_ -At -c "SELECT prueba_preparar_cuenta();")
pids=()
for i in $(seq 1 "$PARALELAS"); do
  psql_ -q -c "SELECT prueba_debitar('$CUENTA2', 100);" >/dev/null 2>&1 &
  pids+=($!)
done
exitosos=0
for p in "${pids[@]}"; do
  if wait "$p"; then exitosos=$((exitosos + 1)); fi
done
echo "débitos aceptados: $exitosos de $PARALELAS (lo correcto es exactamente 1)"
echo "saldo final: $(psql_ -At -c "SELECT saldo_disponible FROM cuenta_billetera WHERE id='$CUENTA2';")"
if [ "$exitosos" -ne 1 ]; then
  echo "FALLA · se aceptaron $exitosos débitos; el saldo sólo alcanzaba para 1"
  fallas=$((fallas + 1))
else
  echo "OK · un solo débito pasó, el resto fue rechazado por saldo insuficiente"
fi
echo
psql_ -c "SELECT * FROM prueba_veredicto('$CUENTA2');"

if [ "$fallas" -gt 0 ]; then
  echo "== $fallas escenario(s) con FALLA =="
  exit 1
fi
echo "== todos los escenarios pasan =="
