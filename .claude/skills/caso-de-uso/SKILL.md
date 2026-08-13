---
name: caso-de-uso
description: "Escribir o modificar un caso de uso de Pasanaku en docs/CasosDeUso/. Úsala cuando haya que especificar un flujo nuevo (registro, pago, entrega, reporte, reclamo), cambiar uno existente, o cuando alguien pida 'cómo debería funcionar X' antes de programarlo. Incluye la plantilla obligatoria, la numeración, las reglas de transaccionalidad e idempotencia y los criterios de aceptación."
---

# Escribir un caso de uso

Los casos de uso son **la especificación ejecutable**: un programador debe poder
implementar el flujo sin volver a preguntar, y un auditor debe poder verificar que
cumple la norma que lo obliga.

```
Norma (docs/Cumplimiento.md) → Caso de uso (docs/CasosDeUso/) → Restricción (docs/Restricciones.md)
      qué obliga                     cómo se ejecuta                 qué impide violarlo
```

## Numeración

| Rango | Área |
| --- | --- |
| CU-01..09 | Identidad, debida diligencia y contratos |
| CU-10..19 | Billetera, custodia y saldo |
| CU-20..29 | Circuito de dinero del pasanaku |
| CU-30..39 | Comisiones, impuestos y facturación |
| CU-40..49 | Cumplimiento UIF y ASFI |
| CU-50..59 | Operación, control y consumidor financiero |

**Los códigos no se reutilizan ni se renumeran.** Un caso retirado se marca como
obsoleto y conserva su número.

Nombre de archivo: `CU-NN Título en minúsculas.md` — el título es exactamente el
texto con el que se lo enlaza desde `_CasosDeUso.md`.

## Plantilla obligatoria

```markdown
---
tags:
  - caso-uso
  - modulo/NN-slug-del-modulo
codigo: CU-NN
criticidad: alta | media | baja
actores: [..]
normas: [..]
---

# CU-NN — Título

> **Objetivo.** Una o dos líneas: qué logra el actor y por qué importa.

## Actores y disparador
## Precondiciones          ← numeradas, verificables
## Flujo principal         ← pasos numerados, con tabla.columna concretas
## Flujos alternativos     ← tabla: # | Situación | Resultado
## Postcondiciones
## Restricciones aplicables ← códigos R-XXX-nn de [[Restricciones]]
## Evidencia que deja      ← qué filas quedan escritas
## Criterios de aceptación ← bloque ```gherkin
## Ver también
```

## Reglas de escritura

1. **Nombrar tablas y columnas reales**, enlazadas con `[[wikilinks]]`. "Se guarda
   el pago" no sirve; "se crea [[pago]] y se enlaza a la orden" sí.
2. **Marcar la transaccionalidad.** Cuando varias escrituras deben ser atómicas,
   escribir literalmente *"en la misma transacción"*. Es la instrucción más
   importante del documento.
3. **Idempotencia explícita** en todo flujo con dinero: qué `clave_idempotencia`
   se usa y qué pasa con el reintento.
4. **Los plazos se calculan al inicio y se guardan.** Si el flujo tiene un plazo
   legal, decir en qué columna queda.
5. **Los flujos alternativos son la mitad del valor.** Webhook duplicado, timeout
   del proveedor, saldo insuficiente, plazo vencido, autoridad de por medio.
   Un caso sin alternativos es una lista de deseos.
6. **Evento de dominio**: todo caso relevante escribe en [[evento_dominio]] dentro
   de la misma transacción (patrón *outbox*), nunca por fuera.
7. **Criterios de aceptación en Gherkin**, incluyendo al menos un caso feliz, uno
   de rechazo por restricción y uno de reintento o borde.

## Checklist antes de dar por terminado

- [ ] Está en el índice `docs/CasosDeUso/_CasosDeUso.md` (tabla del área correcta).
- [ ] Todos los `[[enlaces]]` resuelven (correr la verificación de la skill `boveda-modelo`).
- [ ] Cada restricción citada existe en `docs/Restricciones.md`; si no, se agrega
      con la skill `restriccion`.
- [ ] Si el caso nace de una norma, la fila correspondiente de
      `docs/Cumplimiento.md` lo referencia.
- [ ] Las entidades que menciona existen en el modelo; si falta alguna, se agrega
      con la skill `boveda-modelo` **antes** de terminar el caso.

## Errores frecuentes

- Describir la interfaz en vez del flujo de datos.
- Omitir qué pasa si el proveedor externo no responde.
- Decir "se valida que…" sin decir **quién** valida: aplicación o base de datos.
  Si la regla protege dinero o cumplimiento, va también en la base.
- Inventar nombres de tabla que no existen en `docs/Modelos/Entidades/`.
