import java.util.Map;
import java.util.Set;
import java.util.Collection;
import java.util.HashMap;

public class Mapas {
    public static void main(String[] args) {
        // 1. Crear mapas
        Map<Integer, String> miMapa = new HashMap<>();

        // 2. Añadir elementos
        miMapa.put(2, "Merida");
        miMapa.put(1, "Badajoz");
        miMapa.put(3, "Don Benito");
        miMapa.put(98, "Zafra");
        miMapa.put(44, "Villanueva");
        System.out.println(miMapa);

        // 3. Sustituir elementos
        miMapa.put(2, "Caceres"); // Reemplaza "Merida" con "Caceres"
        System.out.println(miMapa);

        // 4. Acceder a elementos
        System.out.println(miMapa.get(1)); // Imprime "Badajoz"

        // 5. Eliminar elementos
        miMapa.remove(2);
        System.out.println(miMapa);

        // 6. Recorrer las claves
        Set<Integer> claves = miMapa.keySet();

        for (Integer clave : claves) {
            System.out.println("Clave: " + clave + ", Valor: " + miMapa.get(clave));
        }

        // 7. Recorrer los valores
        Collection<String> valores = miMapa.values();
        System.out.println("Valores: " + valores);

        // 8. Recorrer entradas del mapa
        for(Map.Entry<Integer, String> entrada : miMapa.entrySet()) {
            System.out.println("Clave: " + entrada.getKey());
            System.out.println("Valor: " + entrada.getValue());
        }

    }
}