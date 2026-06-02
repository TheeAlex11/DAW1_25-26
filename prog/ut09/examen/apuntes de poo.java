import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

class Autor {
    private int id;
    private String nombre;
    private String nacionalidad;

    public Autor() {}

    public Autor(String nombre, String nacionalidad) {
        this.nombre = nombre;
        this.nacionalidad = nacionalidad;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getNacionalidad() {
        return nacionalidad;
    }

    public void setNacionalidad(String nacionalidad) {
        this.nacionalidad = nacionalidad;
    }
}

class Obra {
    private int id;
    private int idAutor;
    private String titulo;
    private int anoPublicacion;

    public Obra() {}

    public Obra(int idAutor, String titulo, int anoPublicacion) {
        this.idAutor = idAutor;
        this.titulo = titulo;
        this.anoPublicacion = anoPublicacion;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdAutor() {
        return idAutor;
    }

    public void setIdAutor(int idAutor) {
        this.idAutor = idAutor;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public int getAnoPublicacion() {
        return anoPublicacion;
    }

    public void setAnoPublicacion(int anoPublicacion) {
        this.anoPublicacion = anoPublicacion;
    }
}

class ConexionBD {
    private static final String URL = "jdbc:sqlite:autores.sqlite";

    public static Connection conectar() throws SQLException {
        return DriverManager.getConnection(URL);
    }
}

class AutorDAO {
    public void insertar(Autor autor) {
        String sql = """
                INSERT INTO Autor(nombre, nacionalidad)
                VALUES (?, ?)
                """;

        try (Connection con = ConexionBD.conectar();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, autor.getNombre());
            ps.setString(2, autor.getNacionalidad());
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Autor buscar(int id) {
        String sql = "SELECT * FROM Autor WHERE id = ?";

        try (Connection con = ConexionBD.conectar();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
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
        return null;
    }

    public boolean modificar(Autor autor) {
        String sql = "UPDATE Autor SET nombre = ?, nacionalidad = ? WHERE id = ?";

        try (Connection con = ConexionBD.conectar();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, autor.getNombre());
            ps.setString(2, autor.getNacionalidad());
            ps.setInt(3, autor.getId());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

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

class ObraDAO {
    public void insertar(Obra obra) {
        String sql = """
                INSERT INTO Obra(id_autor, titulo, ano_publicacion)
                VALUES (?, ?, ?)
                """;

        try (Connection con = ConexionBD.conectar();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, obra.getIdAutor());
            ps.setString(2, obra.getTitulo());
            ps.setInt(3, obra.getAnoPublicacion());
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Obra buscar(int id) {
        String sql = "SELECT * FROM Obra WHERE id = ?";

        try (Connection con = ConexionBD.conectar();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
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

public class Main {
    public static void main(String[] args) {
        AutorDAO autorDAO = new AutorDAO();
        Autor autor = new Autor("Miguel de Cervantes", "Española");
        autorDAO.insertar(autor);
        System.out.println("Autor insertado");

        Autor autorBuscado = autorDAO.buscar(1);
        if (autorBuscado != null) {
            autorBuscado.setNacionalidad("Española actualizada");
            if (autorDAO.modificar(autorBuscado)) {
                System.out.println("Autor modificado correctamente.");
            }
            if (autorDAO.eliminar(autorBuscado.getId())) {
                System.out.println("Autor eliminado correctamente.");
            }
        }
    }
}
