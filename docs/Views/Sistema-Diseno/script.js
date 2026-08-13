// Comportamiento compartido del Sistema de Diseño AportaYa
function toggleTheme(){
  var r=document.documentElement,c=r.getAttribute('data-theme');
  r.setAttribute('data-theme', c==='dark'?'light':(c==='light'?'dark':(matchMedia('(prefers-color-scheme: dark)').matches?'light':'dark')));
}
function togglePw(id,el){var i=document.getElementById(id);if(!i)return;if(i.type==='password'){i.type='text';el.textContent='🙈';}else{i.type='password';el.textContent='👁';}}
function stp(btn,d){var i=document.getElementById('stp');if(!i)return;i.value=Math.max(2,(parseInt(i.value)||0)+d);}
var _toastT;
function showToast(m){var t=document.getElementById('toast');if(!t)return;var s=document.getElementById('toastMsg');if(s)s.textContent=m;t.classList.add('show');clearTimeout(_toastT);_toastT=setTimeout(function(){t.classList.remove('show')},2200);}
document.addEventListener('DOMContentLoaded',function(){
  document.querySelectorAll('.tabs').forEach(function(t){t.querySelectorAll('button').forEach(function(b){b.addEventListener('click',function(){t.querySelectorAll('button').forEach(function(x){x.classList.remove('on')});b.classList.add('on');});});});
  document.querySelectorAll('.segmented').forEach(function(s){s.querySelectorAll('button').forEach(function(b){b.addEventListener('click',function(){s.querySelectorAll('button').forEach(function(x){x.classList.remove('on')});b.classList.add('on');});});});
  document.querySelectorAll('.filterbar').forEach(function(f){f.querySelectorAll('.chip').forEach(function(c){c.addEventListener('click',function(e){if(e.target.classList.contains('x'))return;c.classList.toggle('active');});});});
});
