import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ejercicio2 {

    public static void main(String[] args) {

        insertarObra(1, "Fundación", 1951);
        System.out.println("Obra insertada");

        modificarObra(1, 1, "Fundación y Tierra", 1986);
        System.out.println("Obra modificada");
    

        eliminarObra(1);
        System.out.println("Obra eliminada");

    }

    private static Boolean insertarObra(Integer idAutor,  String titulo, Integer anoPublicacion) {

        String url = "jdbc:sqlite:autores.sqlite";

        String sql = """
            INSERT INTO Obra(id_autor, titulo, ano_publicacion)
            VALUES (?, ?, ?)
        """;

        try (Connection conexion = DriverManager.getConnection(url);
             PreparedStatement ps = conexion.prepareStatement(sql)) {

            ps.setInt(1, idAutor);
            ps.setString(2, titulo);
            ps.setInt(3, anoPublicacion);

            int filas = ps.executeUpdate();
            return filas > 0;

        } catch (SQLException e) {
            System.err.println(e.getMessage());
            return false;
        }
    }

    private static Boolean modificarObra(Integer id, Integer idAutor, String titulo,    Integer anoPublicacion) {

        String url = "jdbc:sqlite:autores.sqlite";

        String sql = """
            UPDATE Obra
            SET id_autor = ?, titulo = ?, ano_publicacion = ?
            WHERE id = ?
        """;

        try (Connection conexion = DriverManager.getConnection(url);
             PreparedStatement ps = conexion.prepareStatement(sql)) {

            ps.setInt(1, idAutor);
            ps.setString(2, titulo);
            ps.setInt(3, anoPublicacion);
            ps.setInt(4, id);

            int filas = ps.executeUpdate();
            return filas > 0;

        } catch (SQLException e) {
            System.err.println(e.getMessage());
            return false;
        }
    }

    private static Boolean eliminarObra(Integer id) {

        String url = "jdbc:sqlite:autores.sqlite";

        String sql = """
            DELETE FROM Obra
            WHERE id = ?
        """;

        try (Connection conexion = DriverManager.getConnection(url);
             PreparedStatement ps = conexion.prepareStatement(sql)) {

            ps.setInt(1, id);

            int filas = ps.executeUpdate();
            return filas > 0;

        } catch (SQLException e) {
            System.err.println(e.getMessage());
            return false;
        }
    }
}