---
name: dinero-decimal
description: "Manejar importes en AportaYa: tipo Dinero, decimal.js, numeric como string, redondeo, moneda, serialización y pruebas de cuadre. Úsala siempre que el código toque un monto, saldo, comisión, impuesto, deuda o total, en backend, app o backoffice. Es la regla que hace segura la elección de TypeScript."
---

# Dinero y decimales

JavaScript no tiene decimal nativo. En un sistema con partida doble eso no es un
detalle de estilo: es la diferencia entre un libro exacto y uno aproximado. Esta
skill es cómo se paga ese costo ([[ADR-005 Dinero y decimales]]).

> **Un importe nunca es `number`.** Nace como *string* desde la base, vive como
> `Dinero` en el dominio y viaja como *string* por la API.

## Las tres reglas

### 1 · El driver devuelve *string*

Se configura **una sola vez**, al crear el pool. Si esto falta, todo lo demás es
decorativo.

```ts
import { types } from 'pg'
types.setTypeParser(1700, (v) => v)   // numeric  → string
types.setTypeParser(20,   (v) => v)   // int8     → string
```

### 2 · `Dinero` en el dominio, con moneda

Monto y moneda viajan juntos, como en el modelo. Operar dos monedas distintas lanza.

```ts
const cuota   = Dinero.de('150.00', 'BOB')
const recargo = Dinero.de('7.50', 'BOB')
const total   = cuota.mas(recargo)            // 157.50 BOB
cuota.mas(Dinero.de('10.00', 'USD'))          // ⇒ error, no conversión silenciosa
```

Nada de `+`, `-`, `*`, `/` sobre importes. Nunca `parseFloat`, nunca `Number()`.

### 3 · Lint que lo impide

La regla del repo prohíbe `number` en cualquier tipo, campo o parámetro cuyo nombre
denote dinero: `monto`, `importe`, `saldo`, `comision`, `impuesto`, `total`, `deuda`,
`aporte`, `cuota`, `recargo`, `mora`. Un `eslint-disable` sobre esta regla se rechaza
en revisión.

## Redondeo

- **Una sola vez**, al cerrar el cálculo, nunca en un paso intermedio.
- La regla la fija el tarifario ([[concepto_tarifa]]), no el criterio de quien
  programa.
- Explícito y visible: `.redondear(2, reglaDelTarifario)`.
- Cuando un total se reparte entre varios (prorrateo de una deducción, división de
  una bolsa), **el residuo se asigna deliberadamente**: se define a quién le toca el
  centavo y se prueba que la suma de las partes es igual al total.

## Serialización

| Frontera | Forma |
| --- | --- |
| Base ⇄ backend | `numeric` ⇄ *string* |
| Backend ⇄ cliente | `{"monto": "150.00", "moneda": "BOB"}` |
| Contrato Zod | `z.string().regex(/^-?\d+\.\d{2}$/)` + `z.enum(['BOB','USD'])` |
| Vista | El átomo `Monto` formatea; **nunca** calcula |

El cliente **no recalcula** una comisión ni un total para mostrarlo: pide el valor
cotizado (CU-30) o lo recibe con la respuesta. Si lo recalcula, tarde o temprano
muestra algo distinto de lo que la base guardó.

## En la base

- `DECIMAL(14,2)`, o `16,2` para acumulados, **siempre** con `moneda CHAR(3)`.
- Los agregados y cuadres se hacen en SQL, con `numeric`: es exacto y es más rápido
  que traer diez mil filas al proceso.
- El saldo **no se guarda**: se deriva de movimientos ([[transaccion_billetera]]). La
  caché de saldo se sincroniza dentro de la misma transacción, nunca por fuera.

## Errores que ya conocemos

| Error | Cómo se ve | Consecuencia |
| --- | --- | --- |
| Dejar el parser por defecto | `SELECT monto` devuelve `150.1` | Pérdida de precisión invisible |
| `JSON.parse` de una respuesta con importes numéricos | El *string* vuelve a `number` | Descuadre en el exportador o en el PDF |
| Redondear en cada paso | `.redondear()` en tres funciones | Diferencias de centavos que no cierran contra el banco |
| Sumar sin mirar la moneda | `bob.mas(usd)` sin validación | Consolidado sin sentido |
| Porcentajes con dos decimales | `0.07` para 7,25 % | Comisión mal devengada |
| Formatear a mano en la vista | `monto.toFixed(2)` | Muestra distinto de lo guardado |

## Pruebas obligatorias

- [ ] **Cuadre**: la suma de los movimientos de una transacción es exactamente `0.00`.
- [ ] **Asiento equilibrado**: débitos = créditos, verificado en SQL.
- [ ] **Propiedad**: mil operaciones aleatorias mantienen el cuadre exacto.
- [ ] **Prorrateo**: la suma de las partes es igual al total, con residuo asignado.
- [ ] **Moneda**: operar monedas distintas lanza.
- [ ] **Frontera**: lo que devuelve la API es *string* con dos decimales.

## Ver también

`contabilidad-partida-doble` · `facturacion-sin` · `implementar-desde-boveda` · `datos-kysely` · `contratos-api` · `pruebas-cu` ·
`docs/Arquitectura/ADR-005 Dinero y decimales.md`
