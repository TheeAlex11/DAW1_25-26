import java.util.HashMap;
import java.util.Scanner;
import java.util.TreeMap;

public class ejerUno {
    public static void main(String[] args) {
        HashMap<String, String> diccionario = new HashMap<>();

        diccionario.put("casa", "house");
        diccionario.put("perro", "dog");
        diccionario.put("gato", "cat");
        diccionario.put("libro", "book");
        diccionario.put("escuela", "school");
        diccionario.put("coche", "car");
        diccionario.put("ciudad", "city");
        diccionario.put("comida", "food");
        diccionario.put("agua", "water");
        diccionario.put("amigo", "friend");
        diccionario.put("familia", "family");

        Scanner scanner = new Scanner(System.in);
        System.out.print("Introduce una palabra en español: ");

        String palabra = scanner.nextLine().toLowerCase().trim();
        String traduccion = diccionario.get(palabra);
       
        if (traduccion != null) {
            System.out.println("La traducción de " + palabra + " es: " + traduccion);
        } else {
            System.out.print("La palabra no existe en el diccionario. Introduce su traducción en inglés: ");
            String nuevaTraduccion = scanner.nextLine().toLowerCase().trim();
            diccionario.put(palabra, nuevaTraduccion);
            System.out.println("Palabra añadida al diccionario.");

            // Mostrar el diccionario actualizado
            System.out.println("Diccionario actualizado: " + diccionario);
        }

        // Mostramos las palabras ordenadas alfabéticamente
        TreeMap<String, String> diccionarioOrdenado = new TreeMap<>(diccionario);
        System.out.println("Diccionario ordenado: " + diccionarioOrdenado);

        scanner.close();
    }
}
