import Bola from './bola.js'

class Controlador{
	static NUM_BOLAS = 5
	#div
	#bolas = []
	#temporizador

	constructor(){
		this.#div = document.querySelector('div')
		this.#crearBolas()
		this.#activarAnimacion()
	}

	#crearBolas() {
		for(let i = 0; i < Controlador.NUM_BOLAS; i++)
		this.#bolas.push(new Bola(this.#div))
	}
	
	#activarAnimacion() {
		setInterval(this.#mover.bind(this), 10)
	}

	#mover() {
		let divEstiloCalculado = window.getComputedStyle(this.#div)
		
		let divAltura = parseInt(divEstiloCalculado.height)
		let divAnchura = parseInt(divEstiloCalculado.width)

		for(let i = 0; i < Controlador.NUM_BOLAS; i++) {
			this.#bolas[i].mover()
			// Detectar colisiones
			if ((this.#bolas[i].getTop() <= 0) || (this.#bolas[i].getTop() >= divAltura - 50)) {
				this.#bolas[i].cambiarVelTop()
			}
			if ((this.#bolas[i].getLeft() <= 0) || (this.#bolas[i].getLeft() >= divAnchura - 50)) {
				this.#bolas[i].cambiarVelLeft()
			}
			// Detectar colisiones entre bolas
			this.#bolas.forEach(bola => {
				if (this.#bolas[i] == bola) return
				let distancia = calcularDistanciadistancia(this.#bolas[i], bola)
				if (distancia <= 50) {
					this.#bolas[i].cambiarVelTop()
					this.#bolas[i].cambiarVelLeft()
					bola.cambiarVelTop()
					bola.cambiarVelLeft()
					bola.cambiarColor()
				}
			})
		}
	}

 }

//Funciones Globales

function calcularDistanciadistancia(bola1, bola2){
	const centro1 = calcularCentro(bola1)
	const centro2 = calcularCentro(bola2)
	return Math.sqrt((centro1[0] - centro2[0])**2 + (centro1[1] - centro2[1])**2)
}

function calcularCentro(bola){
	return [bola.getLeft() + 25, bola.getTop() + 25] // parseInt(elemento.style.left) + parseInt(elemento.style.width) / 2,
}

function calcularRadio(elemento){
	return parseInt(elemento.style.width) / 2
}

//Lanzador
document.addEventListener('DOMContentLoaded', () => {
	new Controlador()
})


