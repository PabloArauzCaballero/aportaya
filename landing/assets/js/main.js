/* ============================================================
   AportaYa — Landing · comportamiento
   Un solo archivo, por bloques numerados.
   Nada de esto es imprescindible: si el JS no llega, la página
   se ve entera y se navega igual.
   ============================================================ */
(function () {
  'use strict';

  var raiz = document.documentElement;
  var menosMovimiento = matchMedia('(prefers-reduced-motion: reduce)');

  /* ============================================================
     1 · TEMA
     Tres estados: sin elección (manda el sistema), claro y oscuro.
     La elección se recuerda; el sistema sigue mandando si no hay.
     ============================================================ */
  var LLAVE = 'aportaya:tema';
  var btnTema = document.querySelector('[data-tema]');
  var iconoTema = document.querySelector('[data-tema-icono]');

  function sistemaEsOscuro() {
    return matchMedia('(prefers-color-scheme: dark)').matches;
  }

  function pintarBotonTema() {
    var elegido = raiz.getAttribute('data-theme');
    var oscuro = elegido ? elegido === 'dark' : sistemaEsOscuro();
    if (iconoTema) iconoTema.textContent = oscuro ? '☀' : '☾';
    if (btnTema) {
      btnTema.setAttribute('aria-pressed', String(oscuro));
      btnTema.setAttribute('aria-label', oscuro ? 'Cambiar a tema claro' : 'Cambiar a tema oscuro');
    }
  }

  try {
    var guardado = localStorage.getItem(LLAVE);
    if (guardado === 'dark' || guardado === 'light') raiz.setAttribute('data-theme', guardado);
  } catch (e) { /* modo privado: se sigue sin recordar */ }

  if (btnTema) {
    btnTema.addEventListener('click', function () {
      var actual = raiz.getAttribute('data-theme');
      var oscuroAhora = actual ? actual === 'dark' : sistemaEsOscuro();
      var nuevo = oscuroAhora ? 'light' : 'dark';
      raiz.setAttribute('data-theme', nuevo);
      try { localStorage.setItem(LLAVE, nuevo); } catch (e) {}
      pintarBotonTema();
    });
  }
  matchMedia('(prefers-color-scheme: dark)').addEventListener('change', pintarBotonTema);
  pintarBotonTema();

  /* ============================================================
     2 · ENTRADAS
     Suben, escalan y salen de un desenfoque. Escalonadas por índice
     dentro de su grupo, no por posición absoluta en la página.
     ============================================================ */
  var animables = [].slice.call(document.querySelectorAll('[data-anim]'));

  if (menosMovimiento.matches || !('IntersectionObserver' in window)) {
    animables.forEach(function (el) { el.classList.add('in'); });
  } else {
    animables.forEach(function (el) {
      var hermanos = [].slice.call(el.parentNode.children).filter(function (n) {
        return n.hasAttribute && n.hasAttribute('data-anim');
      });
      el.style.setProperty('--d', Math.min(hermanos.indexOf(el), 5) * 80 + 'ms');
    });

    var obs = new IntersectionObserver(function (filas) {
      filas.forEach(function (f) {
        if (!f.isIntersecting) return;
        f.target.classList.add('in');
        obs.unobserve(f.target);
      });
    }, { rootMargin: '0px 0px -12% 0px', threshold: 0.15 });

    animables.forEach(function (el) { obs.observe(el); });
  }

  /* ============================================================
     3 · TELÉFONO LIGADO AL SCROLL
     Progreso 0→1 de la figura respecto al viewport, suavizado por
     cuadro y escrito como --sp. El CSS lo traduce a rotación.
     Se deduce del rect (no de un observer: con scroll instantáneo
     el observer deja la pieza sin actualizar) y el bucle se corta
     donde el CSS ya ignora la variable.
     ============================================================ */
  var figura = document.querySelector('[data-sp]');
  var corteAncho = 940;

  if (figura && !menosMovimiento.matches && innerWidth > corteAncho) {
    var destino = 0.5, actual = 0.5, vivo = true, pedido = null;

    function cuadro() {
      pedido = null;
      var r = figura.getBoundingClientRect();
      var fuera = r.bottom < 0 || r.top > innerHeight;
      if (!fuera) {
        destino = Math.min(1, Math.max(0, (innerHeight - r.top) / (innerHeight + r.height)));
      }
      actual += (destino - actual) * 0.09;          // sin esto se siente escalonado
      figura.style.setProperty('--sp', actual.toFixed(4));
      // Sigue solo mientras haya diferencia apreciable o la pieza esté a la vista
      if (vivo && (!fuera || Math.abs(destino - actual) > 0.001)) pedirCuadro();
    }

    function pedirCuadro() { if (pedido === null) pedido = requestAnimationFrame(cuadro); }

    addEventListener('scroll', pedirCuadro, { passive: true });
    addEventListener('resize', function () {
      vivo = innerWidth > corteAncho;
      if (!vivo) figura.style.removeProperty('--sp');
      else pedirCuadro();
    });
    document.addEventListener('visibilitychange', function () {
      if (!document.hidden && vivo) pedirCuadro();
    });
    pedirCuadro();
  }

  /* ============================================================
     4 · SECCIÓN ACTUAL EN EL NAV
     El estado va al DOM (aria-current), no solo al color.
     ============================================================ */
  var enlaces = [].slice.call(document.querySelectorAll('.barra nav a[href^="#"]'));
  var secciones = enlaces.map(function (a) { return document.querySelector(a.getAttribute('href')); });

  if ('IntersectionObserver' in window && secciones.filter(Boolean).length) {
    var vistas = new Set();
    var obsNav = new IntersectionObserver(function (filas) {
      filas.forEach(function (f) {
        if (f.isIntersecting) vistas.add(f.target); else vistas.delete(f.target);
      });
      var primera = secciones.filter(function (s) { return s && vistas.has(s); })[0];
      enlaces.forEach(function (a, i) {
        if (secciones[i] === primera) a.setAttribute('aria-current', 'true');
        else a.removeAttribute('aria-current');
      });
    }, { rootMargin: '-45% 0px -50% 0px' });
    secciones.forEach(function (s) { if (s) obsNav.observe(s); });
  }
})();
