import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class InsertarAutor {

    public static void main(String[] args) {

        String url = "jdbc:sqlite:autores.sqlite";

        String sqlInsertarAutor = """
            INSERT INTO Autor (nombre, nacionalidad)
            VALUES (?, ?);
        """;

        String sqlInsertarObra = """
            INSERT INTO Obra (id_autor, titulo, ano_publicacion)
            VALUES (?, ?, ?);
        """;

        try (Connection conexion = DriverManager.getConnection(url)) {

            // -------------------------
            // DATOS
            // -------------------------
            String nombre = "Paco Sanz";
            String nacionalidad = "Española";

            String titulo = "Las trepidantes aventuras del hidalgo de la Mancha";
            int ano_publicacion = 2004;

            Integer autorId = null;

            // -------------------------
            // INSERT AUTOR
            // -------------------------
            try (PreparedStatement sentenciaAutor = conexion.prepareStatement(
                    sqlInsertarAutor,
                    Statement.RETURN_GENERATED_KEYS)) {

                sentenciaAutor.setString(1, nombre);
                sentenciaAutor.setString(2, nacionalidad);

                int filasAutor = sentenciaAutor.executeUpdate();

                if (filasAutor > 0) {

                    try (ResultSet claves = sentenciaAutor.getGeneratedKeys()) {
                        if (claves.next()) {

                            autorId = claves.getInt(1);

                            System.out.println("Autor insertado correctamente.");
                            System.out.println("ID del autor: " + autorId);
                        }
                    }
                }
            }

            // -------------------------
            // INSERT OBRA
            // -------------------------
            if (autorId != null) {

                try (PreparedStatement sentenciaObra = conexion.prepareStatement(sqlInsertarObra)) {

                    sentenciaObra.setInt(1, autorId);
                    sentenciaObra.setString(2, titulo);
                    sentenciaObra.setInt(3, ano_publicacion);

                    int filasObra = sentenciaObra.executeUpdate();

                    if (filasObra > 0) {
                        System.out.println("Obra insertada correctamente.");
                    }
                }

            } else {
                System.out.println("No se ha podido insertar la obra (autorId es null).");
            }

        } catch (SQLException e) {
            System.err.println("Error en la base de datos:");
            e.printStackTrace();
        }
    }
}