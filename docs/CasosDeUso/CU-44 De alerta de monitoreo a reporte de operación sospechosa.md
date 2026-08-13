---
tags:
  - caso-uso
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
  - modulo/09-auditoria-reportes-y-cumplimiento
codigo: CU-44
criticidad: alta
actores: [Sistema, Analista, Oficial de cumplimiento]
normas: [UIF — enfoque basado en riesgo, ROS sin límite de monto]
---

# CU-44 — De alerta de monitoreo a reporte de operación sospechosa

> **Objetivo.** Detectar patrones con reglas parametrizables, investigarlos con
> plazo, y **decidir siempre por escrito**: descartar, monitorear, reportar o
> terminar la relación. Una alerta cerrada sin conclusión es peor que no tenerla.

## Actores y disparador

- **Actor principal:** motor de monitoreo (batch y en línea).
- **Actores secundarios:** analista de cumplimiento; oficial de cumplimiento.
- **Disparadores:** operaciones que coinciden con una tipología; desvío de perfil;
  coincidencia en listas; denuncia interna.

## Precondiciones

1. [[regla_monitoreo_lft]] activas con `expresion`, `ventana_evaluacion`,
   `severidad`, `accion_automatica` y `fuente_normativa`.

## Flujo principal

1. El motor evalúa las reglas sobre las operaciones y el perfil del cliente.
2. Al coincidir, crea [[alerta_monitoreo_lft]] con `detalle` JSON (qué disparó la
   regla), `monto_involucrado`, `severidad` y `estado='ABIERTA'`.
3. Según `accion_automatica`:
   - `SOLO_ALERTAR` → la operación sigue;
   - `RETENER_OPERACION` → se crea [[retencion_saldo]] motivo `ANTIFRAUDE`;
   - `BLOQUEAR_CUENTA` → la cuenta pasa a `CONGELADA` y se notifica al oficial.
4. Un analista toma la alerta. Si hay varias del mismo cliente, se agrupan en un
   [[caso_investigacion_lft]] con `codigo`, `analista_id` y **`plazo_limite`
   guardado**.
5. El analista documenta `hallazgos` y propone `decision`:
   `DESCARTAR` · `MONITOREO_REFORZADO` · `REPORTAR` · `TERMINAR_RELACION`.
6. El oficial de cumplimiento revisa (`revisado_por` ≠ `analista_id`).
7. Si la decisión es `REPORTAR`, se crea [[reporte_operacion_sospechosa]] con
   `tipologia`, `narrativa`, `monto_total` y se remite; se guarda
   `numero_radicado`.
8. Toda alerta se cierra con `conclusion` obligatoria (`R-UIF-07`).

## Flujos alternativos

| # | Situación | Resultado |
| :-: | --- | --- |
| 5a | El cliente aporta explicación válida | Se descarta con conclusión y se actualiza [[perfil_transaccional]] |
| 4a | El caso vence su `plazo_limite` | Queda visible como vencido y escala a [[hallazgo_auditoria]] |
| 7a | Se decide reportar | **Prohibido avisar al cliente** (deber de reserva); el sistema no genera notificación al titular en este flujo |
| 3a | Bloqueo automático de cuenta | El titular puede reclamar; el reclamo se atiende sin revelar el motivo de inteligencia financiera |
| — | Aparece nueva información sobre un caso cerrado | Se abre un caso nuevo enlazado, no se reabre para reescribir |

## Postcondiciones

- Cada alerta tiene destino y justificación escrita; cada reporte, su expediente.

## Restricciones aplicables

`R-UIF-07` · `R-UIF-08` · `R-SEG-02` · `R-SEG-04` · `R-AUD-01`

## Evidencia que deja

[[alerta_monitoreo_lft]] · [[caso_investigacion_lft]] ·
[[reporte_operacion_sospechosa]] · [[registro_acceso_datos]] · [[bitacora_evento]]

## Criterios de aceptación

```gherkin
Dada una regla de fraccionamiento activa
Cuando un cliente realiza operaciones que la satisfacen
Entonces existe una alerta_monitoreo_lft con detalle del patrón

Dado un intento de cerrar una alerta sin conclusión
Cuando se guarda
Entonces la base de datos lo rechaza (R-UIF-07)

Dado un caso con decisión REPORTAR
Cuando se cierra
Entonces existe un reporte_operacion_sospechosa enlazado
Y no se generó ninguna notificación al cliente
```

## Ver también

[[CU-06 Revisión periódica de conocimiento del cliente]] · [[CU-45 Atender un requerimiento de autoridad]]
