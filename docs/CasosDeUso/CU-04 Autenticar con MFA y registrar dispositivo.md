---
tags:
  - caso-uso
  - modulo/01-identidad-usuarios-y-seguridad
codigo: CU-04
criticidad: alta
actores: [Usuario, Sistema]
normas: [ASFI Seguridad de la Información, ISO/IEC 27001 A.5.15-A.5.18]
---

# CU-04 — Autenticar con MFA y registrar dispositivo

> **Objetivo.** Que cada acceso y cada operación sensible quede atada a una
> persona, un dispositivo y un factor, de forma que "yo no hice esa operación"
> tenga respuesta.

## Actores y disparador

- **Actor principal:** usuario.
- **Disparadores:** inicio de sesión; operación que supera
  `politica_billetera.requiere_mfa_desde`; alta de instrumento de fondeo; cambio
  de credencial.

## Precondiciones

1. El usuario existe y no tiene [[bloqueo_cuenta]] vigente.

## Flujo principal

1. Se registra el intento en [[intento_autenticacion]] **antes** de conocer el
   resultado (así los fallidos también quedan).
2. Se valida la credencial contra [[credencial_acceso]] (hash con *pepper*, nunca
   la contraseña en claro).
3. Se identifica el [[dispositivo]] por huella; si es nuevo, se marca
   `es_confiable=false` y se exige factor adicional.
4. Se emite un desafío al [[factor_mfa]] activo; el código viaja como
   [[token_verificacion]] regido por su [[politica_token]] (vigencia, intentos
   máximos, longitud). Cada validación fallida se registra en
   [[intento_validacion_token]].
5. Verificado el factor, se abre [[sesion]] con IP, agente y expiración.
6. Para operaciones sensibles se repite el desafío y se guarda la referencia del
   factor usado en la operación (por ejemplo `orden_retiro.mfa_verificado`).

## Flujos alternativos

| # | Situación | Resultado |
| :-: | --- | --- |
| 2a | N intentos fallidos consecutivos | Se crea [[bloqueo_cuenta]] con motivo y vencimiento; se notifica al titular |
| 4a | Fuerza bruta sobre el token | La política corta por `intentos_maximos`; se emite alerta de seguridad |
| 3a | Dispositivo nuevo + retiro inmediato | [[evaluacion_antifraude]] eleva el puntaje y puede exigir revisión manual (`R-BIL-09`) |
| 5a | Sesión expirada o revocada | Toda operación en curso se rechaza; no hay continuidad silenciosa |

## Postcondiciones

- Toda operación sensible tiene sesión, dispositivo y factor identificables.
- Los intentos fallidos son analizables sin depender de logs de aplicación.

## Restricciones aplicables

`R-SEG-01` · `R-SEG-02` · `R-BIL-09` · `R-AUD-02`

## Evidencia que deja

[[intento_autenticacion]] · [[sesion]] · [[dispositivo]] · [[factor_mfa]] ·
[[token_verificacion]] · [[intento_validacion_token]] · [[bitacora_evento]]

## Criterios de aceptación

```gherkin
Dado un usuario con MFA activo
Cuando inicia sesión desde un dispositivo desconocido
Entonces se le exige un factor adicional
Y queda registrado el dispositivo con es_confiable = false

Dado un retiro que supera el umbral de MFA
Cuando el usuario no completa el desafío
Entonces la orden_retiro no se crea

Dado cinco intentos fallidos consecutivos
Cuando ocurre el sexto
Entonces existe un bloqueo_cuenta vigente para ese usuario
```

## Ver también

[[CU-11 Retirar saldo]] · [[CU-55 Gestionar un incidente de seguridad]] · [[Restricciones]]
