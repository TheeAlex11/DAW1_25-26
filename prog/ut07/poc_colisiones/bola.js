export default class Bola {
    
    #div
    #top
    #left
    #velTop
    #velLeft

    constructor(divContenedor){
        this.#div = document.createElement('div')
        this.#div.classList.add('bola')
        divContenedor.appendChild(this.#div)
        this.#top = 200 + Math.random() * 300
        this.#left = 200 + Math.random() * 300
        this.#velTop = Math.random() * 10 - 5
        this.#velLeft = Math.random() * 10 - 5
        this.cambiarColor()
    }

    mover() { 
        this.#top += this.#velTop
        this.#left += this.#velLeft
        this.#div.style.top = this.#top + 'px'
        this.#div.style.left = this.#left + 'px'
    }

    getTop() {
        return this.#top
    }

    cambiarVelTop() {
        this.#velTop = -this.#velTop
    }

    getLeft() {
        return this.#left
    }

    cambiarVelLeft() {
        this.#velLeft = -this.#velLeft
    }

    cambiarColor() {
        this.#div.style.backgroundColor = generarColorRGB()
    }
}

//Funciones Globales

function generarColorRGB() {
	const r = Math.floor(Math.random() * 256); // Valor aleatorio para rojo (0-255)
	const g = Math.floor(Math.random() * 256); // Valor aleatorio para verde (0-255)
	const b = Math.floor(Math.random() * 256); // Valor aleatorio para azul (0-255)

	return `rgb(${r}, ${g}, ${b})`;
}
