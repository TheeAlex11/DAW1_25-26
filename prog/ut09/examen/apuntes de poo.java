import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

// ========================
// CLASE MODELO: Autor
// Representa un registro de la tabla "Autor" en la base de datos
// ========================
class Autor {
    private int id;
    private String nombre;
    private String nacionalidad;

    // Constructor vacío necesario para crear objetos al leer de la BD
    public Autor() {}

    // Constructor para crear un autor nuevo (sin id, lo asigna la BD)
    public Autor(String nombre, String nacionalidad) {
        this.nombre = nombre;
        this.nacionalidad = nacionalidad;
    }

    // Getters y setters — permiten acceder y modificar los atributos privados
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public String getNacionalidad() { return nacionalidad; }
    public void setNacionalidad(String nacionalidad) { this.nacionalidad = nacionalidad; }
}

// ========================
// CLASE MODELO: Obra
// Representa un registro de la tabla "Obra" en la base de datos
// Cada obra pertenece a un autor mediante idAutor (clave foránea)
// ========================
class Obra {
    private int id;
    private int idAutor;       // Clave foránea que referencia a Autor
    private String titulo;
    private int anoPublicacion;

    // Constructor vacío necesario para mapear resultados de la BD
    public Obra() {}

    // Constructor para crear una obra nueva (sin id, lo asigna la BD)
    public Obra(int idAutor, String titulo, int anoPublicacion) {
        this.idAutor = idAutor;
        this.titulo = titulo;
        this.anoPublicacion = anoPublicacion;
    }

    // Getters y setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getIdAutor() { return idAutor; }
    public void setIdAutor(int idAutor) { this.idAutor = idAutor; }

    public String getTitulo() { return titulo; }
    public void setTitulo(String titulo) { this.titulo = titulo; }

    public int getAnoPublicacion() { return anoPublicacion; }
    public void setAnoPublicacion(int anoPublicacion) { this.anoPublicacion = anoPublicacion; }
}

// ========================
// CLASE DE CONEXIÓN
// Centraliza la configuración de la conexión a la base de datos SQLite
// ========================
class ConexionBD {
    // Ruta del archivo SQLite local
    private static final String URL = "jdbc:sqlite:autores.sqlite";

    // Devuelve una nueva conexión activa a la BD
    // Se lanza SQLException si no se puede establecer la conexión
    public static Connection conectar() throws SQLException {
        return DriverManager.getConnection(URL);
    }
}

// ========================
// DAO: AutorDAO
// Patrón DAO (Data Access Object): encapsula todas las operaciones
// CRUD sobre la tabla "Autor", aislando el acceso a datos del resto
// ========================
class AutorDAO {

    // INSERT — Inserta un nuevo autor en la base de datos
    public void insertar(Autor autor) {
        String sql = """
                INSERT INTO Autor(nombre, nacionalidad)
                VALUES (?, ?)
                """;

        // try-with-resources: cierra automáticamente Connection y PreparedStatement
        try (Connection con = ConexionBD.conectar();
             PreparedStatement ps = con.prepareStatement(sql)) {

            // Se asignan los valores a los parámetros (?) para evitar inyección SQL
            ps.setString(1, autor.getNombre());
            ps.setString(2, autor.getNacionalidad());
            ps.executeUpdate(); // Ejecuta la sentencia

        } catch (Exception e) {
            e.printStackTrace(); // Muestra el error en consola si falla
        }
    }

    // SELECT — Busca un autor por su id y lo devuelve como objeto Autor
    // Devuelve null si no se encuentra ningún registro con ese id
    public Autor buscar(int id) {
        String sql = "SELECT * FROM Autor WHERE id = ?";

        try (Connection con = ConexionBD.conectar();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);

            // ResultSet contiene las filas devueltas por la consulta
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) { // Si existe al menos una fila
                    // Se mapean las columnas del ResultSet al objeto Autor
                    Autor autor = new Autor();
                    autor.setId(rs.getInt("id"));
                    autor.setNombre(rs.getString("nombre"));
                    autor.setNacionalidad(rs.getString("nacionalidad"));
                    return autor;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null; // No se encontró el autor
    }

    // UPDATE — Actualiza nombre y nacionalidad de un autor existente
    // Devuelve true si se modificó al menos una fila, false en caso contrario
    public boolean modificar(Autor autor) {
        String sql = "UPDATE Autor SET nombre = ?, nacionalidad = ? WHERE id = ?";

        try (Connection con = ConexionBD.conectar();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, autor.getNombre());
            ps.setString(2, autor.getNacionalidad());
            ps.setInt(3, autor.getId());

            // executeUpdate() devuelve el número de filas afectadas
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // DELETE — Elimina un autor por su id
    // Devuelve true si se eliminó correctamente, false si no existía
    public boolean eliminar(int id) {
        String sql = "DELETE FROM Autor WHERE id = ?";

        try (Connection con = ConexionBD.conectar();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}

// ========================
// DAO: ObraDAO
// Mismo patrón DAO aplicado a la tabla "Obra"
// ========================
class ObraDAO {

    // INSERT — Inserta una nueva obra vinculada a un autor
    public void insertar(Obra obra) {
        String sql = """
                INSERT INTO Obra(id_autor, titulo, ano_publicacion)
                VALUES (?, ?, ?)
                """;

        try (Connection con = ConexionBD.conectar();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, obra.getIdAutor());       // Clave foránea del autor
            ps.setString(2, obra.getTitulo());
            ps.setInt(3, obra.getAnoPublicacion());
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // SELECT — Busca una obra por id y la devuelve como objeto Obra
    public Obra buscar(int id) {
        String sql = "SELECT * FROM Obra WHERE id = ?";

        try (Connection con = ConexionBD.conectar();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    // Mapeo de columnas a atributos del objeto
                    Obra obra = new Obra();
                    obra.setId(rs.getInt("id"));
                    obra.setIdAutor(rs.getInt("id_autor"));
                    obra.setTitulo(rs.getString("titulo"));
                    obra.setAnoPublicacion(rs.getInt("ano_publicacion"));
                    return obra;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // UPDATE — Actualiza todos los campos de una obra existente
    public boolean modificar(Obra obra) {
        String sql = "UPDATE Obra SET id_autor = ?, titulo = ?, ano_publicacion = ? WHERE id = ?";

        try (Connection con = ConexionBD.conectar();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, obra.getIdAutor());
            ps.setString(2, obra.getTitulo());
            ps.setInt(3, obra.getAnoPublicacion());
            ps.setInt(4, obra.getId());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // DELETE — Elimina una obra por su id
    public boolean eliminar(int id) {
        String sql = "DELETE FROM Obra WHERE id = ?";

        try (Connection con = ConexionBD.conectar();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}

// ========================
// CLASE PRINCIPAL
// Punto de entrada del programa. Demuestra el ciclo CRUD completo sobre Autor
// ========================
public class Main {
    public static void main(String[] args) {

        AutorDAO autorDAO = new AutorDAO();

        // 1. Crear e insertar un autor nuevo
        Autor autor = new Autor("Miguel de Cervantes", "Española");
        autorDAO.insertar(autor);
        System.out.println("Autor insertado");

        // 2. Buscar el autor recién insertado por su id (asignado por la BD)
        Autor autorBuscado = autorDAO.buscar(1);

        if (autorBuscado != null) {

            // 3. Modificar un campo y actualizar en la BD
            autorBuscado.setNacionalidad("Española actualizada");
            if (autorDAO.modificar(autorBuscado)) {
                System.out.println("Autor modificado correctamente.");
            }

            // 4. Eliminar el autor de la BD
            if (autorDAO.eliminar(autorBuscado.getId())) {
                System.out.println("Autor eliminado correctamente.");
            }
        }
    }
}