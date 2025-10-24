// ¿Eres capaz de "seguir el hilo"?
// Sigue a la variable "a" por todo el código.
// EL RETO: Indicar el valor de "a" en cada paso.

import java.util.Scanner;

public class Dojo3 {

	static int a;
	
	static int puntos = 0;
	static int total = 0;
	static Scanner sc = new Scanner(System.in);
	
	public static void main(String[] args) {
		a = (int)(Math.random()*10 + 1);	//Le asignamos un número al azar entre 1 y 10
		System.out.println("El empezar a vale " + a);
		
		// Operadores matemáticos
		a = a + 5; // 8
		int b = a; // 8
		a = b + 2 * a; // 80 (valor a)
		comprobar();
		int c = b / 2; // 4
		a = c + a; // 12
		a = (a + b) % c; // 
		comprobar();
		a = a / 3;		
		comprobar();
		
		// Incrementadores
		a++;
		b = 7 * a++;
		a -= 2;
		c = 3 * --a;
		comprobar();
		
		sc.close();
		System.out.println("¡FIN! Has conseguido, " + puntos + " puntos de " + total + ".");
	}

	static void comprobar() {
		total++;
		System.out.print("¿Cuánto vale a? ");
		if (sc.nextInt() != a){
			System.out.println("¡LO SIENTO! a vale " + a);
			System.out.println("Sigues con " + puntos + " puntos de " + total + ".");
		}
		else{
			puntos++;
			System.out.println("¡BIEN! Llevas " + puntos + " puntos de " + total + ".");
		}
	}

}
