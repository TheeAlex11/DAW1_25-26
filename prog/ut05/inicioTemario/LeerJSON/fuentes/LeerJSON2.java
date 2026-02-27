import org.json.*;
import java.nio.file.*;
import java.util.ArrayList;
import java.util.List;

public class LeerJSON2 {
    public static void main(String[] args) throws Exception {
        Path path = Paths.get("./datos/peliculas.json");
        String contenido = new String(Files.readAllBytes(path));
        System.out.println(contenido);

        // Convertir el contenido a un objeto JSON
        JSONArray arrayJSON = new JSONArray(contenido);
        List<Pelicula> peliculas = new ArrayList<>();

        for (int i = 0; i < arrayJSON.length(); i++) {
            JSONObject pelicula = arrayJSON.getJSONObject(i);
            
            String titulo = pelicula.getString("titulo");
            String director = pelicula.getString("director");
            Integer ano = pelicula.getInt("año");
            Integer duracion = pelicula.getInt("duracion");

            Pelicula peli = new Pelicula(titulo, director, ano, duracion);
            peliculas.add(peli);
        }

        
        System.out.println(peliculas);
    }
}
