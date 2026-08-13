---
tags:
  - caso-uso
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
codigo: CU-06
criticidad: media
actores: [Sistema, Analista de cumplimiento]
normas: [UIF EBR]
---

# CU-06 — Revisión periódica de conocimiento del cliente

> **Objetivo.** Que el conocimiento del cliente **se venza y se renueve**, con una
> frecuencia proporcional a su riesgo, y que el atraso sea visible antes de que
> alguien pregunte.

## Actores y disparador

- **Actor principal:** proceso programado diario.
- **Actor secundario:** analista de cumplimiento.
- **Disparadores:** `calificacion_riesgo_cliente.proxima_revision <= hoy`;
  desvío del perfil transaccional; cambio relevante declarado por el cliente.

## Precondiciones

1. El usuario tiene calificación de riesgo vigente con `periodicidad_revision_meses`.

## Flujo principal

1. El proceso crea [[revision_periodica_kyc]] con `fecha_programada` para cada
   usuario cuya revisión vence en la ventana.
2. Se recalcula el [[perfil_transaccional]] observado del período y se compara con
   el declarado; el resultado se escribe en [[desvio_perfil]] con
   `desvio_porcentual` y `severidad`.
3. Se re-cotejan listas restrictivas y se revalida la condición PEP
   ([[CU-03 Declaración PEP y beneficiario final]]).
4. Se recalculan los [[factor_riesgo_evaluado]] con la [[matriz_riesgo_lft]]
   vigente.
5. Según el resultado:
   - **sin cambios** → se cierra la revisión con `resultado='RATIFICADA'` y se
     programa la siguiente;
   - **sube el riesgo** → nueva [[calificacion_riesgo_cliente]] y exigencia de
     [[debida_diligencia]] superior ([[CU-02 Elevar nivel de debida diligencia]]);
   - **desvío severo** → se genera [[alerta_monitoreo_lft]] y puede abrirse
     [[caso_investigacion_lft]].
6. Se actualiza [[expediente_cliente]] (`completitud_porcentaje`,
   `ultima_actualizacion`).

## Flujos alternativos

| # | Situación | Resultado |
| :-: | --- | --- |
| 1a | La revisión vence sin ejecutarse | Queda `estado='VENCIDA'` y visible en tablero; la cuenta pasa a `LIMITADA` tras el plazo de gracia definido en política |
| 2a | El cliente no responde el pedido de actualización | Se restringe el alza de posición; se documenta el intento de contacto |
| 5a | El desvío tiene justificación válida | Se registra en `desvio_perfil.justificacion` y se actualiza el perfil declarado |

## Postcondiciones

- Ningún cliente activo queda sin revisión más allá de su periodicidad sin que eso
  sea visible y tenga consecuencia operativa.

## Restricciones aplicables

`R-UIF-09` · `R-UIF-11` · `R-LIM-01` · `R-AUD-04`

## Evidencia que deja

[[revision_periodica_kyc]] · [[desvio_perfil]] · [[factor_riesgo_evaluado]] ·
[[calificacion_riesgo_cliente]] · [[expediente_cliente]]

## Criterios de aceptación

```gherkin
Dado un cliente de riesgo ALTO con periodicidad de 6 meses
Cuando pasan 6 meses desde su última calificación
Entonces existe una revision_periodica_kyc programada

Dado un cliente cuyo monto observado supera en 300% al declarado
Cuando corre la revisión
Entonces existe un desvio_perfil con severidad alta
Y se genera una alerta_monitoreo_lft

Dado una revisión vencida y no ejecutada
Cuando pasa el plazo de gracia
Entonces la cuenta_billetera queda en estado LIMITADA
```

## Ver también

[[CU-02 Elevar nivel de debida diligencia]] · [[CU-44 De alerta de monitoreo a reporte de operación sospechosa]]
