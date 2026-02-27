public class Alumno {
    private String nombreCompleto;
    private Integer calificacion;

    public Alumno(String nombreCompleto, Integer calificacion) {
        this.nombreCompleto = nombreCompleto;
        this.calificacion = calificacion;
    }

    @Override
    public String toString() {
        return "Alumno{" + "nombreCompleto=" + this.nombreCompleto + ", calificacion=" + this.calificacion + '}';
    }
}