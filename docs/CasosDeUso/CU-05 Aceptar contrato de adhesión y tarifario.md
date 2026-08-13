---
tags:
  - caso-uso
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
  - modulo/11-tarifas-comisiones-impuestos-y-facturacion
codigo: CU-05
criticidad: alta
actores: [Usuario, Sistema]
normas: [ASFI Consumidor Financiero (RNSF Libro 4 Título I)]
---

# CU-05 — Aceptar contrato de adhesión y tarifario

> **Objetivo.** Convertir un clic en un consentimiento **oponible**: con versión
> exacta, documento íntegro, evidencia técnica y fecha.

## Actores y disparador

- **Actor principal:** usuario.
- **Disparadores:** apertura de cuenta; adhesión a un grupo; publicación de una
  versión nueva del contrato o del tarifario.

## Precondiciones

1. Existe [[contrato_adhesion]] con `estado='VIGENTE'` y, cuando la norma lo exige,
   `registrado_ante_regulador=true` con su `numero_registro`.
2. El [[tarifario]] aplicable está `VIGENTE` y publicado en
   [[documento_publicado]] con `hash_documento`.

## Flujo principal

1. El sistema resuelve qué contrato y qué tarifario aplican (por ámbito:
   [[asignacion_tarifario]] resuelve usuario > grupo > segmento > global).
2. Se muestra el documento íntegro y el resumen de comisiones en lenguaje llano
   (`concepto_tarifa.nombre_comercial` y `descripcion_usuario`), **con impuestos
   incluidos** cuando `precio_incluye_impuesto=true`.
3. El usuario acepta. **En la misma transacción** se escribe
   [[aceptacion_contrato]] con: `version_aceptada`, `ip`, `dispositivo_id`,
   `token_firma_id` y `hash_evidencia` (hash del documento + datos del acto).
4. Se registra [[consentimiento]] por finalidad (tratamiento de datos,
   comunicaciones comerciales) de forma separada del contrato.
5. Se emite [[evento_dominio]] `CONTRATO_ACEPTADO`.

## Flujos alternativos

| # | Situación | Resultado |
| :-: | --- | --- |
| 1a | No hay contrato vigente registrado | **No se puede operar**: la apertura se detiene (`R-CON-06`) |
| 3a | El usuario rechaza | No se abre cuenta; queda constancia del rechazo en bitácora |
| — | Se publica una versión nueva del contrato | Se solicita nueva aceptación; la anterior **no se borra** y sigue rigiendo los actos pasados |
| — | Cambia el tarifario | Ver [[CU-34 Publicar un tarifario nuevo con preaviso]]: exige preaviso y, según el caso, derecho a rescindir sin costo |

## Postcondiciones

- Existe una aceptación por (usuario, contrato, versión), con evidencia verificable.
- El usuario puede reimprimir en cualquier momento la versión que aceptó.

## Restricciones aplicables

`R-CON-06` · `R-CON-07` · `R-TAR-12` · `R-AUD-08`

## Evidencia que deja

[[aceptacion_contrato]] · [[contrato_adhesion]] · [[consentimiento]] ·
[[documento_publicado]] · [[bitacora_evento]]

## Criterios de aceptación

```gherkin
Dado un contrato de adhesión vigente en versión 3
Cuando el usuario acepta
Entonces existe aceptacion_contrato con version_aceptada = 3 y hash_evidencia no nulo

Dado que no existe contrato de adhesión vigente
Cuando un usuario intenta abrir cuenta
Entonces la apertura se rechaza

Dado un usuario que aceptó la versión 3
Cuando se publica la versión 4
Entonces se le solicita nueva aceptación
Y la aceptación de la versión 3 sigue existiendo
```

## Ver también

[[CU-01 Registro y apertura de billetera]] · [[CU-34 Publicar un tarifario nuevo con preaviso]] · [[Cumplimiento]]
