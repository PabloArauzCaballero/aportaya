#!/usr/bin/env python3
"""
Modelo compartido: parsea los diagramas PlantUML de docs/entidades/ y resuelve
las claves foráneas.

Lo usan `generar_boveda.py` (notas de Obsidian) y `generar_ddl.py` (esquema SQL),
de modo que ambos vean exactamente el mismo modelo. No edite las tablas de
overrides en un solo lado: viven acá.
"""

import re
import pathlib
from collections import defaultdict

SRC = pathlib.Path("docs") / "entidades"

MODULOS = {
    "01": ("Identidad, Usuarios y Seguridad", "01_identidad_usuarios"),
    "02": ("Grupos, Cupos, Turnos y Gobernanza", "02_grupos_turnos"),
    "03": ("Aportes, Pagos QR y Conciliación", "03_aportes_pagos_qr"),
    "04": ("Entregas de Fondo", "04_entregas_fondo"),
    "05": ("Notificaciones y Comunicaciones", "05_notificaciones"),
    "06": ("Transparencia y Reputación", "06_transparencia_reputacion"),
    "07": ("Organizador y Automatización", "07_organizador_automatizacion"),
    "08": ("Garantía, Incumplimiento, Cobranza y Sanciones", "08_garantia_incumplimiento"),
    "09": ("Auditoría, Reportes y Cumplimiento", "09_auditoria_reportes"),
    "10": ("Billetera, Custodia y Dinero Electrónico", "10_billetera_custodia"),
    "11": ("Tarifas, Comisiones, Impuestos y Facturación", "11_tarifas_comisiones"),
    "12": ("Cumplimiento Regulatorio y Consumidor Financiero", "12_cumplimiento_asfi"),
}

FOCO = {
    "01": "Saber con certeza a quién le estás confiando plata ajena",
    "02": "Reglas del juego, orden de cobro y decisiones colectivas",
    "03": 'Que "pagué" signifique "el banco lo confirmó"',
    "04": "Que la bolsa llegue completa, a la persona correcta, una sola vez",
    "05": "WhatsApp como canal real de cobro, sin spam ni doble aviso",
    "06": 'Que nadie tenga que "creerle" al organizador',
    "07": "Administrar es un rol, no un negocio: el organizador no cobra ni custodia",
    "08": "El grupo no se detiene, pero la deuda no se perdona sola",
    "09": "Poder demostrar todo lo anterior ante un reclamo o un regulador",
    "10": "El saldo no se guarda: se deriva, y todos los días cuadra contra el banco",
    "11": "La política de cobro es dato, no código: se cambia con un seeder",
    "12": "Que una inspección se responda con consultas, no armando carpetas",
}

APPEND_ONLY = {
    "evento_reputacion", "registro_sellado", "bitacora_evento", "evento_dominio",
    "registro_acceso_datos", "movimiento_fondo", "abono_recuperacion",
    "historial_estado_incumplimiento", "registro_incumplimiento",
    "asiento_contable", "movimiento_contable",
    "transaccion_billetera", "movimiento_billetera", "movimiento_custodia",
    "saldo_diario_billetera", "devengo_comision",
    "registro_operacion_relevante", "evento_riesgo_operativo",
    "acta_comite",
}

# --- FK -> tabla destino: overrides donde el nombre de columna no coincide ---
OVERRIDES = {
    "obligacion_id": "obligacion_aporte", "obligacion_origen_id": "obligacion_aporte",
    "registro_id": "registro_incumplimiento", "registro_origen_id": "registro_incumplimiento",
    "fondo_id": "fondo_garantia", "deuda_id": "deuda_participante",
    "cobertura_id": "cobertura_incumplimiento", "aval_id": "aval_participante",
    "gestion_id": "gestion_cobranza", "estrategia_id": "estrategia_cobranza",
    "matriz_id": "matriz_sancion", "politica_cobertura_id": "politica_cobertura",
    "politica_mora_id": "politica_mora", "politica_sancion_id": "politica_sancion",
    "acuerdo_grupo_id": "acuerdo", "entrega_id": "entrega_fondo",
    "entrega_afectada_id": "entrega_fondo", "asiento_id": "asiento_contable",
    "asiento_contable_id": "asiento_contable", "asiento_reversa_id": "asiento_contable",
    "cuenta_id": "cuenta_contable", "cuenta_contable_id": "cuenta_contable",
    "cuenta_destino_id": "cuenta_bancaria_beneficiario",
    "extracto_id": "extracto_bancario", "documento_id": "documento_identidad",
    "kyc_reforzado_id": "verificacion_kyc", "rotado_de_id": "token_verificacion",
    "token_id": "token_verificacion", "token_firma_id": "token_verificacion",
    "token_aceptacion_id": "token_verificacion", "token_confirmacion_id": "token_verificacion",
    "politica_id": "politica_sancion", "plantilla_id": "plantilla_mensaje",
    "version_plantilla_id": "version_plantilla", "envio_id": "envio_notificacion",
    "notificacion_id": "notificacion", "notificacion_relacionada_id": "notificacion",
    "modelo_id": "modelo_scoring", "puntaje_id": "puntaje_reputacion",
    "snapshot_id": "snapshot_reputacion", "insignia_id": "insignia_logro",
    "bloque_id": "bloque_transparencia", "revertido_por_id": "evento_reputacion",
    "evaluacion_id": "evaluacion_desempeno", "tarea_id": "tarea_automatizada",
    "definicion_id": "definicion_reporte", "ejecucion_id": "ejecucion_reporte",
    "lista_id": "lista_restrictiva_externa", "solicitud_id": "solicitud_datos_personales",
    "reporte_sospechoso_id": "reporte_operacion_sospechosa",
    "sancion_organizador_id": "sancion_organizador", "sancion_id": "sancion",
    "reemplazo_id": "reemplazo_participante", "disolucion_id": "disolucion_anticipada",
    "postulacion_id": "postulacion_emparejamiento", "propuesta_id": "propuesta_grupo",
    "criterio_id": "criterio_emparejamiento", "reglamento_id": "reglamento_grupo",
    "orden_desembolso_id": "orden_desembolso", "orden_cobro_id": "orden_cobro",
    "intento_pago_id": "intento_pago", "movimiento_bancario_id": "movimiento_bancario",
    "movimiento_fondo_id": "movimiento_fondo", "conciliacion_id": "conciliacion",
    "canal_vinculado_id": "canal_vinculado", "grupo_materializado_id": "grupo",
    "permutado_con_turno_id": "turno", "turno_origen_id": "turno", "turno_destino_id": "turno",
    "invitado_por_id": "participante",
    "plan_regularizacion_id": "plan_regularizacion",
    "actor_usuario_id": "usuario", "suplantando_a_usuario_id": "usuario",
    "aprobado_por_acuerdo_id": "acuerdo",
    # --- M10: billetera y custodia ---
    "transaccion_id": "transaccion_billetera",
    "transaccion_origen_id": "transaccion_billetera",
    "transaccion_original_id": "transaccion_billetera",
    "transaccion_reverso_id": "transaccion_billetera",
    "cuenta_billetera_origen_id": "cuenta_billetera",
    "cuenta_billetera_destino_id": "cuenta_billetera",
    "instrumento_destino_id": "instrumento_fondeo",
    "retencion_id": "retencion_saldo",
    "limite_id": "limite_operativo_billetera",
    # --- M11: tarifas y comisiones ---
    "hecho_generador_id": "catalogo_hecho_generador",
    "tarifario_anterior_id": "tarifario", "tarifario_nuevo_id": "tarifario",
    "segmento_id": "segmento_comercial",
    "cotizacion_id": "cotizacion_comision",
    "devengo_id": "devengo_comision",
    "campana_id": "campana_promocional",
    "cuenta_ingreso_id": "cuenta_contable",
    "factura_id": "factura_electronica",
    "evento_significativo_id": "evento_significativo_sin",
    # --- M12: cumplimiento ---
    "matriz_riesgo_id": "matriz_riesgo_lft",
    "calificacion_riesgo_id": "calificacion_riesgo_cliente",
    "regla_monitoreo_id": "regla_monitoreo_lft",
    "alerta_monitoreo_id": "alerta_monitoreo_lft",
    "caso_id": "caso_investigacion_lft",
    "catalogo_reporte_id": "catalogo_reporte_regulatorio",
    "reclamo_id": "reclamo_cliente",
    "evento_riesgo_id": "evento_riesgo_operativo",
    "hallazgo_id": "hallazgo_auditoria",
    "control_id": "control_interno",
    "umbral_reporte_id": "umbral_reporte_uif",
    "operacion_inicio_ventana_id": "registro_operacion_relevante",
    "declaracion_origen_fondos_id": "declaracion_origen_fondos",
    "propietario_id": "usuario", "custodio_id": "usuario",
    "responsable_id": "usuario", "analista_id": "usuario",
    "usuario_obligado_id": "usuario", "responsable_usuario_id": "usuario",
}

# FK por modulo cuando el nombre es ambiguo
POR_MODULO = {
    ("03", "proveedor_id"): "proveedor_pago", ("04", "proveedor_id"): "proveedor_pago",
    ("05", "proveedor_id"): "proveedor_mensajeria",
    ("10", "proveedor_id"): "proveedor_pago", ("11", "proveedor_id"): "proveedor_pago",
    ("04", "regla_id"): "regla_entrega", ("07", "regla_id"): "regla_automatizacion",
    ("09", "regla_id"): "regla_cumplimiento",
    ("05", "evento_id"): "evento_notificable",
    ("08", "politica_id"): "politica_sancion",
}

ACTOR_A_USUARIO = re.compile(
    r"^(.*_por|.*_por_id|asignad[ao]_a|asignada_a|gestor_asignado_id|responsable_gestion|"
    r"analista_id|apelante_id|reclamante_id|emisor_id|usuario_consultor_id|usuario_afectado_id|"
    r"evaluado_usuario_id|avalista_usuario_id|suplantando_a_usuario_id|liberada_por|levantada_por|"
    r"revisada_por|revisado_por|segunda_revision_por|moderada_por|resuelta_por|resuelto_por)$")

PARTICIPANTE = re.compile(
    r"^(participante_origen_id|participante_destino_id|participante_avalado_id|"
    r"participante_saliente_id|participante_entrante_id|beneficiario_participante_id|"
    r"reportado_por_participante_id|autor_participante_id|solicitante_id|contraparte_id)$")


def parse_puml(path):
    """Devuelve entidades, relaciones, notas, clases y enumeraciones del módulo."""
    txt = path.read_text()
    i = txt.index("@enduml")
    rel_block = txt[txt.index("@startuml", i):]
    cls_block = txt[:i]

    clases = {}
    for m in re.finditer(r"^\s*(?:abstract\s+)?class\s+(\w+)\s*(<<(\w+)>>)?", cls_block, re.M):
        clases[m.group(1)] = m.group(3) or ""

    # enumeraciones declaradas:  enum Nombre { VALOR ... }
    enums = {}
    for m in re.finditer(r"^\s*enum\s+(\w+)\s*\{(.*?)^\s*\}", cls_block, re.M | re.S):
        valores = [v.strip() for v in m.group(2).splitlines()
                   if v.strip() and re.fullmatch(r"[A-Z0-9_]+", v.strip())]
        if valores:
            enums[m.group(1)] = valores

    # atributos de clase:  Clase -> {atributo: (tipo, anotacion)}
    atributos = defaultdict(dict)
    for m in re.finditer(r"^\s*(?:abstract\s+)?class\s+(\w+)[^\{]*\{(.*?)^\s*\}",
                         cls_block, re.M | re.S):
        clase, cuerpo = m.group(1), m.group(2)
        for linea in cuerpo.splitlines():
            a = re.match(r"^\s*[-#+]\s*(\w+)\s*:\s*([\w<>\[\]]+)\s*(?:<<(.+?)>>)?\s*$", linea)
            if a:
                atributos[clase][a.group(1)] = (a.group(2), a.group(3) or "")

    entidades, orden = {}, []
    for m in re.finditer(r'^entity\s+"([^"]+)"\s+as\s+(\w+)\s*\{(.*?)^\}', rel_block, re.M | re.S):
        tabla, alias, body = m.group(1), m.group(2), m.group(3)
        cols = []
        for line in body.splitlines():
            line = line.strip()
            if not line or line == "--":
                continue
            pk = line.startswith("*")
            line_s = line.lstrip("* ").strip()
            fk = line_s.startswith("#")
            line_s = line_s.lstrip("# ").strip()
            if " : " not in line_s:
                continue
            nombre, resto = line_s.split(" : ", 1)
            anot = re.findall(r"<<(.*?)>>", resto)
            tipo = re.sub(r"<<.*?>>", "", resto).strip()
            flat = ", ".join(anot)
            cols.append({
                "nombre": nombre.strip(), "tipo": tipo, "pk": pk or "PK" in flat,
                "fk": fk or re.search(r"\bFK\b", flat) is not None,
                "uq": "UQ" in flat, "idx": "IDX" in flat,
                "nulo": "NULL" in flat, "ck": "CK" in flat, "anot": flat,
                "generated": "GENERATED" in flat,
            })
        entidades[alias] = {"tabla": tabla, "cols": cols}
        orden.append(alias)

    relaciones = []
    for line in rel_block.splitlines():
        m = re.match(r'^(\w+)\s+(\S*--\S*)\s+(\w+)\s*:\s*"([^"]*)"\s*$', line.strip())
        if m:
            relaciones.append({"a": m.group(1), "card": m.group(2),
                               "b": m.group(3), "label": m.group(4)})

    notas = defaultdict(list)
    for m in re.finditer(r"^note\s+(?:top|bottom|left|right)\s+of\s+(\w+)\s*\n(.*?)^end note",
                         rel_block, re.M | re.S):
        notas[m.group(1)].append(m.group(2).rstrip())

    return {"entidades": entidades, "orden": orden, "relaciones": relaciones,
            "notas": notas, "clases": clases, "enums": enums, "atributos": atributos}


def cargar():
    """Carga los 12 módulos y devuelve (mods, registro, alias_de)."""
    mods = {}
    for k, (nombre, fichero) in MODULOS.items():
        mods[k] = parse_puml(SRC / f"{fichero}.puml")
        mods[k]["nombre"], mods[k]["fichero"] = nombre, fichero

    registro, alias_de = {}, {}
    for k, d in mods.items():
        for alias, e in d["entidades"].items():
            registro[e["tabla"]] = k
            alias_de[(k, alias)] = e["tabla"]
    return mods, registro, alias_de


def resolver_fk(col, modulo, registro):
    n = col["nombre"]
    if (modulo, n) in POR_MODULO:
        return POR_MODULO[(modulo, n)]
    if n in OVERRIDES:
        return OVERRIDES[n]
    if PARTICIPANTE.match(n):
        return "participante"
    if n.endswith("_id"):
        base = n[:-3]
        if base in registro:
            return base
    if ACTOR_A_USUARIO.match(n):
        return "usuario"
    if n in registro:
        return n
    return None


def clase_de(tabla, mods, modulo=None):
    """Clase de dominio de una tabla. Prefiere el módulo propio: hay clases y
    enumeraciones homónimas entre módulos y tomar la primera es un error."""
    cand = "".join(p.capitalize() for p in tabla.split("_"))
    orden = ([modulo] if modulo else []) + [k for k in mods if k != modulo]
    for k in orden:
        for c, st in mods[k]["clases"].items():
            if c.lower() == cand.lower():
                return c, st
    return None, ""


def a_camel(snake):
    partes = snake.split("_")
    return partes[0] + "".join(p.capitalize() for p in partes[1:])
