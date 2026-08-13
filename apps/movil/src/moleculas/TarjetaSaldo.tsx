import React from 'react';
import { View, Text, StyleSheet } from 'react-native';
import { usarTema, espacio, radio, fuente, sombra } from '../tokens/tokens';
import { Monto } from '../atomos/Monto';
import { Boton } from '../atomos/Boton';

export interface TarjetaSaldoProps {
  saldo: string;
  onRecargar: () => void;
  onRetirar: () => void;
  etiqueta?: string;
}

/** Molécula TarjetaSaldo: muestra el saldo y las 2 acciones de plata. */
export function TarjetaSaldo({ saldo, onRecargar, onRetirar, etiqueta = 'SALDO DISPONIBLE' }: TarjetaSaldoProps) {
  const t = usarTema();
  return (
    <View style={[estilos.card, { backgroundColor: t.brand, borderRadius: radio.lg }, sombra[2]]}>
      <Text style={[estilos.k, { color: t.textoClaro }]}>{etiqueta}</Text>
      <View style={estilos.saldo}>
        <Monto valor={saldo} tamano="xl" tono="claro" />
      </View>
      <View style={estilos.acciones}>
        <View style={{ flex: 1 }}><Boton titulo="↑ Recargar" variante="primario" bloque onPress={onRecargar} /></View>
        <View style={{ flex: 1 }}><Boton titulo="↓ Retirar" variante="claro" bloque onPress={onRetirar} /></View>
      </View>
    </View>
  );
}

const estilos = StyleSheet.create({
  card: { padding: espacio[5] - 2 },
  k: { fontSize: 12, opacity: 0.8, letterSpacing: 0.4 },
  saldo: { marginTop: espacio[1], marginBottom: espacio[4] },
  acciones: { flexDirection: 'row', gap: espacio[3] - 2 },
});
