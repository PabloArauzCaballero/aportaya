---
tags:
  - caso-uso
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
codigo: CU-43
criticidad: alta
actores: [Funcionario responsable, Sistema]
normas: [UIF — remisión hasta el día 15 del mes siguiente, informe en cero]
---

# CU-43 — Remitir los reportes mensuales a la UIF

> **Objetivo.** Que el envío salga a tiempo, con el formato correcto, y que
> **cuando no hubo operaciones también se informe** — omitir el informe en cero es
> incumplimiento igual que omitir el reporte.

## Actores y disparador

- **Actor principal:** funcionario responsable / oficial de cumplimiento.
- **Actor secundario:** proceso programado que arma los archivos.
- **Disparador:** cierre de mes; el calendario del [[catalogo_reporte_regulatorio]].

## Precondiciones

1. El mes anterior está cerrado contablemente ([[CU-51 Ejecutar el cierre diario]]
   de todos sus días).
2. Existen filas activas en [[catalogo_reporte_regulatorio]] con `organismo='UIF'`,
   periodicidad mensual y `plazo_dias`.

## Flujo principal

1. El proceso crea un [[reporte_regulatorio]] por cada catálogo del período, con
   `fecha_limite` calculada y guardada.
2. Se extraen los [[registro_operacion_relevante]] del `periodo_remision`,
   agrupados por `formulario` (PCC-01, ROG-01..04), excluyendo los `exento`.
3. Si un formulario no tiene registros, **igual se genera** el reporte con
   `reporte_en_cero=true` y `cantidad_registros=0` (`R-UIF-06`).
4. Se genera el archivo en el `formato` del catálogo; se guardan `url_archivo` y
   `hash_archivo`.
5. Revisión y aprobación: `revisado_por` y `aprobado_por` distintos de
   `generado_por` (`R-SEG-04`).
6. Se envía y se crea [[envio_regulatorio]] con `numero_constancia` devuelto por el
   organismo.
7. El reporte pasa a `ENVIADO`.

## Flujos alternativos

| # | Situación | Resultado |
| :-: | --- | --- |
| 6a | El envío falla | `estado='PENDIENTE'` con `reintentos`; el vencimiento sigue corriendo y es visible |
| — | El organismo observa el envío | Se registra [[observacion_regulatoria]] con `plazo_respuesta` y se responde |
| 1a | Se acerca `fecha_limite` sin reporte generado | Alerta escalada; si vence, se crea [[hallazgo_auditoria]] de severidad alta |
| 2a | Aparecen registros tardíos del período ya enviado | Se genera un envío complementario; **no se edita el archivo original** |

## Postcondiciones

- Cada obligación mensual tiene reporte, archivo con hash y constancia de envío o
  motivo documentado de por qué no salió.

## Restricciones aplicables

`R-UIF-05` · `R-UIF-06` · `R-SEG-04` · `R-AUD-08`

## Evidencia que deja

[[reporte_regulatorio]] · [[envio_regulatorio]] · [[observacion_regulatoria]] ·
[[registro_operacion_relevante]]

## Criterios de aceptación

```gherkin
Dado un mes con 12 formularios PCC-01 generados
Cuando se arma el reporte
Entonces cantidad_registros es 12 y reporte_en_cero es false

Dado un mes sin ninguna operación sobre umbral
Cuando se arma el reporte
Entonces existe un reporte_regulatorio con reporte_en_cero = true

Dado un reporte cuya fecha_limite venció sin envío
Cuando corre el control diario
Entonces existe un hallazgo_auditoria abierto
```

## Ver también

[[CU-41 Detectar umbral y registrar formulario PCC-01]] · [[CU-42 Detectar umbral y registrar ROG]] · [[CU-45 Atender un requerimiento de autoridad]]
