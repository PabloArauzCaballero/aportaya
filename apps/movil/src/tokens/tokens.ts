/**
 * ÚNICO lugar con valores de color, espacio y tipografía de la app móvil.
 * Ningún componente define un hex ni un espaciado literal: todo sale de acá.
 * Fuente de verdad visual: skill `disenar-frontend-aportaya`.
 *
 * Las tipografías Poppins (display) e Inter (cuerpo) deben cargarse con
 * `expo-font` en el arranque; si no están, RN cae a la fuente del sistema.
 */
import { useColorScheme } from 'react-native';

/** Paleta cruda. No se consume directo en componentes: usá `usarTema()`. */
export const paleta = {
  // Verde Pasanaku
  g900: '#0C2C1D', g800: '#123A26', g700: '#164A30', g600: '#1C5A3A', g500: '#237349',
  g400: '#3C9366', g300: '#7CBE9C', g200: '#BCDFCC', g100: '#E7F2EB',
  // Naranja Aporte
  o700: '#BC6217', o600: '#D6741C', o500: '#E5852B', o400: '#EF9E4E',
  o300: '#F6BE85', o200: '#FBDBB8', o100: '#FDF0DF',
  // Neutros
  ink: '#10231A', slate: '#38473F', muted: '#6C7B72', line: '#DCE4DE',
  fieldBorde: '#C9D4CD', cloud: '#F3F6F2', crema: '#F6F4EC', blanco: '#FFFFFF',
  // Semánticos
  ok: '#1F9D57', okBg: '#E7F5EC', warn: '#F0B429', warnBg: '#FEF4DA',
  err: '#D64545', errBg: '#FBECEC', info: '#2E7FB8', infoBg: '#E7F1F8',
  // Texto sobre color
  sobreNaranja: '#3A1E02', textoClaro: '#F4FBF6', foco: '#7CBE9C',
} as const;

/** Escala de espaciado base 4. */
export const espacio = { 1: 4, 2: 8, 3: 12, 4: 16, 5: 24, 6: 32, 7: 48 } as const;

/** Radios de esquina. */
export const radio = { sm: 8, md: 12, lg: 16, xl: 24, pill: 999 } as const;

/** Familias tipográficas (cargar con expo-font). */
export const fuente = {
  display: 'Poppins',
  cuerpo: 'Inter',
} as const;

/** Área táctil mínima recomendada (accesibilidad). */
export const TACTIL_MIN = 44;

/** Sombras (estilo RN: iOS + elevation Android). */
export const sombra = {
  1: { shadowColor: '#10231A', shadowOffset: { width: 0, height: 1 }, shadowOpacity: 0.06, shadowRadius: 2, elevation: 1 },
  2: { shadowColor: '#10231A', shadowOffset: { width: 0, height: 4 }, shadowOpacity: 0.10, shadowRadius: 16, elevation: 4 },
  3: { shadowColor: '#10231A', shadowOffset: { width: 0, height: 14 }, shadowOpacity: 0.18, shadowRadius: 34, elevation: 12 },
} as const;

/** Tokens semánticos — tema claro. Los componentes consumen ESTO. */
export const temaClaro = {
  bg: paleta.crema, surface: paleta.blanco, surface2: paleta.cloud,
  text: paleta.ink, text2: paleta.slate, text3: paleta.muted, border: paleta.line,
  brand: paleta.g600, brandInk: paleta.g800, accent: paleta.o500, accentInk: paleta.sobreNaranja,
  field: paleta.blanco, fieldBorder: paleta.fieldBorde,
  ok: paleta.ok, okBg: paleta.okBg, warn: paleta.warn, warnBg: paleta.warnBg,
  err: paleta.err, errBg: paleta.errBg, info: paleta.info, infoBg: paleta.infoBg,
  textoClaro: paleta.textoClaro, foco: paleta.foco,
  // Overlays claros para usar SOBRE superficies de color (tarjeta verde, etc.)
  overlayClaro: 'rgba(255,255,255,0.14)', overlayClaroBorde: 'rgba(255,255,255,0.22)',
  esOscuro: false,
} as const;

/** Tokens semánticos — tema oscuro. */
export const temaOscuro = {
  ...temaClaro,
  bg: '#0A1F15', surface: '#0F2B1D', surface2: '#0C2418',
  text: '#EAF3ED', text2: '#B7CCC0', text3: '#89998E', border: '#1C3A2A',
  brand: paleta.g400, brandInk: '#EAF3ED', accent: paleta.o400,
  field: '#0C2418', fieldBorder: '#2A4A38',
  okBg: 'rgba(31,157,87,0.14)', warnBg: 'rgba(240,180,41,0.14)',
  errBg: 'rgba(214,69,69,0.14)', infoBg: 'rgba(46,127,184,0.14)',
  esOscuro: true,
} as const;

export type Tema = typeof temaClaro;

/** Hook: devuelve los tokens del tema activo según el sistema. */
export function usarTema(): Tema {
  return useColorScheme() === 'dark' ? (temaOscuro as Tema) : temaClaro;
}
