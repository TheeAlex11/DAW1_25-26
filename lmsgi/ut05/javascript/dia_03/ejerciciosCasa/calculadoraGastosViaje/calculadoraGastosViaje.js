const hosting = Number(prompt("Ingrese el costo del hospedaje por noche:"), 0.0);
const food = Number(prompt("Ingrese el costo de la comida por día:"), 0.0);
const entertainment = Number(prompt("Ingrese el costo del entretenimiento por día:"), 0.0);

const calculator = hosting + food + entertainment;

alert(`El costo total del viaje es: ${calculator} €`);