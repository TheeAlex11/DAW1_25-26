import java.util.ArrayList;
import java.util.List;

public class Alumno {

    private String nombre;
    private List<Double> calificaciones;

    public Alumno(String nombre) {
        this.nombre = nombre;
        this.calificaciones = new ArrayList<>();
    }

    public void agregarCalificacion(Double calificacion) {
        calificaciones.add(calificacion);
    }

    public String getNombre() {
        return nombre;
    }

    public List<Double> getCalificaciones() {
        return calificaciones;
    }
}