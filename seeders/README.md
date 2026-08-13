# Seeders

Los datos de carga inicial, en JSON, separados en dos conjuntos con destinos
distintos:

```
seeders/
├── minimos/     catálogos sin los cuales el sistema NO opera. Van también a producción.
└── prueba/      datos de demostración para desarrollo y QA. Nunca a producción.
```

Los JSON son **la fuente de verdad**. El SQL de `sql/60_semillas/` y
`sql/61_prueba/` es un derivado:

```bash
python3 scripts/generar_semillas.py
```

## Por qué dos conjuntos

Con los catálogos vacíos el sistema no opera: la regla de *denegar por omisión*
rechaza toda operación sin límite configurado, sin tarifario y sin licencia
(`R-LIM-01`, `R-LIC-01`). Eso significa que **los mínimos no son opcionales**:
son parte del despliegue, igual que el esquema.

Los datos de prueba son lo contrario: existen para poder ejercitar los flujos en
local y en QA, y no deben tocar producción jamás.

## `minimos/` — también en producción

| Archivo | Carga | Estado |
| --- | --- | --- |
| `01-plan-de-cuentas.json` | 19 cuentas contables | listo |
| `02-politicas.json` | billetera, redondeo, mora y cobertura | revisar con riesgos |
| `03-limites-operativos.json` | 40 límites por nivel de debida diligencia | ⚠ **PROVISIONAL** |
| `04-tarifario.json` | hechos generadores, tarifario v1 y sus conceptos | decisión comercial |
| `05-impuestos.json` | IVA e IT | ⚠ confirmar con tributaria |
| `06-umbrales-uif.json` | 18 umbrales de los arts. 52 y 53 del instructivo vigente | ⚠ confirmar vigencia |
| `07-reportes-regulatorios.json` | calendario de 10 reportes obligatorios | ⚠ confirmar plazos |
| `08-gobierno-y-licencia.json` | licencia, comités, puntos de reclamo, matriz de riesgo, tipologías | listo |
| `09-reglas-operativas.json` | 8 reglas de entrega y 5 antifraude | revisar con riesgos |
| `10-roles-y-permisos.json` | 12 roles y 16 permisos | listo |
| `11-contratos-de-adhesion.json` | 4 contratos en borrador | redactar y registrar ante ASFI |

Cada archivo lleva su propio campo `estado`, `advertencia` o `revisar_con`: los
valores marcados **PROVISIONAL** no deben usarse en producción sin confirmación
legal, y cada fila tiene su columna `base_normativa` esperando la cita exacta.

> [!warning] La licencia se siembra `EN_TRAMITE` a propósito
> Es el estado real mientras no exista resolución de ASFI. Con ese estado
> `fn_lic_servicio_habilitado()` devuelve `false` y **ningún servicio financiero
> se habilita**. El archivo trae, en el campo `al_otorgarse_la_licencia`, el
> `UPDATE` que corresponde cuando se otorgue.

## `prueba/` — solo desarrollo y QA

| Archivo | Carga |
| --- | --- |
| `01-entorno-tecnico.json` | tipo de cambio, cuentas técnicas de plataforma y cuenta de custodia |
| `02-usuarios-y-billeteras.json` | 6 personas con identidad, KYC, debida diligencia, perfil, contrato aceptado y billetera |
| `03-grupo-demo.json` | organizador, grupo de 6 cupos con Bs 500 mensuales, 6 períodos y turnos, tarifa congelada y las obligaciones del primer período |
| `04-fondo-y-cuenta-del-grupo.json` | fondo de garantía y la cuenta de billetera del grupo |

El set está armado para poder probar reglas concretas: `USR000001` es persona
expuesta políticamente, así que su debida diligencia es `REFORZADA` y tiene
segunda revisión independiente (`R-UIF-10`); la cuenta del grupo tiene al grupo
como titular y no al organizador (`R-GRP-04`).

## Formato

```json
{
  "descripcion": "Para qué sirve este archivo",
  "entorno": "minimo",
  "bloques": [
    {
      "tabla": "cuenta_contable",
      "conflicto": ["codigo"],
      "comentario": "opcional, se emite como comentario SQL",
      "filas": [ { "codigo": "1.1.01", "nombre": "…" } ]
    }
  ]
}
```

| Clave del bloque | Efecto |
| --- | --- |
| `conflicto: ["col"]` | `ON CONFLICT (col) DO NOTHING` |
| `conflicto: []` | `ON CONFLICT DO NOTHING` |
| `conflicto: "ninguno"` | sin cláusula |
| `solo_si_vacia: true` | solo inserta si la tabla está vacía (para tablas sin clave natural) |
| `sql: "UPDATE …"` | bloque de SQL suelto, sin `tabla` |

Valores especiales dentro de una fila:

| Valor | Se traduce a |
| --- | --- |
| `{"$ref": "tarifario", "codigo": "GENERAL", "version": 1}` | `(SELECT id FROM tarifario WHERE codigo=… AND version=…)` |
| `{"$sql": "now()"}` | se emite tal cual |
| `{"$fecha": "30 days"}` | `(current_date + interval '30 days')` |
| objetos y listas comunes | literal `jsonb` |

Las referencias pueden anidarse: `{"$ref":"participante","grupo_id":{"$ref":"grupo",...}}`.

## Aplicar

```bash
# 1) esquema
psql -d pasanaku -v ON_ERROR_STOP=1 -f sql/aplicar.sql
# 2) catálogos (también en producción)
psql -d pasanaku -v ON_ERROR_STOP=1 -f sql/60_semillas/sembrar.sql
# 3) datos de prueba (nunca en producción)
psql -d pasanaku -v ON_ERROR_STOP=1 -f sql/61_prueba/sembrar_prueba.sql
```

Los mínimos son idempotentes: volver a ejecutarlos no duplica nada.

## Usarlos desde MikroORM

El mismo JSON sirve para un seeder del ORM sin transformarlo: cada bloque es una
tabla y cada fila un objeto. Si se opta por ese camino, hay que resolver los
`$ref` contra el repositorio correspondiente antes de persistir, y respetar el
orden del `manifiesto.json`.
