public class Pelicula {
    private String titulo;
    private String director;
    private Integer ano;
    private Integer duracion;

    public Pelicula(String titulo, String director, Integer ano, Integer duracion) {
        this.titulo = titulo;
        this.director = director;
        this.ano = ano;
        this.duracion = duracion;
    }

    @Override
    public String toString() {
        return "Pelicula{" +
                "titulo='" + this.titulo + '\'' +
                ", director='" + this.director + '\'' +
                ", ano=" + this.ano +
                ", duracion=" + this.duracion +
                '}';
    }
}
