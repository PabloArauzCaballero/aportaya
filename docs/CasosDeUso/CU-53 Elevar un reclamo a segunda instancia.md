---
tags:
  - caso-uso
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
codigo: CU-53
criticidad: media
actores: [Cliente, Legal, Supervisor]
normas: [ASFI — central de reclamos / segunda instancia]
---

# CU-53 — Elevar un reclamo a segunda instancia

> **Objetivo.** Que el cliente en desacuerdo con la respuesta pueda acudir a la
> instancia superior, y que la entidad pueda responder con el expediente completo.

## Actores y disparador

- **Actor principal:** cliente disconforme.
- **Actores secundarios:** área legal; supervisor o defensoría.
- **Disparador:** el cliente eleva el caso, o el supervisor requiere antecedentes.

## Precondiciones

1. Existe [[reclamo_cliente]] respondido (o vencido sin respuesta).

## Flujo principal

1. Se crea [[instancia_reclamo]] con `instancia` (`DEFENSORIA`, `REGULADOR`,
   `ARBITRAJE`, `JUDICIAL`), `fecha_elevacion` y `numero_expediente` cuando el
   organismo lo asigna.
2. Se arma el expediente: reclamo, respuesta, evidencia técnica
   ([[bitacora_evento]], [[movimiento_billetera]], [[cotizacion_comision]]) y
   antecedentes del cliente.
3. Se responde al requerimiento dentro del plazo fijado por el organismo; si llega
   como oficio, se tramita también por [[CU-45 Atender un requerimiento de autoridad]].
4. Recibida la resolución, se registra `resolucion`, `fecha_resolucion` y
   `monto_resarcido`.
5. Si la resolución es favorable al cliente, se ejecuta la reparación y se
   actualiza `reclamo_cliente.resultado`.
6. El caso alimenta indicadores: tasa de reclamos elevados y de resoluciones en
   contra, que se revisan en comité ([[acta_comite]]).

## Flujos alternativos

| # | Situación | Resultado |
| :-: | --- | --- |
| 4a | Resolución en contra de la entidad con multa | Se registra [[observacion_regulatoria]] tipo `MULTA` y se abre [[plan_accion_riesgo]] |
| 2a | Falta evidencia técnica | Es un hallazgo en sí mismo: significa que el flujo no dejó rastro suficiente |
| — | Varios reclamos por la misma causa | Se agrupan y se trata como falla sistémica ([[CU-54 Registrar un evento de riesgo operativo]]) |

## Postcondiciones

- Cada elevación tiene expediente, resolución y, si aplica, resarcimiento.

## Restricciones aplicables

`R-CON-04` · `R-CON-05` · `R-AUD-08`

## Evidencia que deja

[[instancia_reclamo]] · [[reclamo_cliente]] · [[observacion_regulatoria]] ·
[[plan_accion_riesgo]]

## Criterios de aceptación

```gherkin
Dado un reclamo respondido desfavorablemente
Cuando el cliente lo eleva al supervisor
Entonces existe una instancia_reclamo con fecha_elevacion

Dada una resolución favorable al cliente con resarcimiento
Cuando se registra
Entonces existe la transacción o devolución que materializa el monto_resarcido
```

## Ver también

[[CU-52 Atender un reclamo en plazo]] · [[CU-45 Atender un requerimiento de autoridad]]
