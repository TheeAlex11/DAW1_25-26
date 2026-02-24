import java.nio.file.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class Ficheros2 {
    public static void main(String[] args) throws IOException {
       
        String rutaFichero = args[0];
        List<Alumno> alumnos = null;

        try {
            alumnos = leerFichero(rutaFichero);

        }
        catch (IOException e) {
            System.out.println("ERROR: No se ha podido leer el fichero.");
            System.exit(0);
        }

        for (Alumno alumno : alumnos) {
            System.out.println(alumno);
        }
    }
    
    private static List<Alumno> leerFichero(String ruta) throws IOException {
        List<Alumno> resultado = new ArrayList<>();
        Path path = Paths.get(ruta);
        List<String> lineas = Files.readAllLines(path);

        for (int i = 1; i < lineas.size(); i++) {
            String[] trozos = lineas.get(i).split("#");
            if(trozos.length != 3) 
                continue;

            String nombre = trozos[0].trim();
            String apellidos = trozos[1].trim();
            Integer calificacion = Integer.valueOf(trozos[2].trim());
            String nombreCompleto = nombre + " " + apellidos;

            Alumno alumno = new Alumno(nombreCompleto, calificacion);
            resultado.add(alumno);


        }

        return resultado;
    }
}