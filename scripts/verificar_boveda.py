#!/usr/bin/env python3
"""
Verifica la coherencia de la boveda: casos de uso, modelo, restricciones e indices.

    python3 scripts/verificar_boveda.py     (desde la raiz del repositorio)

Devuelve 1 si algo falla, para poder usarlo como gate del CI. No toca ningun
archivo: solo lee y compara. Complementa a generar_boveda.py (que valida el
modelo contra los .puml) y a la prueba de humo (que valida la base real).
"""
import re, pathlib, collections, sys

R = pathlib.Path(__file__).resolve().parent.parent
CU = R / 'docs/CasosDeUso'
fallas = []

def check(cond, msg):
    print(('  OK    · ' if cond else '  FALLA · ') + msg)
    if not cond:
        fallas.append(msg)

SEC = ['## Actores y disparador', '## Precondiciones', '## Flujo principal',
       '## Flujos alternativos', '## Postcondiciones', '## Contrato',
       '## Descomposición atómica', '## Eventos, trabajos y permisos', '## Interfaz',
       '## Restricciones aplicables', '## Evidencia que deja',
       '## Criterios de aceptación', '## Ver también']

casos = sorted(CU.glob('CU-*.md'))
print('\n=== CASOS DE USO ===')
check(len(casos) > 0, f'{len(casos)} casos de uso encontrados')

sin_seccion = [p.stem[:5] for p in casos if any(s not in p.read_text() for s in SEC)]
check(not sin_seccion, f'todos con las 13 secciones de la plantilla {sin_seccion or ""}')

sin_tabla, mal_num, sin_fila = [], [], []
for p in casos:
    t = p.read_text(); nn = p.stem[3:5]
    zod = re.findall(r"(\w+):\s*'AP-CU(\d+)-(\d+)'", t)
    filas = set(re.findall(r'^\|\s*`([A-Z0-9_]+)`\s*\|', t, re.M))
    if zod and '| Error | Cuándo se devuelve |' not in t:
        sin_tabla.append(p.stem[:5])
    if [int(c) for _, _, c in zod] != list(range(1, len(zod) + 1)):
        mal_num.append(p.stem[:5])
    for n, cc, _ in zod:
        if n not in filas or cc != nn:
            sin_fila.append(f'{p.stem[:5]}:{n}')
check(not sin_tabla, f'todos con tabla de errores {sin_tabla or ""}')
check(not mal_num, f'códigos de error correlativos {mal_num or ""}')
check(not sin_fila, f'cada código con su fila y su CU {sin_fila[:5] or ""}')

pocos_g = [p.stem[:5] for p in casos
           if len(re.findall(r'^\s*Dad[oa]s?\b', re.search(r'```gherkin(.*?)```', p.read_text(), re.S).group(1), re.M)) < 3]
check(not pocos_g, f'≥3 escenarios Gherkin por caso {pocos_g or ""}')

pocos_a = []
for p in casos:
    sec = p.read_text().split('## Flujos alternativos')[-1].split('## Postcondiciones')[0]
    if len([l for l in sec.splitlines() if l.startswith('|') and '---' not in l]) - 1 < 4:
        pocos_a.append(p.stem[:5])
check(not pocos_a, f'≥4 flujos alternativos por caso {pocos_a or ""}')

ref = {}
for p in casos:
    ref[p.stem[:5]] = set(re.findall(r'\[\[(CU-\d\d)[^\]]*\]\]', p.read_text().split('## Ver también')[-1]))
no_rec = [f'{a}→{b}' for a, s in ref.items() for b in s if b in ref and a not in ref[b]]
check(not no_rec, f'"Ver también" recíproco {no_rec[:5] or ""}')

print('\n=== COBERTURA DEL MODELO ===')
ents = {p.stem for p in (R / 'docs/Modelos/Entidades').rglob('*.md') if not p.stem.startswith('_')}
usadas = set()
for p in casos:
    usadas |= {m.strip().rstrip('\\') for m in re.findall(r'\[\[([^\]|#]+)', p.read_text())}
huerfanas = sorted(ents - usadas)
check(len(ents) > 0, f'{len(ents)} entidades en el modelo')
check(not huerfanas, f'toda entidad tiene al menos un caso de uso {huerfanas[:5] or ""}')

print('\n=== RESTRICCIONES ===')
rdef = set(re.findall(r'R-[A-Z]{3}-\d{2}', (R / 'docs/Restricciones.md').read_text()))
rcit = set()
for p in casos:
    rcit |= set(re.findall(r'R-[A-Z]{3}-\d{2}', p.read_text()))
check(len(rdef) > 0, f'{len(rdef)} restricciones definidas')
check(not (rcit - rdef), f'toda restricción citada existe {sorted(rcit - rdef) or ""}')
check(not (rdef - rcit), f'toda restricción está citada por un caso {sorted(rdef - rcit) or ""}')

print('\n=== ÍNDICES ===')
idx = (CU / '_CasosDeUso.md').read_text()
enl = set(re.findall(r'\[\[(CU-\d\d[^\]]*)\]\]', idx))
arch = {p.stem for p in casos}
check(enl == arch, f'índice de casos completo (sobran {sorted(enl - arch)[:3]}, faltan {sorted(arch - enl)[:3]})')
check(f'total_casos: {len(casos)}' in idx, f'total_casos: {len(casos)} en el frontmatter')

sk = (R / '.claude/skills/README.md').read_text()
listadas = set(re.findall(r'^\| `([a-z0-9-]+)`', sk, re.M))
carpetas = {p.name for p in (R / '.claude/skills').iterdir() if p.is_dir()}
check(listadas == carpetas, f'índice de skills completo ({len(carpetas)} skills)')

nombres_ok = all(re.match(r'---\nname: ' + re.escape(p.parent.name) + r'\n', (p).read_text())
                 for p in (R / '.claude/skills').glob('*/SKILL.md'))
check(nombres_ok, 'frontmatter de cada skill coincide con su carpeta')

print('\n=== ARQUITECTURA ===')
SEC_ADR = ['## Contexto', '## Decisión', '## Motivo', '## Alternativas descartadas',
           '## Consecuencias', '## Cómo se verifica']
adrs = sorted((R / 'docs/Arquitectura').glob('ADR-*.md'))
arq = (R / 'docs/Arquitectura/_Arquitectura.md').read_text()
check(len(adrs) > 0, f'{len(adrs)} decisiones registradas')

sin_idx = [p.stem[:7] for p in adrs if p.stem not in arq]
check(not sin_idx, f'toda decisión está en el índice {sin_idx or ""}')

sin_sec = [p.stem[:7] for p in adrs if any(s not in p.read_text() for s in SEC_ADR)]
check(not sin_sec, f'toda decisión tiene las 6 secciones obligatorias {sin_sec or ""}')

sin_estado = [p.stem[:7] for p in adrs
              if not re.search(r'^estado: (aceptada|rechazada|superada por ADR-\d+)$',
                               p.read_text(), re.M)]
check(not sin_estado, f'toda decisión declara estado válido {sin_estado or ""}')

nums = [p.stem[4:7] for p in adrs]
check(len(nums) == len(set(nums)), f'sin números de ADR repetidos {sorted({n for n in nums if nums.count(n) > 1}) or ""}')

print('\n=== ENLACES ===')
# La boveda de Obsidian tiene su raiz en docs/. Un wikilink resuelve por nombre de
# nota o por ruta parcial desde esa raiz. Los que van dentro de `backticks` son
# ejemplos citados, no enlaces, y no se cuentan.
notas = {p.stem for p in (R / 'docs').rglob('*.md')}
rutas = {str(p.relative_to(R / 'docs').with_suffix('')) for p in (R / 'docs').rglob('*.md')}

def enlaces_de(texto):
    sin_codigo = re.sub(r'```.*?```', '', texto, flags=re.S)   # bloques de codigo
    sin_codigo = re.sub(r'`[^`\n]*`', '', sin_codigo)          # codigo en linea
    return [m.strip().rstrip('\\') for m in re.findall(r'\[\[([^\]|#]+)', sin_codigo)]

rotos = []
for p in sorted((R / 'docs').rglob('*.md')):
    for enlace in enlaces_de(p.read_text()):
        if enlace in notas:
            continue
        if any(r == enlace or r.endswith('/' + enlace) for r in rutas):
            continue
        rotos.append(f'{p.relative_to(R)} → {enlace}')
check(not rotos, f'ningún wikilink roto en la bóveda {rotos[:5] or ""}')

# Las skills viven fuera de la boveda: solo pueden enlazar notas de docs/.
# Una skill se referencia con `backticks`, nunca con [[wikilink]].
rotos_sk = []
for p in sorted((R / '.claude/skills').glob('*/SKILL.md')):
    for enlace in enlaces_de(p.read_text()):
        if enlace in notas or any(r.endswith('/' + enlace) for r in rutas):
            continue
        rotos_sk.append(f'{p.parent.name} → {enlace}')
check(not rotos_sk, f'ningún wikilink roto en las skills {rotos_sk[:5] or ""}')

print(f'\n{"TODO OK" if not fallas else str(len(fallas)) + " FALLAS"}')
sys.exit(1 if fallas else 0)
