window.addEventListener('keydown', atenderEvento);
window.addEventListener('keyup', atenderEvento);

let nave = document.querySelector('img');

function atenderEvento(evento) {
    const estiloCalculado = window.getComputedStyle(nave);
    let naveTop = parseInt(estiloCalculado.top);

    if (evento.key == 'w') {
        naveTop -= 10;
        nave.style.transform = 'rotate(0deg)';
    }
    if (evento.key == 's') {
        naveTop += 10;
        nave.style.transform = 'rotate(180deg)';
    }

    nave.style.top = naveTop + 'px';

}