---
tags:
  - caso-uso
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
codigo: CU-55
criticidad: alta
actores: [Responsable de seguridad, Legal, Comunicación]
normas: [ASFI Gestión de Seguridad de la Información, ISO/IEC 27001 A.5.24-A.5.28]
---

# CU-55 — Gestionar un incidente de seguridad de la información

> **Objetivo.** Contener rápido, **reportar en plazo** y notificar a los titulares
> cuando hay datos personales afectados. Tres relojes distintos corriendo en
> paralelo, todos guardados.

## Actores y disparador

- **Actor principal:** responsable de seguridad de la información.
- **Actores secundarios:** legal, comunicación, proveedores involucrados.
- **Disparadores:** detección por monitoreo, reporte de un usuario, aviso de un
  tercero, hallazgo de auditoría.

## Precondiciones

1. Existe [[activo_informacion]] inventariado y clasificado.
2. Hay [[designacion_regulatoria]] activa con
   `cargo='RESPONSABLE_SEGURIDAD_INFORMACION'`.

## Flujo principal

1. Se crea [[incidente_seguridad]] con `codigo`, `tipo`, `severidad`,
   `activo_informacion_id`, `detectado_en` y **`plazo_reporte` calculado y
   guardado**.
2. Se determina `datos_personales_afectados` y `usuarios_afectados` consultando la
   clasificación del activo y los [[contrato_tercero]] involucrados.
3. **Contención**: se aplican medidas (revocar sesiones, rotar credenciales,
   bloquear cuentas) y se registra `contenido_en`. Las acciones quedan en
   [[bitacora_evento]].
4. **Reporte al organismo**: dentro del plazo se remite y se guarda
   `reportado_al_organismo_en`.
5. **Notificación a titulares**: si hay datos personales afectados, se notifica y
   se guarda `notificado_a_titulares_en`.
6. Se enlaza [[evento_riesgo_operativo]] con la pérdida asociada
   ([[CU-54 Registrar un evento de riesgo operativo]]).
7. Cierre con `leccion_aprendida` y, si corresponde, [[control_interno]] nuevo o
   [[plan_accion_riesgo]].

## Flujos alternativos

| # | Situación | Resultado |
| :-: | --- | --- |
| 2a | El incidente ocurre en un tercero | Se registra igual: la responsabilidad frente al cliente no se terceriza. Se evalúa el contrato ([[evaluacion_tercero]]) |
| 4a | Vence el plazo de reporte | Queda visible como vencido; escala a hallazgo y potencial observación regulatoria |
| 5a | Se desconoce el alcance exacto | Se notifica igual con la información disponible y se actualiza; no se espera a tener el número final |
| 3a | Compromiso de credenciales | Se fuerza rotación masiva y se revocan [[sesion]] activas |

## Postcondiciones

- Existe línea de tiempo completa: detección, contención, reporte y notificación,
  con los plazos que regían ese día.

## Restricciones aplicables

`R-SEG-05` · `R-SEG-02` · `R-RIS-01` · `R-AUD-01`

## Evidencia que deja

[[incidente_seguridad]] · [[activo_informacion]] · [[evento_riesgo_operativo]] ·
[[bitacora_evento]] · [[plan_accion_riesgo]]

## Criterios de aceptación

```gherkin
Dado un incidente con datos personales afectados
Cuando se registra
Entonces plazo_reporte queda guardado
Y al reportar se completa reportado_al_organismo_en

Dado un incidente contenido pero no reportado dentro del plazo
Cuando corre el control diario
Entonces figura como vencido y genera hallazgo

Dado un incidente en un proveedor crítico
Cuando se registra
Entonces queda enlazado al contrato_tercero correspondiente
```

## Ver también

[[CU-54 Registrar un evento de riesgo operativo]] · [[CU-07 Ejercer derechos sobre datos personales]]
