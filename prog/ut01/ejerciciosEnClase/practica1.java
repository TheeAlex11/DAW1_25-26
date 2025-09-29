/* Necesitamos crear un programa que muestre la victoria de Alcaraz vs Sinner */

public class practica1 {
	public static void main(String[] args){
		final String JUGADORUNO = "Carlos" + " Alcaraz";
		final String JUGADORDOS = "Jannik" + " Sinner";
		
		Integer resultadoJugadorUno;
		resultadoJugadorUno = 3;
		
		Integer resultadoJugadorDos;
		resultadoJugadorDos = 1;
	
		System.out.println("Tras el partido de " + JUGADORUNO + " vs " + JUGADORDOS + " el partido ha finalizado con un resultado de:");
		System.out.println(JUGADORUNO + " ha obtenido " + resultadoJugadorUno + " sets" + " y " + JUGADORDOS + " ha obtenido " + resultadoJugadorDos + " sets.");
		System.out.println(JUGADORUNO + " ha ganado el partido obteniendo mayores sets que " + JUGADORDOS);
	}
}