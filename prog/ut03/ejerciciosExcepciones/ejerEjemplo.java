import java.util.Scanner;

public class ejerEjemplo {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Integer[] notas = { 1, 2, 3, 4, 5 };

        System.out.println("Introduce el numero de la nota que quieres ver (1-5): ");
        try {
            Integer n = Integer.valueOf(sc.nextLine());
            System.out.println("Tu nota es: " + notas[n]);
           // System.out.println("Has introducido bien el valor: " + n);
        } catch (Exception ex) {
            System.out.println("No has introducido bien los datos");
            System.out.println(ex);
        } finally {
            sc.close();
        }
    }
}