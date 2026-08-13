---
tags:
  - caso-uso
  - modulo/11-tarifas-comisiones-impuestos-y-facturacion
codigo: CU-35
criticidad: media
actores: [Contabilidad]
normas: [Contabilidad, tributario]
---

# CU-35 — Cerrar la liquidación mensual de ingresos

> **Objetivo.** Saber cuánto ganó realmente la plataforma en el mes —neto de
> exenciones, devoluciones, incobrables, impuestos y costo de proveedores— y que
> ese número **cuadre contra el mayor**.

## Actores y disparador

- **Actor principal:** contabilidad.
- **Disparador:** cierre del período mensual.

## Precondiciones

1. Todos los [[cierre_diario]] del mes están cuadrados ([[CU-51 Ejecutar el cierre diario]]).
2. No hay [[excepcion_conciliacion]] abiertas del período.

## Flujo principal

1. Se agregan los [[devengo_comision]] del `periodo_contable`: total devengado,
   cobrado, exonerado, devuelto e incobrable.
2. Se agregan los [[calculo_impuesto]] del período y los
   [[costo_proveedor_operacion]].
3. Se crea [[liquidacion_ingresos]] con `ingreso_neto` (columna generada) y
   `cantidad_operaciones`.
4. Se contrasta `total_cobrado` contra el saldo de la cuenta de ingresos del mayor.
   **Si no coincide, no se cierra.**
5. Se genera el [[asiento_contable]] de cierre del período y se enlaza.
6. Se marca `estado='CERRADA'` con `cerrada_por` y `cerrada_en`.

## Flujos alternativos

| # | Situación | Resultado |
| :-: | --- | --- |
| 4a | Diferencia contra el mayor | Se abre [[excepcion_conciliacion]] o [[hallazgo_auditoria]]; el período queda abierto |
| — | Reapertura de un período cerrado | Requiere autorización registrada; queda `reabierto` y auditado |
| 1a | Devengos de meses anteriores que se cobran ahora | Se imputan al período de devengo, no al de cobro (criterio devengado) |

## Postcondiciones

- Existe un resultado mensual reproducible desde los devengos, no desde una
  planilla aparte.

## Restricciones aplicables

`R-AUD-05` · `R-AUD-06` · `R-BIL-12`

## Evidencia que deja

[[liquidacion_ingresos]] · [[asiento_contable]] · [[costo_proveedor_operacion]]

## Criterios de aceptación

```gherkin
Dado un mes con todos los cierres diarios cuadrados
Cuando se cierra la liquidación
Entonces total_cobrado coincide con el saldo de la cuenta de ingresos

Dada una diferencia entre la liquidación y el mayor
Cuando se intenta cerrar
Entonces el cierre se rechaza y queda un hallazgo abierto
```

## Ver también

[[CU-31 Devengar y cobrar la comisión]] · [[CU-51 Ejecutar el cierre diario]]
