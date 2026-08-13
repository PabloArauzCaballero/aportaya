import React from 'react';
import { ScrollView, View, Text, Pressable, StyleSheet } from 'react-native';
import { usarTema, espacio, fuente } from '../tokens/tokens';
import { TarjetaSaldo } from '../moleculas/TarjetaSaldo';
import { FilaAporte, type FilaAporteProps } from '../moleculas/FilaAporte';

export interface Grupo extends FilaAporteProps {
  id: string;
}

export interface PantallaInicioProps {
  saldo: string;
  grupos: Grupo[];
  onRecargar: () => void;
  onRetirar: () => void;
  onAbrirGrupo: (id: string) => void;
}

/**
 * Página Inicio: SOLO compone organismos/moléculas. Sin lógica ni IO.
 * Los datos y callbacks llegan de arriba (navegación / capa de dominio).
 */
export function PantallaInicio({ saldo, grupos, onRecargar, onRetirar, onAbrirGrupo }: PantallaInicioProps) {
  const t = usarTema();
  return (
    <ScrollView style={{ backgroundColor: t.bg }} contentContainerStyle={estilos.cont}>
      <TarjetaSaldo saldo={saldo} onRecargar={onRecargar} onRetirar={onRetirar} />

      <Text style={[estilos.seccion, { color: t.text3 }]}>MIS PASANAKUS</Text>
      <View style={{ gap: espacio[2] + 1 }}>
        {grupos.map((g) => (
          <Pressable key={g.id} onPress={() => onAbrirGrupo(g.id)} accessibilityRole="button">
            <FilaAporte {...g} />
          </Pressable>
        ))}
      </View>
    </ScrollView>
  );
}

const estilos = StyleSheet.create({
  cont: { padding: espacio[4], gap: espacio[4] },
  seccion: { fontFamily: fuente.display, fontWeight: '600', fontSize: 12, letterSpacing: 1, marginBottom: -espacio[2] },
});
