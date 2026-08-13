---
tags:
  - caso-uso
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
codigo: CU-45
criticidad: alta
actores: [Legal, Oficial de cumplimiento]
normas: [UIF, requerimientos judiciales y fiscales, secreto financiero]
---

# CU-45 — Atender un requerimiento de autoridad

> **Objetivo.** Responder oficios en plazo, entregando exactamente lo pedido —ni
> más ni menos— y dejando registro de qué se entregó, a quién y con qué respaldo.

## Actores y disparador

- **Actor principal:** área legal.
- **Actor secundario:** oficial de cumplimiento; áreas que aportan información.
- **Disparador:** recepción de un oficio de juzgado, fiscalía, unidad de
  inteligencia financiera, supervisor o administración tributaria.

## Precondiciones

1. El oficio está digitalizado y su autenticidad verificada.

## Flujo principal

1. Se crea [[requerimiento_autoridad]] con `numero_oficio` único,
   `fecha_recepcion`, **`plazo_respuesta` calculado y guardado**, `alcance`,
   `documento_url` y `hash_documento`.
2. Se identifica al `usuario_afectado_id` y se delimita el alcance exacto de lo
   solicitado (períodos, tipos de operación).
3. Se extrae la información. **Cada consulta a datos del afectado queda en
   [[registro_acceso_datos]]** con la justificación = número de oficio (`R-SEG-02`).
4. Si el oficio ordena inmovilizar fondos → [[CU-17 Bloquear saldo por orden de autoridad]].
5. Se responde por el canal indicado; se guardan `respuesta_url`,
   `respondido_en` y `respondido_por`.
6. Se conserva todo el expediente por el plazo legal.

## Flujos alternativos

| # | Situación | Resultado |
| :-: | --- | --- |
| 2a | El alcance es ambiguo o excesivo | Se pide aclaración por escrito y se registra; el plazo se gestiona con la autoridad |
| 5a | El plazo vence sin responder | Queda vencido y visible; escala a [[hallazgo_auditoria]] y potencialmente a [[observacion_regulatoria]] |
| 3a | Se solicita información de un no cliente | Se responde formalmente que no existe relación, sin exponer datos de terceros |
| — | El oficio impone reserva | No se notifica al titular; el sistema no dispara comunicación en este flujo |

## Postcondiciones

- Existe trazabilidad completa: qué pidieron, qué se entregó, quién lo consultó y
  cuándo se respondió.

## Restricciones aplicables

`R-SEG-02` · `R-BIL-14` · `R-AUD-08` · `R-UIF-08`

## Evidencia que deja

[[requerimiento_autoridad]] · [[registro_acceso_datos]] · [[bloqueo_saldo]] (si
aplica) · [[bitacora_evento]]

## Criterios de aceptación

```gherkin
Dado un oficio con plazo de 5 días
Cuando se registra
Entonces plazo_respuesta queda guardado y no se recalcula después

Dada la extracción de información para el oficio
Cuando un operador consulta los datos del afectado
Entonces existe un registro_acceso_datos con el número de oficio como justificación

Dado un oficio con plazo vencido sin respuesta
Cuando corre el control diario
Entonces existe un hallazgo_auditoria abierto
```

## Ver también

[[CU-17 Bloquear saldo por orden de autoridad]] · [[CU-44 De alerta de monitoreo a reporte de operación sospechosa]]
