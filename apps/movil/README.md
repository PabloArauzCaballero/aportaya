# apps/movil — Frontend base de AportaYa (Expo / React Native)

Esta carpeta es la **base de diseño** para que cualquier IA (o persona) construya el
frontend rápido y consistente. **No inventes colores, espaciados ni patrones**: ya están.

## Orden de lectura
1. `src/tokens/tokens.ts` — único lugar con color/espacio/tipografía + tema claro/oscuro.
2. `src/atomos/` — piezas base ya hechas: **Boton, Campo, Monto, ChipEstado, TecladoNumerico, Avatar**.
3. `src/moleculas/` — **CampoMonto, FilaAporte, TarjetaSaldo** (átomos combinados).
4. `src/organismos/` — **FormularioAporte** (orquesta hacia un objetivo, sin IO).
5. `src/pantallas/` — **PantallaInicio** (solo compone; sin lógica).

Catálogo visual con todos los hex: `../../docs/Views/Sistema-Diseno/`.
Reglas completas: skill `disenar-frontend` (`.claude/skills/disenar-frontend/SKILL.md`).

## Estructura (composición atómica — ver skill `arquitectura-atomica`)
```
src/
├── tokens/      color, espacio, tipografía, tema
├── atomos/      sin estado de dominio, sin IO
├── moleculas/   una cosa contra un colaborador
├── organismos/  orquestan piezas; reciben callbacks, NO hacen fetch/SQL
└── pantallas/   solo componen organismos
```

## Reglas que la IA debe respetar
- Color/espacio siempre vía `usarTema()` / `espacio` / `radio`. **Cero hex sueltos.**
- Dinero: átomo `Monto` (formatea `Bs 1.240,00`, tabular-nums). **El cliente nunca recalcula.**
- Un archivo = una pieza; nombre = pieza; < 150 líneas.
- Dirección de dependencia: pantalla → organismo → molécula → átomo. Nunca al revés.
- Accesibilidad: área táctil ≥ 44px, `accessibilityRole`/label, foco visible.
- Un solo botón `primario` (naranja) por pantalla.

## Pendiente de scaffold (cuando se quiera correr)
No es necesario para usar esto como base. Para compilar: `package.json` + Expo,
`app.json`, y cargar **Poppins**/**Inter** con `expo-font` (si faltan, cae a la del sistema).

## Ejemplo de composición (patrón a imitar)
```tsx
import { PantallaInicio } from '@/pantallas/PantallaInicio';

<PantallaInicio
  saldo="1240.00"
  grupos={[
    { id: '1', nombre: 'Familia Aporta', detalle: 'Bs 250 · quincenal', iniciales: 'FA',
      colorAvatar: '#1C5A3A', progreso: 0.62, turno: '5/8', estado: 'por-vencer' },
  ]}
  onRecargar={...} onRetirar={...} onAbrirGrupo={(id) => ...}
/>
```
