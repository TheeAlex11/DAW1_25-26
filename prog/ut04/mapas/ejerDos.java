import java.util.HashMap;
import java.util.Scanner;

public class ejerDos {
    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);
        System.out.println("Escribe un texto:");
        String texto = sc.nextLine().replace(" ", "");

        HashMap<Character, Integer> mapa = new HashMap<>();

        // Contar caracteres
        for (int i = 0; i < texto.length(); i++) {
            char letra = texto.charAt(i);
                if (mapa.containsKey(letra)) {
                    int valor = mapa.get(letra);
                    mapa.put(letra, valor + 1);
                } else {
                    mapa.put(letra, 1);
                }
            
        }

        // Mostrar el recuento
        System.out.println("\nRecuento de caracteres:");
        for (char clave : mapa.keySet()) {
            System.out.println(clave + " = " + mapa.get(clave));
        }

        // Buscar el carácter más repetido
        char masRepetido = ' ';
        int max = 0;

        for (char clave : mapa.keySet()) {
            int veces = mapa.get(clave);

            if (veces > max) {
                max = veces;
                masRepetido = clave;
            }
        }

        System.out.println("\nCarácter más repetido: " + masRepetido);
        System.out.println("Número de veces: " + max);

        sc.close();
    }
}
