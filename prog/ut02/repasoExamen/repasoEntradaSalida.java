import java.util.Scanner;

public class repasoEntradaSalida {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        // Lectura de diferentes tipos de datos
        System.out.print("Introduce un entero: ");
        Integer entero = sc.nextInt();

        System.out.print("Introduce un número decimal: ");
        Double decimal = sc.nextDouble();

        System.out.print("Introduce un decimal (float): ");
        Float decimalFloat = sc.nextFloat();

        System.out.print("Introduce una línea completa de texto: ");
        sc.nextLine();

        String lineaCompleta = sc.nextLine();
        // Mostrar los datos leídos
        
        System.out.println("\n=== Datos introducidos ===");
        System.out.println("Entero: " + entero);
        System.out.println("Decimal: " + decimal);
        System.out.println("Decimal (float): " + decimalFloat);
        System.out.println("Línea completa: " + lineaCompleta);
        sc.close();

    }
}