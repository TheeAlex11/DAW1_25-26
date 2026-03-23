'use strict'

// Controles
const botonUno = document.getElementById('botonUno')
const botonDos = document.getElementById('botonDos')
const botonTres = document.getElementById('botonTres')

const vistaUno = document.getElementsByTagName('div')[0]
const vistaDos = document.getElementsByTagName('div')[1]
const vistaTres = document.getElementsByTagName('div')[2]

const menuTres = document.getElementsByTagName('a')[2]

// Eventos
botonUno.addEventListener('click', verVista2)
botonDos.addEventListener('click', verVista3)
botonTres.addEventListener('click', verVista1)

menuTres.addEventListener('click', verVista3)

// Manejadores de eventos
function verVista2() {
    ocultarVistas()
    vistaUno.classList.remove('activa')
    vistaDos.classList.add('activa')
}

function verVista3() {
    ocultarVistas()
    vistaDos.classList.remove('activa')
    vistaTres.classList.add('activa')
}

function verVista1() {
    ocultarVistas()
    vistaTres.classList.remove('activa')
    vistaUno.classList.add('activa')
}

function ocultarVistas() {
    vistaUno.classList.remove('activa')
    vistaDos.classList.remove('activa')
    vistaTres.classList.remove('activa')
}


//  ⚠️ APUNTES ⚠️
// document.write("Hola mundo") Para escribir en el index


// botonUno.onclick = hazAlgo Ya no se utiliza
// Uso actual para varios manejadores de eventos en un mismo evento
// botonUno.addEventListener('click', hazAlgo)
// botonUno.addEventListener('click', hazOtraCosa)

// function hazAlgo() {
//     console.log("Click recibido")
// }

// function hazOtraCosa() {
//     console.log("Otra cosa")
// }