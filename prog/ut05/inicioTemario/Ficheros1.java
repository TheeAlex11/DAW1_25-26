import java.nio.file.*;
import java.io.IOException;
import java.util.List;

public class Ficheros1 {
    public static void main(String[] args) throws IOException {
       
        String rutaFichero = args[0];
        List<String> contenido = null;

        try {
            contenido = leerFichero(rutaFichero);

        }
        catch (IOException e) {
            System.out.println("ERROR: No se ha podido leer el fichero.");
            System.exit(0);
        }

        for (String linea : contenido) {
            System.out.println(linea);
        }
    }
    
    private static List<String> leerFichero(String ruta) throws IOException {
        Path path = Paths.get(ruta);
        List<String> resultado = Files.readAllLines(path);

        return resultado;
    }
}