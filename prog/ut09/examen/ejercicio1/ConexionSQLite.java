
	import java.sql.Connection;
	import java.sql.DriverManager;
	import java.sql.SQLException;

	public class ConexionSQLite {

		public static void main(String[] args) {
			String url = "jdbc:sqlite:autores.sqlite";

			try (Connection conexion = DriverManager.getConnection(url)) {
				System.out.println("Conexión establecida correctamente.");
			} catch (SQLException e) {
				System.out.println("Error al conectar con la base de datos.");
				System.out.println(e.getMessage());
			}
		}
	}