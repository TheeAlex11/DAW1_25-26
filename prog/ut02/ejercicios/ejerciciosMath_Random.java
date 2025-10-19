import java.util.Random;
import java.util.Scanner;

public class ejerciciosMath_Random {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Random r = new Random();

        // Ejercicio 1
        Integer a = 7;
        Integer b = -5;
        int valor = Math.abs(b);
        System.out.println(valor);
        int valor2 = Math.max(a, b);
        System.out.println(valor2);
        int valor3 = Math.min(a, b);
        System.out.println(valor3);

        // Ejercicio 2
        System.out.print("Introduce  un numero:");
        String numero = sc.nextLine();
        Integer resultado = Integer.parseInt(numero);
        System.out.println(Math.pow(resultado, 2));
        System.out.println(Math.sqrt(resultado));

        // Ejercicio 3
        Double x = 7.56;
        System.out.println(Math.round(x));
        System.out.println(Math.floor(x));
        System.out.println(Math.ceil(x));

        /*
         * Explicacion ejercicio 3
         * round redondea
         * floor redondea hacia abajo
         * ceil redondea si es positivo hacia arriba y hacia abajo si es negativo
         * 
        */

        // Ejercicio 4
        System.out.print("Introduce  un numero:");
        String radio = sc.nextLine();
        Double resultadoEjer4 = Double.parseDouble(radio);
        System.out.println(Math.PI * Math.pow(resultadoEjer4, 2));

        System.out.print("Introduce  dos numero:");
        String catetoA = sc.nextLine();
        String catetoB = sc.nextLine();

        Double resultadoA = Double.parseDouble(catetoA);
        Double resultadoB = Double.parseDouble(catetoB);

        System.out.println(Math.sqrt(Math.pow(resultadoA, 2) + Math.pow(resultadoB, 2)));

        // Parte Random

        // Ejercicio 5
        Double aleatorioDouble = Math.random();
        System.out.println("Número aleatorio (Double): " + aleatorioDouble); // Entre 0.0 y 1.0
        
        Integer numero0a9 = (int)(aleatorioDouble * 10);
        System.out.println("Número aleatorio (Integer): " + numero0a9); // Entre 0 y 9

        // Ejercicio 6
        Integer entero0a9 = r.nextInt(10);
        Double doubleAleatorio = r.nextDouble();
        Boolean booleanAleatorio = r.nextBoolean();

        System.out.println("Número entero aleatorio (0-9): " + entero0a9);
        System.out.println("Número decimal aleatorio: " + doubleAleatorio);
        System.out.println("Valor booleano aleatorio: " + booleanAleatorio);

        // Ejercicio 7
        Integer dado = r.nextInt(6) + 1;
        System.out.println("Número aleatorio de un dado (1-6): " + dado);

        // Ejercicio 8
        System.out.println("Introduce el valor mínimo:");
        Integer valorMinimo = sc.nextInt();
        System.out.println("Introduce el valor máximo:");
        Integer valorMaximo = sc.nextInt();

        Integer rangoNumeroAleatorio = r.nextInt(valorMaximo - valorMinimo + 1) + valorMinimo;
        System.out.println("Número aleatorio entre " + valorMinimo + " y " + valorMaximo + ": " + rangoNumeroAleatorio);

        sc.close();

    }
}