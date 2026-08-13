---
tags:
  - moc
  - caso-uso
titulo: "Casos de uso — Pasanaku Digital"
total_casos: 40
fecha: 2026-08-11
---

# Casos de uso

> [!abstract] Para qué sirve esta carpeta
> Es **la especificación ejecutable del sistema**: cada caso de uso dice qué pasa,
> en qué orden, contra qué tablas, con qué validaciones y qué evidencia deja. Está
> escrito para que un programador pueda implementarlo sin volver a preguntar, y
> para que un auditor pueda verificar que el flujo cumple la norma que lo obliga.

Los casos de uso enlazan tres cosas que hasta ahora vivían separadas:

```
Norma (docs/Cumplimiento.md)  →  Caso de uso (esta carpeta)  →  Restricción (docs/Restricciones.md)
        qué obliga                    cómo se ejecuta               qué impide violarlo
                                            ↓
                                  Entidades (docs/Modelos/)
```

## Cómo leer un caso de uso

| Sección | Qué contiene |
| --- | --- |
| **Objetivo** | Una línea: qué logra el actor |
| **Actores y disparador** | Quién lo inicia y por qué evento |
| **Precondiciones** | Qué tiene que ser verdad antes de empezar |
| **Flujo principal** | Pasos numerados, con tabla y columna concretas |
| **Flujos alternativos** | Qué pasa cuando algo falla o el caso se bifurca |
| **Postcondiciones** | Estado final garantizado |
| **Restricciones aplicables** | Códigos `R-XXX-nn` de [[Restricciones]] que el motor de base de datos hace cumplir |
| **Evidencia que deja** | Qué filas quedan escritas para poder demostrarlo después |
| **Criterios de aceptación** | Pruebas verificables, en formato dado/cuando/entonces |

## Convenciones

- **Códigos**: `CU-nn`. Nunca se reutilizan ni se renumeran; un caso retirado queda
  marcado como obsoleto pero conserva su código.
- **Transaccionalidad**: cuando un paso dice *"en la misma transacción"*, es
  obligatorio; partirlo introduce estados intermedios inconsistentes con dinero.
- **Idempotencia**: todo caso que mueve dinero recibe `clave_idempotencia` del
  cliente y la valida antes de cualquier escritura.
- **Evento de dominio**: todo caso relevante escribe en [[evento_dominio]] dentro de
  la misma transacción (patrón *outbox*), nunca por fuera.
- **Reloj**: los plazos legales se **calculan al inicio y se guardan**; jamás se
  recalculan al consultar.

## Índice

### Identidad, debida diligencia y contratos

| Código | Caso de uso | Actor | Normativa que lo obliga |
| --- | --- | --- | --- |
| [[CU-01 Registro y apertura de billetera]] | Alta de usuario con debida diligencia simplificada | Usuario | ASFI ETF · UIF DDD |
| [[CU-02 Elevar nivel de debida diligencia]] | Subir de nivel para operar más | Usuario · Analista | UIF EBR · límites BCB |
| [[CU-03 Declaración PEP y beneficiario final]] | Declarar y verificar condición PEP | Usuario · Oficial de cumplimiento | UIF |
| [[CU-04 Autenticar con MFA y registrar dispositivo]] | Acceso seguro y trazable | Usuario | ASFI Seguridad de la Información |
| [[CU-05 Aceptar contrato de adhesión y tarifario]] | Consentimiento con evidencia oponible | Usuario | ASFI Consumidor Financiero |
| [[CU-06 Revisión periódica de conocimiento del cliente]] | Actualizar KYC según riesgo | Sistema · Analista | UIF |
| [[CU-07 Ejercer derechos sobre datos personales]] | Acceso, rectificación y supresión | Titular | Protección de datos |

### Billetera, custodia y saldo

| Código | Caso de uso | Actor | Normativa que lo obliga |
| --- | --- | --- | --- |
| [[CU-10 Recargar saldo]] | Cash-in y acreditación | Usuario | BCB RD 079/2022 · encaje |
| [[CU-11 Retirar saldo]] | Cash-out con MFA y enfriamiento | Usuario | BCB · antifraude |
| [[CU-12 Transferir saldo entre billeteras]] | P2P y aporte al grupo | Usuario | UIF (umbral billetera) |
| [[CU-13 Retener y liberar saldo]] | Reserva de fondos | Sistema | Integridad de saldo |
| [[CU-14 Reversar una transacción]] | Corrección sin edición | Operador · Supervisor | Auditoría · Ley 393 |
| [[CU-15 Emitir extracto y certificado de saldo]] | Entregar información al titular | Usuario | ASFI Consumidor Financiero |
| [[CU-16 Cerrar billetera y devolver saldo]] | Baja con devolución | Usuario | ASFI Consumidor Financiero |
| [[CU-17 Bloquear saldo por orden de autoridad]] | Cumplir un oficio | Autoridad · Legal | UIF · judicial |

### Circuito de dinero del pasanaku

| Código | Caso de uso | Actor | Normativa que lo obliga |
| --- | --- | --- | --- |
| [[CU-20 Crear grupo y congelar tarifario]] | Constituir grupo con precio pactado | Organizador | ASFI transparencia |
| [[CU-21 Cobrar el aporte del período]] | Obligación → pago → conciliación | Participante | ASFI · contabilidad |
| [[CU-22 Liquidar y entregar el fondo]] | Bolsa bruta → deducciones → neto | Sistema · Organizador | ASFI · tributario |
| [[CU-23 Cubrir un incumplimiento con el fondo]] | Cobertura y deuda exigible | Sistema | Contabilidad · debido proceso |
| [[CU-24 Registrar el asiento contable de una operación]] | Doble partida y cierre | Sistema | Ley 393 · plan de cuentas |

### Comisiones, impuestos y facturación

| Código | Caso de uso | Actor | Normativa que lo obliga |
| --- | --- | --- | --- |
| [[CU-30 Cotizar la comisión antes de operar]] | Mostrar el costo final | Usuario | ASFI transparencia |
| [[CU-31 Devengar y cobrar la comisión]] | Ingreso trazable | Sistema | Contabilidad · tributario |
| [[CU-32 Emitir factura electrónica]] | Documento fiscal con CUF | Sistema | SIN facturación en línea |
| [[CU-33 Devolver comisión y emitir nota de crédito]] | Reparar un cobro indebido | Soporte · Supervisor | SIN · ASFI reclamos |
| [[CU-34 Publicar un tarifario nuevo con preaviso]] | Cambio de precios conforme | Producto · Directorio | ASFI Consumidor Financiero |
| [[CU-35 Cerrar la liquidación mensual de ingresos]] | Resultado y conciliación | Contabilidad | Contabilidad · tributario |

### Cumplimiento UIF y ASFI

| Código | Caso de uso | Actor | Normativa que lo obliga |
| --- | --- | --- | --- |
| [[CU-40 Evaluar límites antes de una operación]] | Techo por nivel de diligencia | Sistema | BCB · UIF EBR |
| [[CU-41 Detectar umbral y registrar formulario PCC-01]] | Declaración de origen y destino | Sistema · Usuario | UIF art. 52 |
| [[CU-42 Detectar umbral y registrar ROG]] | Reporte de operaciones generales | Sistema | UIF art. 53 |
| [[CU-43 Remitir los reportes mensuales a la UIF]] | Envío hasta el día 15, incluso en cero | Oficial de cumplimiento | UIF |
| [[CU-44 De alerta de monitoreo a reporte de operación sospechosa]] | Investigar y decidir | Analista · Oficial | UIF |
| [[CU-45 Atender un requerimiento de autoridad]] | Responder oficio en plazo | Legal | UIF · judicial |
| [[CU-46 Verificar el alcance de la licencia]] | No operar fuera de lo autorizado | Sistema | ASFI Res. 540/2025 |

### Operación, control y consumidor financiero

| Código | Caso de uso | Actor | Normativa que lo obliga |
| --- | --- | --- | --- |
| [[CU-50 Conciliar la custodia y verificar el encaje]] | Prueba diaria de respaldo | Sistema · Tesorería | ASFI · BCB |
| [[CU-51 Ejecutar el cierre diario]] | Cuadre de la operación del día | Contabilidad | Contabilidad |
| [[CU-52 Atender un reclamo en plazo]] | 5 días hábiles, prórroga a 10 | Punto de Reclamo | ASFI Libro 4 Título I |
| [[CU-53 Elevar un reclamo a segunda instancia]] | Central de reclamos del supervisor | Cliente · Legal | ASFI |
| [[CU-54 Registrar un evento de riesgo operativo]] | Base de pérdidas y plan de acción | Riesgos | ASFI Libro 3 Título V |
| [[CU-55 Gestionar un incidente de seguridad]] | Contener, reportar y notificar | Seguridad | ASFI Seguridad de la Información |
| [[CU-56 Ejecutar una prueba de continuidad]] | RTO/RPO probados y documentados | TI · Riesgos | ASFI · ISO 22301 |

## Casos de uso todavía no escritos

Estos son de negocio, no de cumplimiento, y quedan pendientes. Se listan para que
la ausencia sea explícita y no se confunda con "no hacen falta":

- Sorteo de turnos con esquema *commit-reveal* y verificación pública (M2).
- Gobernanza del grupo: acuerdos, votación ponderada, permutas y traspasos (M2).
- Reemplazo de participante moroso y disolución anticipada (M8).
- Motor de reputación y bloques de transparencia (M6).
- Notificaciones, plantillas y control de spam (M5).

## Ver también

- [[Cumplimiento]] — qué norma obliga cada cosa
- [[Restricciones]] — qué impide, a nivel de base de datos, que se viole
- [[_Entidades]] · [[_Relaciones]] · [[Index]]
