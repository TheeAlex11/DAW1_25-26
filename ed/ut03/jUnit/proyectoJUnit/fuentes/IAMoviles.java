import java.util.Scanner;

public class IAMoviles {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        System.out.println("=== CALCULADORA DE MOVIMIENTO DE MÓVILES ===");
        System.out.println("1. Móviles que se cruzan");
        System.out.println("2. Móviles que se persiguen");
        System.out.print("Seleccione el tipo de problema (1-2): ");
        
        int tipoProblema = scanner.nextInt();
        
        System.out.println("\n¿Qué desea calcular?");
        System.out.println("1. Tiempo de encuentro");
        System.out.println("2. Distancia de encuentro");
        System.out.print("Seleccione la incógnita (1-2): ");
        
        int incognita = scanner.nextInt();
        
        // Solicitar datos comunes
        System.out.println("\n=== DATOS DEL MÓVIL 1 ===");
        System.out.print("Posición inicial (m): ");
        double pos1 = scanner.nextDouble();
        System.out.print("Velocidad inicial (m/s): ");
        double vel1 = scanner.nextDouble();
        System.out.print("Aceleración (m/s²): ");
        double acel1 = scanner.nextDouble();
        
        System.out.println("\n=== DATOS DEL MÓVIL 2 ===");
        System.out.print("Posición inicial (m): ");
        double pos2 = scanner.nextDouble();
        System.out.print("Velocidad inicial (m/s): ");
        double vel2 = scanner.nextDouble();
        System.out.print("Aceleración (m/s²): ");
        double acel2 = scanner.nextDouble();
        
        double resultado = 0;
        
        switch (tipoProblema) {
            case 1:
                // Móviles que se cruzan
                resultado = Cruzador.calcular(pos1, vel1, acel1, pos2, vel2, acel2, incognita);
                break;
            case 2:
                // Móviles que se persiguen
                resultado = Perseguidor.calcular(pos1, vel1, acel1, pos2, vel2, acel2, incognita);
                break;
            default:
                System.out.println("Opción no válida");
                return;
        }
        
        // Mostrar resultado
        if (incognita == 1) {
            System.out.printf("\nRESULTADO: El tiempo de encuentro es %.2f segundos%n", resultado);
        } else {
            System.out.printf("\nRESULTADO: La distancia de encuentro es %.2f metros%n", resultado);
        }
        
        scanner.close();
    }
}