import React from 'react';
import { View, Text, Pressable, StyleSheet } from 'react-native';
import { usarTema, espacio, radio, fuente, TACTIL_MIN, type Tema } from '../tokens/tokens';

export interface TecladoNumericoProps {
  /** Se llama con el dígito pulsado ('0'–'9') o la tecla extra. */
  onTecla: (t: string) => void;
  onBorrar: () => void;
  /** Tecla inferior izquierda: ',' para montos, '' para PIN. */
  teclaExtra?: string;
}

/** Átomo Teclado numérico (3×4) para montos y PIN. Áreas táctiles ≥ 44px. */
export function TecladoNumerico({ onTecla, onBorrar, teclaExtra = ',' }: TecladoNumericoProps) {
  const t = usarTema();
  const filas = [['1', '2', '3'], ['4', '5', '6'], ['7', '8', '9'], [teclaExtra, '0', '⌫']];

  return (
    <View>
      {filas.map((fila, i) => (
        <View key={i} style={estilos.fila}>
          {fila.map((tecla, j) => {
            const vacia = tecla === '';
            const borrar = tecla === '⌫';
            return (
              <Pressable
                key={j}
                disabled={vacia}
                onPress={borrar ? onBorrar : () => onTecla(tecla)}
                accessibilityRole="button"
                accessibilityLabel={borrar ? 'Borrar' : tecla}
                style={({ pressed }) => [
                  estilos.tecla,
                  {
                    backgroundColor: vacia ? 'transparent' : pressed ? t.surface2 : t.surface,
                    borderColor: vacia ? 'transparent' : t.border,
                    borderRadius: radio.md,
                  },
                ]}
              >
                <Text style={{ color: borrar || tecla === teclaExtra ? t.brand : t.text, fontFamily: fuente.display, fontSize: 20, fontWeight: '600' }}>
                  {tecla}
                </Text>
              </Pressable>
            );
          })}
        </View>
      ))}
    </View>
  );
}

const estilos = StyleSheet.create({
  fila: { flexDirection: 'row', gap: espacio[2], marginBottom: espacio[2] },
  tecla: { flex: 1, minHeight: TACTIL_MIN + 8, height: 52, borderWidth: 1, alignItems: 'center', justifyContent: 'center' },
});
