# Módulo 14 — Publicidad y Campañas

> **Pregunta de negocio que responde este módulo:**
> *¿Puede un partner pagar para que la app le muestre publicidad a los
> usuarios, con la misma seriedad con la que cobra un aporte — sin abrir un
> segundo sistema de facturación ni convertir a un organizador en vendedor de
> su propio grupo?*

Este módulo es enteramente nuevo: no existía ninguna entidad de publicidad en
el modelo. `campana_promocional` (módulo 11) es algo distinto — un descuento
de comisión que la plataforma le da a un usuario — y no se toca ni se
confunde con esto.

El diseño fusiona dos referencias de industria porque resuelven problemas
distintos:

- **PedidosYa / Yango Ads** — inventario de espacios *propios* de la app:
  banner de inicio, listado destacado, notificación patrocinada. Es la parte
  "dónde se muestra".
- **Meta Ads** — la jerarquía cuenta → campaña → conjunto de anuncios →
  anuncio, con segmentación de audiencia y puja por conjunto. Es la parte
  "a quién se le muestra, cuánto se paga y cómo se reparte el presupuesto".

## Quién anuncia: `anunciante`

> [!important] RN-18 no se toca
> El módulo 07 establece que el organizador **nunca** percibe un ingreso por
> administrar (`07_organizador_automatizacion.md`). Este módulo lo respeta al
> pie de la letra: **un anunciante siempre paga, nunca cobra.** Cuando el
> anunciante es un organizador promocionando su propio grupo, el gasto es
> suyo — como cualquier otro gasto operativo — y no existe ninguna columna en
> todo el módulo que represente un ingreso o reparto hacia él.

Los anunciantes se decidieron como una categoría **unificada** (`anunciante`)
en vez de dos módulos separados, porque el negocio los trata igual: ambos
contratan el mismo servicio, con la misma cuenta publicitaria, la misma
jerarquía de campaña y la misma facturación.

- **`socio_comercial`** — un negocio externo (una marca, un comercio) que no
  tiene rol operativo en la plataforma. No es `usuario` ni `organizador`: es
  alguien que quiere visibilidad ante la base de usuarios de AportaYa sin
  participar de ningún pasanaku.
- **`anunciante`** — la entidad que efectivamente contrata: `tipo` decide si
  el anunciante es un `organizador` existente (M07) o un `socio_comercial`
  nuevo, con un CHECK que exige exactamente una de las dos referencias según
  el tipo. Todo lo demás del módulo (cuenta publicitaria, campaña, factura)
  cuelga de `anunciante`, no de `organizador` ni de `socio_comercial`
  directamente — así el resto del modelo no necesita saber si detrás hay un
  organizador o un tercero.

**Por qué debe existir esta unificación y no dos módulos paralelos**: sin
`anunciante`, cada tabla de campaña necesitaría dos FK opcionales (una a
organizador, otra a socio comercial) repetidas en cada entidad de la cadena.
Con `anunciante` como punto único, el resto del módulo es agnóstico a quién
hay detrás.

## Cuenta y campaña publicitaria

| Tabla | Qué es |
| --- | --- |
| `cuenta_publicitaria` | La cuenta de facturación de un anunciante: límite de gasto mensual, saldo consumido, estado. |
| `campana_publicitaria` | Objetivo, presupuesto total y vigencia de una campaña. |

**Para qué sirve (negocio)**: separa "quién es el anunciante" de "cuánto está
gastando y en qué". Un mismo anunciante puede tener varias campañas activas
(una para captar postulantes a su grupo, otra para descargas de la app) y el
límite de gasto se controla a nivel de cuenta, no de campaña, para que el
anunciante no pueda desbordar su presupuesto abriendo campañas nuevas.

**A nivel de sistema**: `campana_publicitaria.estado` incluye `EN_REVISION`:
una campaña no pasa a `ACTIVA` sola. Igual que las piezas creativas (más
abajo), la aprobación es un paso explícito con `aprobada_por`.

## Segmentación e inventario

| Tabla | Qué es |
| --- | --- |
| `segmento_audiencia` | Un criterio de targeting reutilizable (ubicación, nivel de KYC, actividad en grupos, etc.). |
| `espacio_publicitario` | El catálogo de inventario propio de la app: dónde puede aparecer un anuncio. |
| `conjunto_anuncios` | Une una campaña con un segmento, un espacio y un presupuesto/puja concretos — el equivalente al *ad set* de Meta. |

**Por qué debe existir `espacio_publicitario` como catálogo y no como texto
libre**: el inventario de una app financiera es limitado y sensible — no se
puede poner un banner de un tercero en medio del flujo de pago. Tener el
inventario como catálogo con `capacidad_maxima_simultanea` permite controlar
cuántos anuncios compiten por el mismo espacio a la vez, y qué espacios
existen es una decisión de producto, no algo que cualquier anunciante
inventa.

**A nivel de sistema**: `conjunto_anuncios.presupuesto_diario` y
`puja_maxima` acotan el gasto sin necesitar una tabla de subasta separada — el
conjunto pasa a `AGOTADO` cuando el worker de entrega (fase 9) detecta que
alcanzó su presupuesto del día. Es deliberadamente más simple que una subasta
en tiempo real completa: el inventario de esta app es chico comparado con
Meta, y una subasta de segundo precio sería complejidad sin beneficio hoy.

## Creatividad y moderación

| Tabla | Qué es |
| --- | --- |
| `pieza_creativa` | La imagen/texto/video concreto de un anuncio. |
| `revision_creativa` | La aprobación o rechazo de una pieza, con motivo. |
| `anuncio` | Une un conjunto de anuncios con una pieza creativa aprobada. |

> [!important] Moderación previa, no posterior
> Ninguna `pieza_creativa` llega a `anuncio` sin pasar por una
> `revision_creativa` con `decision = APROBADA`. No existe un camino donde un
> anunciante publique directamente y alguien lo baje después si resulta
> problemático — el mismo principio de "revisar antes de exponer" que ya
> aplica en otros lugares del sistema donde algo se muestra a terceros.

**Por qué debe existir por separado de `anuncio`**: una pieza creativa puede
reutilizarse en varios `anuncio` (la misma imagen en distintos conjuntos), y
puede volver a revisión si el anunciante la reemplaza. Fusionarla con
`anuncio` obligaría a re-moderar y a duplicar el archivo cada vez que se
reutiliza.

## Entrega y facturación

| Tabla | Qué es |
| --- | --- |
| `impresion_anuncio` | Un evento de exhibición. |
| `clic_anuncio` | Un evento de clic, derivado de una impresión. |
| `conversion_anuncio` | Un resultado atribuido (postulación a un grupo, registro, descarga). |
| `factura_publicidad` | La liquidación periódica de gasto de una cuenta publicitaria. |

**Por qué son de alto volumen y qué se hizo al respecto**: `impresion_anuncio`
y `clic_anuncio` pueden crecer mucho más rápido que cualquier otra tabla del
sistema. Se marcaron `APPEND_ONLY` desde ya. **No** se particionaron por fecha
todavía porque `conversion_anuncio` las referencia por FK, y este modelo solo
particiona tablas que nadie referencia (ver `scripts/modelo.py`,
`PARTICIONADAS`, y la nota de `bitacora_evento`/`notificacion` sobre el mismo
trade-off). Cuando el volumen lo justifique, la migración es mover esas FK a
clave compuesta antes de particionar — está declarado como riesgo en el plan
de implementación, no ignorado.

**Cómo se factura, sin inventar un tercer libro**:

```
factura_publicidad → cuenta_por_cobrar (M13) → cobro_cuenta_por_cobrar → asiento_contable (M3)
                   ↘ factura_electronica (M11, comprobante fiscal)
```

`factura_publicidad` es la liquidación de **origen** — cuánto gastó una
cuenta publicitaria en un período — y dispara dos caminos que ya existen:
`factura_electronica` (M11) para el comprobante fiscal ante el SIN, y
`cuenta_por_cobrar` (M13) para el seguimiento de cobro. No hay un tercer
sistema de facturación paralelo: publicidad reutiliza lo que la empresa ya
tiene para cobrarle a alguien que no es un participante del pasanaku.

## Qué decisiones de diseño se descartaron

- **No se creó una tabla de subasta en tiempo real.** El inventario de espacios
  es chico y controlado; presupuesto diario + puja máxima por conjunto alcanza.
- **No se le dio a `organizador` una cuenta publicitaria implícita.** Un
  organizador que quiere anunciar pasa por el mismo alta de `anunciante` que
  un socio comercial — no hay atajo que lo trate distinto ni lo exima de
  moderación de creativos.
- **No se fusionó con `campana_promocional` (M11).** Resuelven problemas
  distintos: M11 es un descuento de comisión al usuario; M14 es publicidad
  paga que un tercero le muestra a los usuarios. Fusionarlas mezclaría un
  costo (M14, alguien le paga a la plataforma) con un ingreso cedido (M11, la
  plataforma deja de cobrar algo).

## Ver también

- Skills: `boveda-modelo`, `debido-proceso` (moderación de creativos),
  `facturacion-sin`, `contabilidad-partida-doble`.
- [[07_organizador_automatizacion|Módulo 07]] — RN-18, por qué el organizador
  nunca es beneficiario de un ingreso.
- [[13_contabilidad_erp|Módulo 13]] — `cuenta_por_cobrar`, destino de
  `factura_publicidad`.
- [[11_tarifas_comisiones|Módulo 11]] — `factura_electronica`, comprobante
  fiscal reutilizado; `campana_promocional`, con quien no debe confundirse.
