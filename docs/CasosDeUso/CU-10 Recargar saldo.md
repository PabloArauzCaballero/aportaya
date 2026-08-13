---
tags:
  - caso-uso
  - modulo/10-billetera-custodia-y-dinero-electronico
codigo: CU-10
criticidad: alta
actores: [Usuario, Proveedor de pago, Punto de atención]
normas: [BCB RD 079/2022, UIF art. 52 inc. i, encaje 100%]
---

# CU-10 — Recargar saldo (cash-in)

> **Objetivo.** Que el dinero entre a la billetera **solo cuando el banco lo
> confirmó**, una sola vez, y que el mismo importe entre a la cuenta de custodia.

## Actores y disparador

- **Actor principal:** usuario.
- **Actores secundarios:** proveedor de pago / banco; punto de atención si es
  efectivo.
- **Disparador:** el usuario elige recargar, o deposita en un punto de atención.

## Precondiciones

1. [[cuenta_billetera]] en estado `ACTIVA` (o `LIMITADA`: recargar siempre está
   permitido porque aumenta la cobertura).
2. [[instrumento_fondeo]] verificado y con `titular_coincide=true`, salvo pago por
   QR de un tercero identificado.
3. La operación pasa [[CU-40 Evaluar límites antes de una operación]] contra
   `SALDO_MAXIMO` del nivel.

## Flujo principal

1. Se crea [[orden_recarga]] con `clave_idempotencia`, `monto_bruto`, `moneda`,
   proveedor y `expira_en`. Estado `PENDIENTE`.
2. Se genera el medio de cobro ([[qr_cobro]] o redirección al proveedor).
3. El proveedor confirma por [[webhook_pasarela]]. **Se valida firma e
   idempotencia antes de tocar saldo.**
4. **En una sola transacción**:
   - se crea [[pago]] conciliable y se enlaza a la orden;
   - se crea [[transaccion_billetera]] `tipo='RECARGA'` con su
     `clave_idempotencia`;
   - se escriben dos [[movimiento_billetera]]: crédito a la cuenta del usuario y
     débito a la cuenta técnica `PUENTE_CUSTODIA` (suma cero, `R-BIL-01`);
   - se actualiza `consumo_limite`;
   - se genera el [[asiento_contable]] espejo ([[CU-24 Registrar el asiento contable de una operación]]);
   - se emite [[evento_dominio]] `RECARGA_ACREDITADA`.
5. El motor de umbrales evalúa la operación → [[CU-41 Detectar umbral y registrar formulario PCC-01]]
   (carga de billetera acumulada) y [[CU-42 Detectar umbral y registrar ROG]].
6. Cuando el dinero llega efectivamente al banco, se registra
   [[movimiento_custodia]] y se concilia en [[CU-50 Conciliar la custodia y verificar el encaje]].

## Flujos alternativos

| # | Situación | Resultado |
| :-: | --- | --- |
| 3a | Webhook repetido (misma `clave_idempotencia`) | Se responde 200 sin efecto: **no se acredita dos veces** (`R-BIL-06`) |
| 3b | Firma inválida | Se descarta y se registra el intento; alerta de seguridad |
| 3c | La orden expiró | `estado='EXPIRADA'`; si el dinero igual llegó, va a `SUSPENSO_NO_IDENTIFICADO` y se investiga |
| 4a | Falla a mitad de la escritura | La transacción entera revierte: no existe saldo sin contrapartida |
| 5a | Supera el umbral de la UIF | La acreditación **no se bloquea**, pero se exige el formulario y queda registrado |
| — | El pago excede `SALDO_MAXIMO` del nivel | Se acredita hasta el tope o se rechaza según política, y se ofrece [[CU-02 Elevar nivel de debida diligencia]] |

## Postcondiciones

- El saldo del usuario aumentó exactamente en `monto_acreditado`.
- Existe contrapartida contable y de custodia por el mismo importe.

## Restricciones aplicables

`R-BIL-01` · `R-BIL-02` · `R-BIL-06` · `R-BIL-10` · `R-LIM-01` · `R-LIM-02` ·
`R-AUD-01` · `R-AUD-03` · `R-AUD-05` · `R-UIF-02`

## Evidencia que deja

[[orden_recarga]] · [[pago]] · [[webhook_pasarela]] · [[transaccion_billetera]] ·
[[movimiento_billetera]] · [[asiento_contable]] · [[movimiento_custodia]] ·
[[registro_operacion_relevante]] (si aplica)

## Criterios de aceptación

```gherkin
Dado un webhook de acreditación válido
Cuando se procesa por primera vez
Entonces el saldo_disponible aumenta en monto_acreditado
Y existen exactamente dos movimiento_billetera que suman cero

Dado el mismo webhook reenviado tres veces
Cuando se procesan
Entonces existe una sola transaccion_billetera
Y el saldo no cambia después del primer procesamiento

Dado que el usuario acumula USD 1.000 en cargas en 3 días calendario
Cuando se acredita la última
Entonces existe un registro_operacion_relevante con formulario PCC-01
```

## Ver también

[[CU-11 Retirar saldo]] · [[CU-40 Evaluar límites antes de una operación]] · [[CU-50 Conciliar la custodia y verificar el encaje]]
