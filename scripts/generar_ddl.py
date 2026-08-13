#!/usr/bin/env python3
"""
Genera el esquema SQL completo a partir de los diagramas PlantUML.

    python3 scripts/generar_ddl.py        (desde la raíz del repositorio)

Salida (todo generado, nada escrito a mano):

    sql/00_base/…                extensiones, esquema y roles
    sql/10_tablas/<modulo>/<tabla>.sql    un archivo por tabla
    sql/20_claves/<modulo>.sql            claves foráneas del módulo
    sql/30_indices/<modulo>.sql           índices y únicos del módulo
    sql/aplicar.sql                       orquestador en orden

Las claves foráneas van en una pasada aparte porque el modelo tiene referencias
circulares entre módulos: primero existen todas las tablas, después las
relaciones. Ese orden es además el que necesita la introspección de MikroORM.

Los enumerados de cada columna `<<CK>>` se derivan de los diagramas de clases
(bloques `enum` y anotaciones `<<A | B | C>>`). Si alguna columna queda sin
valores, el script la reporta como PENDIENTE y termina con código 1: el objetivo
es que no queden pendientes a nivel de datos.
"""

import re
import pathlib
import shutil
import sys
from collections import defaultdict

sys.path.insert(0, str(pathlib.Path(__file__).parent))
from modelo import (MODULOS, FOCO, APPEND_ONLY, cargar, resolver_fk,  # noqa: E402
                    clase_de, a_camel)

OUT = pathlib.Path("sql")
MAX_IDENT = 63

# --- columnas derivadas: expresión real de la columna generada ------------
GENERADAS = {
    ("cuenta_billetera", "saldo_total"): "saldo_disponible + saldo_retenido",
    ("evento_riesgo_operativo", "perdida_neta"): "perdida_bruta - recuperacion",
    ("arqueo_punto_atencion", "diferencia"): "saldo_contado - saldo_teorico",
    ("conciliacion_custodia", "diferencia"): "saldo_custodia - saldo_dinero_electronico",
    ("conciliacion_custodia", "ratio_cobertura"):
        "CASE WHEN saldo_dinero_electronico = 0 THEN 1 "
        "ELSE round(saldo_custodia / saldo_dinero_electronico, 6) END",
    ("liquidacion_ingresos", "ingreso_neto"):
        "total_cobrado - total_devuelto - total_impuestos - total_costo_proveedores",
    ("obligacion_aporte", "saldo_pendiente"):
        "monto_esperado + monto_recargo - monto_pagado - monto_condonado "
        "- monto_cubierto_garantia",
}

# --- enumerados que no se pueden derivar del diagrama de clases -----------
SEVERIDAD = ["BAJA", "MEDIA", "ALTA", "CRITICA"]
NIVEL = ["BAJO", "MEDIO", "ALTO"]
PRIORIDAD = ["BAJA", "MEDIA", "ALTA", "URGENTE"]
ORGANISMO = ["ASFI", "UIF", "SIN", "BCB"]
NIVEL_DDD = ["SIMPLIFICADA", "ESTANDAR", "AMPLIADA", "REFORZADA"]
NIVEL_KYC = ["NINGUNO", "BASICO", "INTERMEDIO", "COMPLETO"]
FORMULARIOS_UIF = ["PCC-01", "ROG-01", "ROG-02", "ROG-03", "ROG-04"]
CONCEPTOS_UIF = ["EFECTIVO", "CAMBIO_MONEDA", "GIRO", "REMESA", "CARGA_BILLETERA",
                 "RETIRO_BILLETERA", "TRANSFERENCIA_BILLETERA", "ELECTRONICA",
                 "ACTIVO_VIRTUAL"]
FRECUENCIA = ["CONTINUA", "DIARIA", "SEMANAL", "QUINCENAL", "MENSUAL",
              "BIMESTRAL", "TRIMESTRAL", "SEMESTRAL", "ANUAL"]
ESTADO_FISCAL = ["PENDIENTE", "VALIDADA", "RECHAZADA", "ANULADA", "EMITIDA_OFFLINE"]

VALORES = {
    # --- severidades, niveles y prioridades ---
    ("activo_informacion", "criticidad"): SEVERIDAD,
    ("alerta_cumplimiento", "severidad"): SEVERIDAD,
    ("alerta_monitoreo_lft", "severidad"): SEVERIDAD,
    ("alerta_riesgo", "severidad"): SEVERIDAD,
    ("alerta_temprana", "severidad"): SEVERIDAD,
    ("descuadre_custodia", "severidad"): SEVERIDAD,
    ("desvio_perfil", "severidad"): SEVERIDAD,
    ("hallazgo_auditoria", "severidad"): SEVERIDAD,
    ("incidente_seguridad", "severidad"): SEVERIDAD,
    ("regla_cumplimiento", "severidad"): SEVERIDAD,
    ("regla_monitoreo_lft", "severidad"): SEVERIDAD,
    ("contrato_tercero", "nivel_riesgo"): NIVEL + ["CRITICO"],
    ("evaluacion_riesgo_producto", "nivel_riesgo_lft"): NIVEL,
    ("caso_investigacion_lft", "prioridad"): PRIORIDAD,
    ("ticket_soporte", "prioridad"): PRIORIDAD,

    # --- niveles de conocimiento del cliente ---
    ("limite_operativo_billetera", "nivel_debida_diligencia"): NIVEL_DDD,
    ("cuenta_billetera", "nivel_debida_diligencia"): NIVEL_DDD,
    ("usuario", "nivel_kyc"): NIVEL_KYC,
    ("umbral_operativo", "nivel_kyc_requerido"): NIVEL_KYC,

    # --- reportes a la unidad de inteligencia financiera ---
    ("umbral_reporte_uif", "formulario"): FORMULARIOS_UIF,
    ("registro_operacion_relevante", "formulario"): FORMULARIOS_UIF,
    ("registro_operacion_relevante", "concepto_operacion"): CONCEPTOS_UIF,
    ("regla_monitoreo_lft", "accion_automatica"):
        ["SOLO_ALERTAR", "RETENER_OPERACION", "BLOQUEAR_CUENTA"],
    ("caso_investigacion_lft", "estado"):
        ["ABIERTO", "EN_ANALISIS", "EN_REVISION", "CERRADO"],

    # --- organismos y envíos regulatorios ---
    ("envio_regulatorio", "organismo"): ORGANISMO,
    ("observacion_regulatoria", "organismo"): ORGANISMO,
    ("envio_regulatorio", "canal"):
        ["PORTAL_WEB", "SERVICIO_WEB", "CORREO", "MEDIO_FISICO"],
    ("envio_regulatorio", "estado"):
        ["PENDIENTE", "ENVIADO", "ACEPTADO", "OBSERVADO", "RECHAZADO"],
    ("observacion_regulatoria", "estado"):
        ["RECIBIDA", "EN_RESPUESTA", "RESPONDIDA", "SUBSANADA", "FIRME"],
    ("requerimiento_autoridad", "estado"):
        ["RECIBIDO", "EN_PROCESO", "RESPONDIDO", "VENCIDO", "ARCHIVADO"],
    ("tipo_cambio", "fuente"): ["BCB", "PROVEEDOR", "MANUAL"],
    ("catalogo_reporte_regulatorio", "formato"):
        ["CSV", "TXT", "XML", "JSON", "XLSX", "WEB"],
    ("programacion_reporte", "canal_entrega"):
        ["CORREO", "PORTAL", "ALMACENAMIENTO", "API"],

    # --- billetera y custodia ---
    ("bloqueo_saldo", "estado"): ["VIGENTE", "LEVANTADO", "VENCIDO"],
    ("bloqueo_saldo", "tipo_orden"):
        ["EMBARGO", "RETENCION", "CONGELAMIENTO", "INMOVILIZACION", "INFORMATIVO"],
    ("cuenta_custodia", "estado"): ["ACTIVA", "INACTIVA", "BLOQUEADA", "CERRADA"],
    ("movimiento_custodia", "sentido"): ["DEBITO", "CREDITO"],
    ("descuadre_custodia", "estado"):
        ["ABIERTO", "EN_ANALISIS", "RESUELTO", "ESCALADO"],
    ("arqueo_punto_atencion", "estado"):
        ["ABIERTO", "CUADRADO", "DESCUADRADO", "CERRADO"],
    ("punto_atencion", "estado"): ["HABILITADO", "SUSPENDIDO", "CERRADO"],
    ("instrumento_fondeo", "estado_verificacion"):
        ["PENDIENTE", "VERIFICADO", "RECHAZADO", "VENCIDO"],
    ("orden_retiro", "estado"):
        ["BORRADOR", "PENDIENTE", "EN_REVISION", "AUTORIZADA", "EN_PROCESO",
         "PAGADA", "RECHAZADA", "REVERSADA"],
    ("transferencia_p2p", "estado"):
        ["PENDIENTE", "EJECUTADA", "RECHAZADA", "REVERSADA"],
    ("reverso_transaccion", "estado"):
        ["SOLICITADO", "AUTORIZADO", "EJECUTADO", "RECHAZADO"],
    ("solicitud_cierre_billetera", "estado"):
        ["SOLICITADA", "EN_VALIDACION", "APROBADA", "EJECUTADA", "RECHAZADA"],
    ("evaluacion_antifraude", "decision"):
        ["PERMITIR", "DESAFIAR_MFA", "REVISAR", "RECHAZAR"],
    ("transaccion_billetera", "origen_tipo"):
        ["OBLIGACION_APORTE", "ENTREGA_FONDO", "DEVENGO_COMISION",
         "COBERTURA_INCUMPLIMIENTO", "ORDEN_RECARGA", "ORDEN_RETIRO",
         "TRANSFERENCIA_P2P", "AJUSTE"],
    ("intento_desembolso", "resultado"):
        ["EXITOSO", "FALLIDO", "PENDIENTE", "TIMEOUT"],

    # --- tarifas, comisiones y facturación ---
    ("cargo_comision", "estado"): ["PENDIENTE", "COBRADO", "FALLIDO", "ANULADO"],
    ("cotizacion_comision", "referencia_tipo"):
        ["ENTREGA_FONDO", "PAGO", "ORDEN_RETIRO", "ORDEN_RECARGA", "PERIODO",
         "TRANSACCION_BILLETERA"],
    ("cuenta_por_cobrar_comision", "estado"):
        ["VIGENTE", "VENCIDA", "EN_COBRANZA", "PAGADA", "CASTIGADA"],
    ("devolucion_comision", "estado"):
        ["SOLICITADA", "AUTORIZADA", "EJECUTADA", "RECHAZADA"],
    ("campana_promocional", "estado"):
        ["BORRADOR", "ACTIVA", "PAUSADA", "AGOTADA", "FINALIZADA"],
    ("liquidacion_ingresos", "estado"):
        ["ABIERTA", "EN_CIERRE", "CERRADA", "REABIERTA"],
    ("costo_proveedor_operacion", "tipo_operacion"):
        ["RECARGA", "RETIRO", "TRANSFERENCIA", "COBRO_QR", "DESEMBOLSO", "MENSAJERIA"],
    ("politica_redondeo", "aplica_a"): ["COMISION", "IMPUESTO", "TOTAL", "APORTE"],
    ("nota_credito_debito", "estado_fiscal"): ESTADO_FISCAL,
    ("lote_envio_sin", "estado"):
        ["PENDIENTE", "ENVIADO", "ACEPTADO", "RECHAZADO", "PARCIAL"],
    ("lote_envio_sin", "tipo_envio"):
        ["FACTURAS", "NOTAS", "EVENTOS", "ANULACIONES", "MASIVO"],
    ("evento_significativo_sin", "estado"):
        ["ABIERTO", "CERRADO", "REGISTRADO", "VENCIDO"],

    # --- cumplimiento, gobierno y control ---
    ("contrato_adhesion", "estado"):
        ["BORRADOR", "EN_REGISTRO", "VIGENTE", "SUSTITUIDO", "ARCHIVADO"],
    ("contrato_tercero", "estado"):
        ["EN_NEGOCIACION", "VIGENTE", "SUSPENDIDO", "TERMINADO"],
    ("evaluacion_tercero", "resultado"):
        ["SATISFACTORIO", "CON_OBSERVACIONES", "INSATISFACTORIO"],
    ("politica_interna", "estado"):
        ["BORRADOR", "EN_APROBACION", "VIGENTE", "SUSTITUIDA", "DEROGADA"],
    ("comite_gobierno", "periodicidad_minima"): FRECUENCIA,
    ("control_interno", "frecuencia"): FRECUENCIA,
    ("entorno_prueba_regulado", "estado"):
        ["SOLICITADO", "ACTIVO", "SUSPENDIDO", "FINALIZADO"],
    ("evaluacion_riesgo_producto", "estado"):
        ["BORRADOR", "EN_EVALUACION", "APROBADA", "RECHAZADA"],
    ("expediente_cliente", "estado"):
        ["INCOMPLETO", "COMPLETO", "OBSERVADO", "DEPURADO"],
    ("hallazgo_auditoria", "estado"):
        ["ABIERTO", "EN_REMEDIACION", "SUBSANADO", "VENCIDO", "ACEPTADO_RIESGO"],
    ("plan_accion_riesgo", "estado"):
        ["PENDIENTE", "EN_CURSO", "CUMPLIDO", "VENCIDO", "CANCELADO"],
    ("evento_riesgo_operativo", "estado"):
        ["REGISTRADO", "EN_ANALISIS", "EN_REMEDIACION", "CERRADO"],
    ("incidente_seguridad", "estado"):
        ["DETECTADO", "EN_CONTENCION", "CONTENIDO", "ERRADICADO", "CERRADO"],
    ("revision_periodica_kyc", "estado"):
        ["PROGRAMADA", "EN_CURSO", "EJECUTADA", "VENCIDA"],
    ("declaracion_origen_fondos", "estado"):
        ["DECLARADA", "VERIFICADA", "OBSERVADA", "RECHAZADA"],
    ("desvio_perfil", "estado"):
        ["DETECTADO", "EN_ANALISIS", "JUSTIFICADO", "ESCALADO"],
    ("beneficiario_final", "tipo_control"):
        ["PARTICIPACION_ACCIONARIA", "CONTROL_EFECTIVO", "REPRESENTACION_LEGAL", "OTRO"],
    ("capacitacion_cumplimiento", "modalidad"):
        ["PRESENCIAL", "VIRTUAL", "MIXTA", "AUTOESTUDIO"],
    ("instancia_reclamo", "estado"):
        ["PRESENTADA", "EN_TRAMITE", "RESUELTA", "DESISTIDA"],
    ("reclamo_cliente", "canal_ingreso"):
        ["APP", "WEB", "TELEFONO", "PRESENCIAL", "CORREO"],
    ("apelacion_sancion_org", "estado"):
        ["PRESENTADA", "EN_REVISION", "ACEPTADA", "RECHAZADA", "DESISTIDA"],
    ("comprobante_manual", "estado_revision"):
        ["PENDIENTE", "APROBADO", "RECHAZADO", "OBSERVADO"],
    ("evento_entrega_mensaje", "tipo_evento"):
        ["ENVIADO", "ENTREGADO", "LEIDO", "FALLIDO", "RECHAZADO", "EXPIRADO"],
}

# --- columnas validadas por patrón, no por enumeración --------------------
PATRONES = {
    ("evento_significativo_sin", "codigo_evento"): r"^[0-9]{1,10}$",
}

# --- columnas validadas por rango numérico --------------------------------
RANGOS = {
    ("resena_participante", "calificacion"): (1, 5),
}

# --- valores por defecto --------------------------------------------------
DEF_TIEMPO = {"creado_en", "creada_en", "registrado_en", "registrada_en",
              "recibido_en", "abierta_en", "solicitada_en", "detectada_en",
              "detectado_en", "emitido_en", "evaluada_en", "declarada_en",
              "aplicada_en", "ejecutada_en", "congelada_en", "ocurrida_en",
              "abierto_en", "fecha_ingreso", "fecha_recepcion", "fecha_emision"}
DEF_CERO_PREFIJOS = ("saldo_", "monto_", "total_", "costo_", "cantidad_",
                     "presupuesto_consumido", "monto_acumulado", "perdida_",
                     "recuperacion", "avance_", "escaneos", "clicks",
                     "intentos", "reintentos", "usuarios_notificados",
                     "informes_remitidos", "excepciones", "impacto_")


def ident(*partes):
    """Identificador acotado a 63 caracteres, estable."""
    nombre = "_".join(partes)
    if len(nombre) <= MAX_IDENT:
        return nombre
    corte = MAX_IDENT - 9
    firma = format(abs(hash(nombre)) % 0xFFFFFF, "06x")
    return f"{nombre[:corte]}_{firma}"


def tipo_sql(tipo):
    t = tipo.strip()
    t = re.sub(r"^DECIMAL", "NUMERIC", t, flags=re.I)
    return t


def anot_unica(flat):
    """Devuelve la lista de columnas del UNIQUE compuesto, si lo hay."""
    m = re.search(r"UQ\+([A-Za-z0-9_+]+)", flat)
    return m.group(1).split("+") if m else []


def check_desde_anotacion(col):
    """CHECK derivado de <<CK: expresión>>."""
    m = re.search(r"CK:\s*([^,]+)", col["anot"])
    if not m:
        return None
    expr = m.group(1).strip()
    c = col["nombre"]
    comparacion = r"(>=|<=|<>|>|<|=)\s*-?\d+(\.\d+)?"
    if re.fullmatch(comparacion, expr):
        return f"{c} {expr}"
    # expresiones compuestas: "> 0 AND <= 1"
    piezas = re.split(r"\s+(AND|OR)\s+", expr)
    if len(piezas) > 1 and all(re.fullmatch(comparacion, p) or p in ("AND", "OR")
                               for p in piezas):
        return " ".join(p if p in ("AND", "OR") else f"{c} {p}" for p in piezas)
    if re.fullmatch(r"\d+\s*-\s*\d+", expr):
        a, b = [x.strip() for x in expr.split("-")]
        return f"{c} BETWEEN {a} AND {b}"
    if "|" in expr:
        vals = [v.strip() for v in expr.split("|") if v.strip()]
        lista = ", ".join(f"'{v}'" for v in vals)
        return f"{c} IN ({lista})"
    return None


def valores_enum(tabla, col, mods, modulo=None):
    """Valores admitidos de una columna <<CK>>, derivados del diagrama de clases.

    Busca siempre primero en el módulo de la tabla: hay enumeraciones homónimas
    entre módulos (por ejemplo EstadoTransaccion en 03 y en 10) y resolverlas por
    orden de aparición produce CHECK con los valores del módulo equivocado.
    """
    clave = (tabla, col["nombre"])
    if clave in VALORES:
        return VALORES[clave]

    clase, _ = clase_de(tabla, mods, modulo)
    if not clase:
        return None
    attr = a_camel(col["nombre"])
    orden = ([modulo] if modulo else []) + [k for k in mods if k != modulo]
    for k in orden:
        atributos = mods[k]["atributos"].get(clase, {})
        if attr not in atributos:
            continue
        tipo, anot = atributos[attr]
        # 1) el atributo referencia un enum del diagrama (mismo módulo primero)
        for kk in orden:
            if tipo in mods[kk]["enums"]:
                return mods[kk]["enums"][tipo]
        # 2) el atributo trae la enumeración en línea: <<A | B | C>>
        if "|" in anot:
            vals = [v.strip() for v in anot.split("|")]
            if all(re.fullmatch(r"[A-Z][A-Z0-9_]*", v) for v in vals):
                return vals
    return None


def defecto(col, tipo):
    if col["generated"] or col["pk"]:
        return None
    n = col["nombre"]
    if col["nulo"]:
        return None
    if tipo.upper().startswith("BOOLEAN"):
        return "FALSE"
    if n in DEF_TIEMPO and tipo.upper().startswith("TIMESTAMP"):
        return "now()"
    if tipo.upper().startswith(("NUMERIC", "SMALLINT", "INTEGER", "BIGINT")) \
            and n.startswith(DEF_CERO_PREFIJOS):
        return "0"
    if n == "version" and tipo.upper().startswith(("SMALLINT", "INTEGER")):
        return "0"
    return None


def generar():
    mods, registro, _ = cargar()
    # Solo se borra lo que este script genera: 50_verificacion/prueba_humo.sql
    # está escrito a mano y no debe perderse.
    for sub in ("00_base", "10_tablas", "20_claves", "30_indices", "35_append_only",
                "60_semillas", "61_prueba"):
        if (OUT / sub).exists():
            shutil.rmtree(OUT / sub)

    pendientes = []
    total_tablas = total_fks = total_indices = total_checks = 0

    for k, d in sorted(mods.items()):
        carpeta = f"{k}_{MODULOS[k][1].split('_', 1)[1]}"
        dir_tablas = OUT / "10_tablas" / carpeta
        dir_tablas.mkdir(parents=True, exist_ok=True)

        fks_mod, idx_mod = [], []

        for alias in d["orden"]:
            e = d["entidades"][alias]
            tabla = e["tabla"]
            total_tablas += 1
            clase, _ = clase_de(tabla, mods, k)

            lineas, checks, comentarios = [], [], []
            pk = [c["nombre"] for c in e["cols"] if c["pk"]]

            for col in e["cols"]:
                n, tipo = col["nombre"], tipo_sql(col["tipo"])
                partes = [f"  {n:<34} {tipo}"]

                if col["generated"] and (tabla, n) in GENERADAS:
                    partes.append(f"GENERATED ALWAYS AS ({GENERADAS[(tabla, n)]}) STORED")
                else:
                    dflt = defecto(col, tipo)
                    if dflt:
                        partes.append(f"DEFAULT {dflt}")
                    elif col["pk"] and tipo.upper() == "UUID":
                        partes.append("DEFAULT gen_random_uuid()")
                    if not col["nulo"] and not col["generated"]:
                        partes.append("NOT NULL")

                lineas.append(" ".join(partes))

                expr = check_desde_anotacion(col)
                if expr:
                    checks.append((ident("ck", tabla, n), expr))
                elif (tabla, n) in PATRONES:
                    checks.append((ident("ck", tabla, n),
                                   f"{n} ~ '{PATRONES[(tabla, n)]}'"))
                elif (tabla, n) in RANGOS:
                    lo, hi = RANGOS[(tabla, n)]
                    checks.append((ident("ck", tabla, n), f"{n} BETWEEN {lo} AND {hi}"))
                elif col["ck"]:
                    vals = valores_enum(tabla, col, mods, k)
                    if vals:
                        lista = ", ".join(f"'{v}'" for v in sorted(set(vals)))
                        checks.append((ident("ck", tabla, n), f"{n} IN ({lista})"))
                    else:
                        pendientes.append(f"{tabla}.{n}")

                if col["anot"]:
                    comentarios.append((n, col["anot"]))

                if col["fk"]:
                    destino = resolver_fk(col, k, registro)
                    if destino:
                        fks_mod.append((tabla, n, destino, col["nulo"]))
                    else:
                        pendientes.append(f"FK sin resolver: {tabla}.{n}")

                nombres_tabla = {c["nombre"] for c in e["cols"]}
                extras = anot_unica(col["anot"])
                if extras:
                    faltan = [x for x in extras if x not in nombres_tabla]
                    if faltan:
                        pendientes.append(
                            f"UNIQUE compuesto inválido en {tabla}.{n}: "
                            f"columna(s) inexistente(s) {', '.join(faltan)}")
                    else:
                        idx_mod.append(("UQ", tabla, extras + [n]))
                if col["uq"] and not extras and not col["pk"]:
                    idx_mod.append(("UQ", tabla, [n]))
                if col["idx"]:
                    idx_mod.append(("IX", tabla, [n]))

            cuerpo = ",\n".join(lineas)
            if pk:
                cuerpo += f",\n  CONSTRAINT {ident('pk', tabla)} PRIMARY KEY ({', '.join(pk)})"
            for nombre_ck, expr in checks:
                cuerpo += f",\n  CONSTRAINT {nombre_ck} CHECK ({expr})"
            total_checks += len(checks)

            enc = [f"-- {tabla} · módulo {k} — {MODULOS[k][0]}"]
            if clase:
                enc.append(f"-- clase de dominio: {clase}")
            if tabla in APPEND_ONLY:
                enc.append("-- APPEND-ONLY: sin UPDATE ni DELETE (ver sql/40_reglas)")
            enc.append("-- Generado por scripts/generar_ddl.py — no editar a mano.")

            sql = ["\n".join(enc), "",
                   f"CREATE TABLE IF NOT EXISTS {tabla} (", cuerpo, ");", ""]
            desc = FOCO[k].replace("'", "''")
            marca = " [append-only]" if tabla in APPEND_ONLY else ""
            sql.append(f"COMMENT ON TABLE {tabla} IS "
                       f"'Módulo {k} — {MODULOS[k][0]}.{marca} {desc}';")
            for n, anot in comentarios:
                sql.append(f"COMMENT ON COLUMN {tabla}.{n} IS '{anot}';")
            sql.append("")

            (dir_tablas / f"{tabla}.sql").write_text("\n".join(sql), encoding="utf-8")

        # --- claves foráneas del módulo ---
        L = [f"-- Claves foráneas del módulo {k} — {MODULOS[k][0]}",
             "-- Generado por scripts/generar_ddl.py — no editar a mano.",
             "-- Se aplican después de crear todas las tablas: el modelo tiene",
             "-- referencias circulares entre módulos.", ""]
        for tabla, col, destino, nulo in sorted(set(fks_mod)):
            accion = "ON DELETE SET NULL" if nulo else "ON DELETE RESTRICT"
            L.append(f"ALTER TABLE {tabla}")
            L.append(f"  ADD CONSTRAINT {ident('fk', tabla, col)}")
            L.append(f"  FOREIGN KEY ({col}) REFERENCES {destino} (id) "
                     f"{accion} ON UPDATE CASCADE;")
            L.append("")
        total_fks += len(set(fks_mod))
        (OUT / "20_claves").mkdir(parents=True, exist_ok=True)
        (OUT / "20_claves" / f"{carpeta}.sql").write_text("\n".join(L), encoding="utf-8")

        # --- índices y únicos del módulo ---
        L = [f"-- Índices y restricciones de unicidad del módulo {k} — {MODULOS[k][0]}",
             "-- Generado por scripts/generar_ddl.py — no editar a mano.", ""]
        vistos = set()
        for tipo, tabla, cols in idx_mod:
            clave = (tipo, tabla, tuple(cols))
            if clave in vistos:
                continue
            vistos.add(clave)
            lista = ", ".join(cols)
            if tipo == "UQ":
                L.append(f"CREATE UNIQUE INDEX IF NOT EXISTS {ident('uq', tabla, *cols)}")
                L.append(f"  ON {tabla} ({lista});")
            else:
                L.append(f"CREATE INDEX IF NOT EXISTS {ident('ix', tabla, *cols)}")
                L.append(f"  ON {tabla} ({lista});")
            L.append("")
        total_indices += len(vistos)
        (OUT / "30_indices").mkdir(parents=True, exist_ok=True)
        (OUT / "30_indices" / f"{carpeta}.sql").write_text("\n".join(L), encoding="utf-8")

    escribir_base()
    escribir_append_only()
    escribir_orquestador(mods)

    # El catálogo de restricciones se extrae de docs/Restricciones.md: se
    # regenera acá para que una sola corrida deje sql/ completo y aplicable.
    import extraer_sql
    extraer_sql.main()

    # Las semillas viven en seeders/*.json y se emiten como SQL aplicable.
    import generar_semillas
    generar_semillas.main()

    print(f"sql/ generado: {total_tablas} tablas · {total_fks} claves foráneas · "
          f"{total_indices} índices · {total_checks} CHECK")
    if pendientes:
        print(f"\nPENDIENTES ({len(pendientes)}):")
        for p in sorted(set(pendientes)):
            print(f"  - {p}")
        return 1
    print("Sin pendientes a nivel de datos.")
    return 0


def escribir_base():
    base = OUT / "00_base"
    base.mkdir(parents=True, exist_ok=True)

    (base / "00_extensiones.sql").write_text("""-- Extensiones requeridas por el esquema
-- pgcrypto  : gen_random_uuid() y digest() para las cadenas de hash
-- btree_gist: restricciones EXCLUDE que combinan igualdad y rangos (vigencias)
CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE EXTENSION IF NOT EXISTS btree_gist;
""", encoding="utf-8")

    (base / "01_roles.sql").write_text("""-- Roles de base de datos
-- La segregación de privilegios es parte del cumplimiento: el rol de la
-- aplicación no puede editar tablas append-only ni catálogos regulatorios.
DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'rol_aplicacion') THEN
    CREATE ROLE rol_aplicacion NOLOGIN;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'rol_backoffice') THEN
    CREATE ROLE rol_backoffice NOLOGIN;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'rol_cumplimiento') THEN
    CREATE ROLE rol_cumplimiento NOLOGIN;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'rol_auditor') THEN
    CREATE ROLE rol_auditor NOLOGIN;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'rol_migracion') THEN
    CREATE ROLE rol_migracion NOLOGIN;
  END IF;
END $$;
""", encoding="utf-8")


def escribir_append_only():
    """R-AUD-01 · un disparador por cada tabla append-only, sin excepciones."""
    d = OUT / "35_append_only"
    d.mkdir(parents=True, exist_ok=True)
    L = ["-- R-AUD-01 · tablas append-only: sin UPDATE ni DELETE.",
         "-- Generado por scripts/generar_ddl.py desde la lista APPEND_ONLY del modelo:",
         "-- agregar una tabla a esa lista alcanza para que quede sellada.",
         "",
         "CREATE OR REPLACE FUNCTION fn_aud_bloquear_mutacion() RETURNS trigger AS $$",
         "BEGIN",
         "  RAISE EXCEPTION 'R-AUD-01: % es append-only; corrija con el movimiento inverso',",
         "        TG_TABLE_NAME;",
         "END $$ LANGUAGE plpgsql;",
         ""]
    for tabla in sorted(APPEND_ONLY):
        L += [f"DROP TRIGGER IF EXISTS {ident('tg', tabla, 'append_only')} ON {tabla};",
              f"CREATE TRIGGER {ident('tg', tabla, 'append_only')}",
              f"  BEFORE UPDATE OR DELETE ON {tabla}",
              "  FOR EACH ROW EXECUTE FUNCTION fn_aud_bloquear_mutacion();",
              ""]
    (d / "append_only.sql").write_text("\n".join(L), encoding="utf-8")


def escribir_orquestador(mods):
    L = ["-- Aplica el esquema completo en orden.",
         "--   psql -v ON_ERROR_STOP=1 -f sql/aplicar.sql",
         "-- Generado por scripts/generar_ddl.py — no editar a mano.",
         "",
         "\\set ON_ERROR_STOP on",
         "BEGIN;",
         "",
         "-- 1) Base",
         "\\ir 00_base/00_extensiones.sql",
         "\\ir 00_base/01_roles.sql",
         "",
         "-- 2) Tablas (una por archivo, agrupadas por módulo)"]
    for k, d in sorted(mods.items()):
        carpeta = f"{k}_{MODULOS[k][1].split('_', 1)[1]}"
        L.append(f"--    módulo {k} — {MODULOS[k][0]}")
        for alias in d["orden"]:
            L.append(f"\\ir 10_tablas/{carpeta}/{d['entidades'][alias]['tabla']}.sql")
    L += ["", "-- 3) Claves foráneas (después de todas las tablas)"]
    for k in sorted(mods):
        L.append(f"\\ir 20_claves/{k}_{MODULOS[k][1].split('_', 1)[1]}.sql")
    L += ["", "-- 4) Índices y unicidad"]
    for k in sorted(mods):
        L.append(f"\\ir 30_indices/{k}_{MODULOS[k][1].split('_', 1)[1]}.sql")
    L += ["", "-- 5) Sellado de las tablas append-only",
          "\\ir 35_append_only/append_only.sql",
          "", "-- 6) Reglas de negocio y cumplimiento (catálogo de restricciones)",
          "\\ir 40_reglas/restricciones.sql", "", "COMMIT;", "",
          "-- Verificación posterior (no forma parte de la aplicación):",
          "--   psql -f sql/50_verificacion/verificaciones.sql",
          "--   psql -f sql/50_verificacion/prueba_humo.sql", ""]
    (OUT / "aplicar.sql").write_text("\n".join(L), encoding="utf-8")


if __name__ == "__main__":
    raise SystemExit(generar())
