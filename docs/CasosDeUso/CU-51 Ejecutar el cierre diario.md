---
tags:
  - caso-uso
  - modulo/03-aportes-pagos-qr-y-conciliacion
codigo: CU-51
criticidad: alta
actores: [Contabilidad, Sistema]
normas: [Contabilidad, ASFI conciliación]
---

# CU-51 — Ejecutar el cierre diario

> **Objetivo.** Cerrar el día solo cuando **todo cuadra**: pagos conciliados,
> asientos balanceados, custodia verificada y sin excepciones abiertas.

## Actores y disparador

- **Actor principal:** proceso programado + contabilidad.
- **Disparador:** fin del día operativo.

## Precondiciones

1. Se ingirieron los [[extracto_bancario]] del día y se cruzaron los
   [[movimiento_bancario]].
2. Corrió [[CU-50 Conciliar la custodia y verificar el encaje]].

## Flujo principal

1. Se concilian los [[pago]] del día contra los movimientos bancarios
   ([[conciliacion]]).
2. Se listan las [[excepcion_conciliacion]] abiertas de la fecha.
3. Se totalizan recaudado, conciliado y excepciones; se cuenta la cantidad de pagos.
4. Se verifica que todos los [[asiento_contable]] del día estén confirmados y
   balanceados.
5. Se crea [[cierre_diario]] con `cuadrado = (no hay excepciones abiertas) AND
   (conciliación de custodia CUADRADA)` (`R-BIL-12`).
6. Se cierra el día: se generan los [[saldo_diario_billetera]] y se emite
   [[evento_dominio]] `DIA_CERRADO`.

## Flujos alternativos

| # | Situación | Resultado |
| :-: | --- | --- |
| 2a | Hay excepciones abiertas | `cuadrado=false`; el día queda abierto y visible en tablero hasta resolverlas |
| 5a | Descuadre de custodia | `cuadrado=false` aunque la conciliación de pagos esté perfecta |
| — | Reapertura de un día cerrado | Requiere autorización; se registra `reabierto_en` y el motivo |
| 4a | Asiento sin confirmar | El cierre no procede: primero se resuelve el asiento |

## Postcondiciones

- Un día cerrado y cuadrado es un punto de control confiable para auditoría.
- Los saldos diarios quedan sellados y encadenados.

## Restricciones aplicables

`R-BIL-12` · `R-AUD-05` · `R-AUD-07`

## Evidencia que deja

[[cierre_diario]] · [[conciliacion]] · [[excepcion_conciliacion]] ·
[[saldo_diario_billetera]]

## Criterios de aceptación

```gherkin
Dado un día sin excepciones y con custodia cuadrada
Cuando se ejecuta el cierre
Entonces cierre_diario.cuadrado es true
Y existen saldo_diario_billetera para todas las cuentas activas

Dado un día con una excepción de conciliación abierta
Cuando se ejecuta el cierre
Entonces cuadrado es false
```

## Ver también

[[CU-50 Conciliar la custodia y verificar el encaje]] · [[CU-35 Cerrar la liquidación mensual de ingresos]]
