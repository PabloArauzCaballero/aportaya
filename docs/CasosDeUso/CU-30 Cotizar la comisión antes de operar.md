---
tags:
  - caso-uso
  - modulo/11-tarifas-comisiones-impuestos-y-facturacion
codigo: CU-30
criticidad: alta
actores: [Usuario, Sistema]
normas: [ASFI transparencia y consumidor financiero]
---

# CU-30 — Cotizar la comisión antes de operar

> **Objetivo.** Que el usuario vea el número final **antes** de aceptar, y que ese
> número quede guardado con su desglose. El reclamo típico no es "me cobraron de
> más": es "nadie me avisó".

## Actores y disparador

- **Actor principal:** usuario.
- **Disparadores:** va a cobrar su turno, retirar, recargar o unirse a un grupo.

## Precondiciones

1. Existe tarifario aplicable: [[tarifa_congelada_grupo]] si la operación pertenece
   a un grupo, o el resuelto por [[asignacion_tarifario]] en caso contrario.

## Flujo principal

1. Se resuelve el [[concepto_tarifa]] por `hecho_generador_id` y ámbito.
2. Se evalúan las [[regla_tarifa]] por `orden`; gana la primera cuya `condicion`
   coincide con el contexto (monto, tamaño del grupo, canal, nivel de diligencia).
3. Se calcula según `metodo_calculo` sobre `base_calculo`, se aplican
   `monto_minimo` y `monto_maximo`, y se redondea con [[politica_redondeo]].
4. Se calculan impuestos con [[impuesto]] vigente; si
   `precio_incluye_impuesto=true`, el importe mostrado ya es el final (`R-TAR-12`).
5. Se aplican [[exencion_comision]] y [[campana_promocional]] vigentes con
   presupuesto disponible.
6. Se crea [[cotizacion_comision]] con `monto_base`, `monto_comision`,
   `monto_impuesto`, `monto_total`, `desglose` JSON, `valida_hasta` y
   `clave_idempotencia`.
7. Se muestra al usuario en lenguaje llano y se marca `mostrada_al_usuario_en`; al
   confirmar, `aceptada_en`.

## Flujos alternativos

| # | Situación | Resultado |
| :-: | --- | --- |
| 1a | No hay concepto para el hecho | La operación es gratuita: se registra cotización en cero, no se omite |
| 5a | La campaña agotó `presupuesto_maximo` | No se aplica el descuento y la cotización lo refleja |
| 6a | La cotización expiró (`valida_hasta`) | Se recalcula antes de devengar; **nunca se cobra con una cotización vencida** |
| 7a | El usuario no acepta | No hay devengo ni operación |

## Postcondiciones

- Existe evidencia de qué se le mostró al usuario y cuándo.
- El devengo posterior usa exactamente esa cotización (`cotizacion_id`).

## Restricciones aplicables

`R-TAR-01` · `R-TAR-03` · `R-TAR-07` · `R-TAR-12` · `R-CON-07`

## Evidencia que deja

[[cotizacion_comision]] · [[concepto_tarifa]] · [[regla_tarifa]] ·
[[aplicacion_promocion]] (si aplica)

## Criterios de aceptación

```gherkin
Dada una bolsa de Bs 6.000 y un concepto de 0,3% con piso 10 y techo 50
Cuando se cotiza
Entonces monto_comision es 18,00 redondeado según la política

Dada una bolsa de Bs 1.000 con el mismo concepto
Cuando se cotiza
Entonces monto_comision es 10,00 (piso aplicado)

Dada una cotización vencida
Cuando se intenta devengar con ella
Entonces se rechaza y se recalcula
```

## Ver también

[[CU-31 Devengar y cobrar la comisión]] · [[CU-34 Publicar un tarifario nuevo con preaviso]]
