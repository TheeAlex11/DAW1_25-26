import java.util.Scanner; // Importar la clase Scanner

public class ejerEntradaSalida {
    public static void main(String[] args) {
        // Declarar el Scanner
        Scanner sc = new Scanner(System.in);
        
        // Ejercicio 1
        System.out.println("¿Cuál es tu nombre?");
        String nombre = sc.nextLine();
        System.out.println("Hola " + nombre);
        
        // Ejercicio 2
        System.out.println("¿Cuál es tu edad?");
        Integer edad = sc.nextInt();
        System.out.println("Tienes " + edad + " años");
        
        // Ejercicio 3
        System.out.println("Pon un numero decimal");
        Double decimal = sc.nextDouble();
        System.out.println("El numero decimal es " + decimal);

        // Ejercicio 4
        System.out.println("Introduce el primer numero entero");
        Integer num1 = sc.nextInt();
        System.out.println("Introduce el segundo numero entero");
        Integer num2 = sc.nextInt();
        System.out.println("Introduce el tercer numero entero");
        Integer num3 = sc.nextInt();
        Integer suma = num1 + num2 + num3;
        System.out.println("La suma de los tres numeros es " + suma);

        // Ejercicio 5
        System.out.println("Introduce el radio de un círculo");
        Double radio = sc.nextDouble();
        Double pi = 3.1416;
        Double area = pi * radio * radio;
        Double longitud = 2 * pi * radio;
        System.out.println("El área del círculo es " + area);
        System.out.println("La longitud del círculo es " + longitud);

        // Ejercicio 6
        System.out.print("Ingresa tu edad: ");
        int edadPersona = sc.nextInt();

        boolean esMayorEdad = edadPersona >= 18;

        System.out.println("¿Es mayor de edad? " + esMayorEdad);

        // Ejercicio 7
        System.out.println("Introduce el nombre de producto");
        String producto = sc.next();
        System.out.println("Introduce el numero de unidades");
        Integer unidades = sc.nextInt();
        System.out.println("Introduce el precio por unidad");
        Double precioUnidad = sc.nextDouble();

        Double importeSinIVA = unidades * precioUnidad;
        Double iva = importeSinIVA * 0.21;
        Double importeTotal = importeSinIVA + iva;

        System.out.println("\n====== TICKET DE COMPRA ======");
        System.out.printf("%-15s %5s %10s %n", "Producto", "Cant.", "Precio");
        System.out.printf("%-15s %5d %10.2f%n", producto, unidades, precioUnidad);
        System.out.println("-------------------------------");
        System.out.printf("%-20s %10.2f%n", "Importe sin IVA:", importeSinIVA);
        System.out.printf("%-20s %10.2f%n", "IVA (21%):", iva);
        System.out.printf("%-20s %10.2f%n", "Total a pagar:", importeTotal);
        System.out.println("===============================");

        /* Apuntes sobre Scanner
        sc.nextByte(); // Byte
        sc.nextInt(); // Integer
        sc.nextFloat(); // Float
        sc.nextDouble(); // Double
        sc.nextLine(); // String
        */
    
        sc.close();
    }
}
