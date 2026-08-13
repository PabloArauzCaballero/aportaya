---
name: efectivo-puntos-atencion
description: "Operar efectivo en corresponsales de AportaYa: habilitación del punto dentro de la licencia, límite diario, arqueo único por punto y fecha con diferencia derivada, faltantes que abren evento de riesgo, contingencia sin conectividad y efectivo que cuenta para la custodia y el encaje. Úsala al implementar recarga o retiro en efectivo, al dar de alta un punto de atención, o cuando un arqueo no cuadre."
---

# Efectivo y puntos de atención

El efectivo es el único lugar del sistema donde el dinero existe fuera de la base de
datos. Todo lo demás en esta skill se deduce de eso.

## Antes de operar

| Requisito | Por qué |
| --- | --- |
| Punto `HABILITADO` con responsable y rol vigente | hay una persona con nombre detrás de cada peso |
| Dentro del alcance de la licencia (`R-LIC-01`) | operar efectivo por corresponsales no autorizados es operar fuera de licencia |
| `limite_efectivo_diario` configurado | el límite protege al corresponsal antes que a nosotros |
| Arqueo del día abierto | sin arqueo abierto no hay operación de efectivo |

## El arqueo

```
saldo_teorico = saldo_inicial + total_recargas − total_retiros    ← lo calcula el sistema
saldo_contado                                                      ← lo informa la persona
diferencia    = contado − teorico                                  ← columna DERIVADA
```

Tres reglas que hacen que el arqueo sirva:

1. **El punto no escribe el teórico.** Si pudiera, el arqueo cuadraría siempre.
2. **La diferencia se deriva** (`GENERATED`). Nadie la escribe a mano.
3. **La interfaz no muestra el teórico hasta después de informar el contado.** Para
   que contar sea contar y no completar un casillero.

Uno por punto y fecha (`R-BIL-18`). Toda diferencia distinta de cero exige
`observaciones`, y el cierre sin `saldo_contado` se rechaza.

## No se arrastra un descuadre

Si el cierre anterior quedó descuadrado, **la jornada no abre** hasta resolverlo o
autorizar la apertura con constancia. Arrastrar una diferencia es perderla: a los
tres días nadie sabe de qué día venía.

## Faltantes

| Situación | Qué se abre |
| --- | --- |
| Faltante sobre el umbral de política | [[evento_riesgo_operativo]] con pérdida cuantificada |
| Indicio de apropiación | [[incidente_seguridad]] |
| **Faltante reiterado en el mismo punto** | se suspende el punto y se investiga |

El patrón importa más que el monto. Tres faltantes de Bs 20 en un mes dicen más que
uno de Bs 500.

## Umbrales UIF sobre efectivo

Una recarga en efectivo por encima del umbral exige
[[declaracion_origen_fondos]] **antes de acreditar**
([[CU-41 Detectar umbral y registrar formulario PCC-01]]). El efectivo es el canal de
mayor riesgo de la operación y los controles van adelante, no después.

## Contingencia sin conectividad

Las operaciones se registran con numeración propia y se concilian al reconectar.
Pero: **no se acredita saldo sin registro**. Si el punto no puede registrar, no puede
acreditar; puede recibir el efectivo y dejar constancia física, y la acreditación
espera.

## El efectivo es custodia

El efectivo en poder del corresponsal **es parte de la custodia y cuenta para el
encaje** (`R-BIL-11`). Se concilia contra [[cuenta_custodia]] en el cierre diario
([[CU-50 Conciliar la custodia y verificar el encaje]]). Olvidarlo sobreestima el
encaje, que es exactamente el error que un supervisor busca.

## Cambio de responsable a mitad de jornada

Se cierra un arqueo parcial y se abre otro. Cada tramo tiene su responsable con
nombre. Compartir un turno sin cortar el arqueo hace que la diferencia no tenga dueño.

## Qué no hacer

- No precargar el `saldo_contado` con el teórico.
- No permitir cerrar con diferencia sin observación.
- No dejar el efectivo de puntos fuera del cálculo de encaje.
- No abrir jornada sobre un cierre descuadrado.
- No entregar efectivo por un retiro sin MFA del titular (`R-BIL-09`).
- No tratar un arqueo sorpresivo como cierre de jornada: es un arqueo adicional.

## Ver también

- [[CU-57 Operar un punto de atención y arquear el efectivo]] · [[CU-10 Recargar saldo]] ·
  [[CU-11 Retirar saldo]] · [[CU-50 Conciliar la custodia y verificar el encaje]]
- `R-BIL-09` · `R-BIL-11` · `R-BIL-18` · `R-LIC-01` en [[Restricciones]]
- Skills: `contabilidad-partida-doble`, `qr-pagos`, `cumplimiento-uif`,
  `observabilidad`, `dinero-decimal`
