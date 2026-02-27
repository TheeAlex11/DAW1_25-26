import org.json.*;
import java.nio.file.*;

public class LeerJSON {
    public static void main(String[] args) throws Exception {
        Path path = Paths.get("./datos/pelicula.json");
        String contenido = new String(Files.readAllBytes(path));
        System.out.println(contenido);

        // Convertir el contenido a un objeto JSON
        JSONObject objetoJSON = new JSONObject(contenido);
        String titulo = objetoJSON.getString("titulo");
        String director = objetoJSON.getString("director");
        Integer ano = objetoJSON.getInt("año");
        Integer duracion = objetoJSON.getInt("duracion");

        Pelicula peli = new Pelicula(titulo, director, ano, duracion);
        System.out.println(peli);
    }
}
