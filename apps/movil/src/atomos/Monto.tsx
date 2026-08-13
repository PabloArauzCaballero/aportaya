import React from 'react';
import { Text, type TextStyle } from 'react-native';
import { usarTema, fuente } from '../tokens/tokens';

type Tamano = 'sm' | 'base' | 'lg' | 'xl';
type Tono = 'normal' | 'positivo' | 'negativo' | 'claro' | 'marca';

export interface MontoProps {
  /** Importe como string decimal (numeric-as-string). El componente NO recalcula. */
  valor: string;
  moneda?: string;
  tamano?: Tamano;
  tono?: Tono;
  /** Antepone el signo (+/−) según positivo/negativo. */
  conSigno?: boolean;
  decimales?: number;
}

/**
 * Átomo Monto. Solo FORMATEA para mostrar (Bs 1.240,00) con cifras tabulares.
 * Nunca calcula comisiones ni totales: esos llegan cotizados del servidor
 * (ver skills `dinero-decimal` y `contratos-api`).
 */
export function Monto({
  valor, moneda = 'Bs', tamano = 'base', tono = 'normal', conSigno = false, decimales = 2,
}: MontoProps) {
  const t = usarTema();
  const negativo = valor.trim().startsWith('-');
  const texto = formatear(valor, decimales);

  const color =
    tono === 'positivo' ? t.ok :
    tono === 'negativo' ? t.err :
    tono === 'claro' ? t.textoClaro :
    tono === 'marca' ? t.brand : t.text;

  const signo = conSigno ? (negativo ? '−' : '+') : '';

  return (
    <Text
      accessibilityLabel={`${signo}${moneda} ${texto}`}
      style={[tamanos[tamano], { color, fontFamily: fuente.display, fontVariant: ['tabular-nums'] }]}
    >
      {signo}
      <Text style={{ fontSize: (tamanos[tamano].fontSize as number) * 0.55, opacity: 0.8 }}>{moneda} </Text>
      {texto}
    </Text>
  );
}

/** Formatea "1240.5" → "1.240,50" (miles con punto, decimales con coma). */
export function formatear(valor: string, decimales = 2): string {
  const limpio = valor.replace(/[^0-9.]/g, '');
  const [ent = '0', dec = ''] = limpio.split('.');
  const entero = ent.replace(/^0+(?=\d)/, '') || '0';
  const miles = entero.replace(/\B(?=(\d{3})+(?!\d))/g, '.');
  const decs = (dec + '0'.repeat(decimales)).slice(0, decimales);
  return decimales > 0 ? `${miles},${decs}` : miles;
}

const tamanos: Record<Tamano, TextStyle> = {
  sm: { fontSize: 15, fontWeight: '700' },
  base: { fontSize: 20, fontWeight: '700' },
  lg: { fontSize: 28, fontWeight: '700', letterSpacing: -0.4 },
  xl: { fontSize: 40, fontWeight: '700', letterSpacing: -0.8 },
};
