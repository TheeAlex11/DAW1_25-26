	import java.sql.Connection;
	import java.sql.DriverManager;
	import java.sql.PreparedStatement;
	import java.sql.SQLException;
	import java.sql.Statement;

	public class BorrarModificarAutor {

		public static void main(String[] args) {

			//1. Establecemos la URL de conexión con la base de datos
			String url = "jdbc:sqlite:autores.sqlite";

			//2. Definimos las sentencia SQL que queremos ejecutar.
			String sqlActualizar = "UPDATE Autor SET nombre = ?, nacionalidad = ? WHERE id = ?";
			String sqlEliminar = "DELETE FROM Autor WHERE id = ?";

			//3. Intentamos realizar la conexión en un "try con recursos"
			// En el mismo try, creamos las sentencias.
			try (Connection conexion = DriverManager.getConnection(url);
				 Statement sentencia = conexion.createStatement()) {

				//4. Establecemos el valor de los datos a insertar
				Integer[] ids = {1, 2};	//Asegúrate de tener estos ids en la tabla de Autores
				String[] nombres = {"Isaac Asimov", "J.R. Tolikien"};
				String[] nacionalidades = {"Estadounidense", "Británica"};

				//5. Intentamos preparar la sentencia.
				try (PreparedStatement ps = conexion.prepareStatement(sqlActualizar)) {

					//6. Asociamos los datos a los parámetros de la sentencia preparada
					for (int i = 0; i < ids.length; i++){
						ps.setString(1, nombres[i]);
						ps.setString(2, nacionalidades[i]);
						ps.setInt(3, ids[i]);

						//7. Ejecutamos la sentencia preparada
						ps.executeUpdate();

						System.out.println("Autor modificado correctamente.");
					}
				}
				//8. Intentamos preparar la sentencia de borrado.
				try (PreparedStatement ps = conexion.prepareStatement(sqlEliminar)) {

					//6. Asociamos los datos a los parámetros de la sentencia preparada
					for (int i = 0; i < ids.length; i++){
						ps.setInt(1, ids[i]);

						//7. Ejecutamos la sentencia preparada
						ps.executeUpdate();

						System.out.println("Autor eliminado correctamente.");
					}
				}

			} catch (SQLException e) {
				System.err.println("Error en la operación de base de datos:");
				System.err.println(e.getMessage());
			}
		}
	}				

		