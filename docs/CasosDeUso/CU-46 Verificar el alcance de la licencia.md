---
tags:
  - caso-uso
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
codigo: CU-46
criticidad: alta
actores: [Sistema, Cumplimiento]
normas: [ASFI Res. 540/2025 — Reglamento para Empresas de Tecnología Financiera]
---

# CU-46 — Verificar el alcance de la licencia

> **Objetivo.** Que el sistema **no pueda** ofrecer un servicio que la autorización
> no cubre. Operar fuera del alcance es el riesgo regulatorio más caro y el más
> fácil de cometer por descuido al lanzar una función nueva.

## Actores y disparador

- **Actor principal:** el sistema, en el arranque de cada servicio y en cada
  operación sensible.
- **Actor secundario:** cumplimiento, que mantiene la fila.
- **Disparadores:** apertura de cuenta, alta de grupo, habilitación de una función
  nueva, despliegue.

## Precondiciones

1. Existe [[licencia_regulatoria]] cargada con `alcance_autorizado` en JSON,
   `estado` y vigencias.

## Flujo principal

1. Antes de habilitar un servicio, el sistema consulta:
   `licencia_regulatoria.estado='OTORGADA'`, vigencia y `alcance_autorizado`
   conteniendo el código del servicio.
2. Si el servicio no está en el alcance, se verifica si existe
   [[entorno_prueba_regulado]] activo que lo cubra, y en ese caso se aplican sus
   límites: `limite_usuarios`, `limite_monto_operacion`.
3. Habilitado, la operación procede normalmente.
4. Los servicios en sandbox reportan periódicamente: se incrementa
   `informes_remitidos` y se generan los reportes del catálogo asociados.

## Flujos alternativos

| # | Situación | Resultado |
| :-: | --- | --- |
| 1a | Estado `EN_TRAMITE` (sin licencia) | Solo se permiten funciones que no constituyan servicio financiero; **la billetera no opera** |
| 1b | Estado `SUSPENDIDA` o `REVOCADA` | Se bloquea el alta de operaciones nuevas; se permite retirar saldo y cerrar cuentas |
| 2a | Sandbox con cupo de usuarios lleno | No se admiten usuarios nuevos en ese servicio |
| 2b | Operación supera el límite del sandbox | Se rechaza indicando la restricción |
| — | Se amplía el alcance | Nueva resolución → se actualiza `alcance_autorizado` con su `numero_resolucion` y documento |

## Postcondiciones

- Todo servicio activo está respaldado por una autorización vigente y verificable
  en el propio sistema.

## Restricciones aplicables

`R-LIC-01` · `R-LIC-02` · `R-LIC-03`

## Evidencia que deja

[[licencia_regulatoria]] · [[entorno_prueba_regulado]] · [[bitacora_evento]]
(rechazos por alcance)

## Criterios de aceptación

```gherkin
Dada una licencia OTORGADA cuyo alcance no incluye "transferencias P2P"
Cuando un usuario intenta una transferencia P2P
Entonces la operación se rechaza por alcance no autorizado

Dado un servicio cubierto por un entorno de prueba con tope de 500 usuarios
Cuando se registra el usuario 501 en ese servicio
Entonces el alta en ese servicio se rechaza

Dada una licencia en estado SUSPENDIDA
Cuando un usuario intenta recargar
Entonces se rechaza
Y cuando intenta retirar su saldo, se permite
```

## Ver también

[[CU-01 Registro y apertura de billetera]] · [[Cumplimiento]] · [[Restricciones]]
