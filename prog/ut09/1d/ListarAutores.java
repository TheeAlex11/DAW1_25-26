import java.sql.*;

public class ListarAutores {
    public static void main(String[] args) {
        String url = "jdbc:sqlite:autores.sqlite"; // URL de conexión a la base de datos SQLite
        String sql = "SELECT id, nombre, nacionalidad FROM Autor"; // Consulta SQL para listar autores

        try (
                Connection conexion = DriverManager.getConnection(url); // Establecer conexión
                PreparedStatement sentencia = conexion.prepareStatement(sql); // Preparar la sentencia SQL
                ResultSet resultado = sentencia.executeQuery() // Ejecutar la consulta
        ) {
        } catch (Exception e) {
            e.printStackTrace(); // Manejar cualquier excepción que ocurra
        }
        System.out.println("ID\tNombre\tNacionalidad"); // Imprimir encabezados de las columnas
    }
}