# POO - Ejercicio 3

![Armas](fondo.png)

## Objetivo:
Relaciones de uso.

## 1. Crea la clase Arma
Vamos a crear armas que puedan utilizar los personajes en sus combates. Para ello tendrán:
	
- **Atributos Privados**:
	- *nombre* (String): Nombre del arma. Por ejemplo "Espada", "Hacha", "Arco,...
	- *dano* (Integer): Daño que inflinge el arma al ser utilizada en un ataque. Debe ser un número positivo (>= 0)

- **Métodos**:
	- Solo tendrá getters. Así conseguimos que no se puedan modificar los atributos iniciales.
	- *toString*. Mostrará el nombre del arma y el daño que infligne.

## 2. Modifica la clase Personaje

- **Atributos Privados**:
	- *arma* (Arma): Referencia al arma que puede (o no) llevar el personaje.

- **Métodos**:
	- *Constructor*: Modificalo para que inicialice el arma del personaje a nulo.
	- *getArma, setArma*: Crea el getter y el setter para arma.
	- *recibirAtaque* (Integer dano): Resta al personaje tantos puntos de vida como el daño del ataque. Si el daño es negativo, se lanzará una excepción. 
	- *atacar* (Personaje atacado): Llamará al método recibirAtaque del personaje atacado, causando un daño igual al nivel del personaje atacante sumado al daño del arma si la tuviera.
	- *toString*: Modifica el método para que, si el peronsaje tiene arma, incluya también su descripción. Si no tiene arma, deberá mostrar el texto "Desarmado".

