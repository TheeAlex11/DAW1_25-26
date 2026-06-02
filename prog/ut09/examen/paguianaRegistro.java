


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;
import java.util.Scanner;
public class paguianaRegistro {



    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String opcion;

        do {
            System.out.println("Iniciando registro de obras y autores...");
            System.out.println("|-----------------------------------------------------------------------|");
            System.out.println("|           Bienvenido a la página de registro de obras.                |");
            System.out.println("|-----------------------------------------------------------------------|");
            System.out.println("|              Seleccione una de las siguientes opciones:               |");
            System.out.println("|                             1. Insertar obra                          |");
            System.out.println("|                             2. Insertar autor                         |");
            System.out.println("|                             3. Buscar obra                            |");
            System.out.println("|                             4. Buscar autor                           |");
            System.out.println("|                             5. Modificar obra                         |");
            System.out.println("|                             6. Modificar autor                        |");
            System.out.println("|                             7. Borrar obra                            |");
            System.out.println("|                             8. Borrar autor                           |");
            System.out.println("|                             x. Salir                                  |");
            System.out.println("|-----------------------------------------------------------------------|");

            opcion = scanner.nextLine();

            switch (opcion) {
                case "1": {
                    System.out.print("Ingrese el nombre del autor: ");
                    String nombreAutor = scanner.nextLine();
                    System.out.print("Ingrese el título de la obra: ");
                    String titulo = scanner.nextLine();
                    System.out.print("Ingrese el año de publicación: ");
                    Integer anoPublicacion = Integer.parseInt(scanner.nextLine());
                    insertarObra(nombreAutor, titulo, anoPublicacion);
                    System.out.println("Obra insertada");
                    break;
                }
                case "2": {
                    System.out.print("Ingrese el nombre del autor: ");
                    String Au_nombre = scanner.nextLine();
                    System.out.print("Ingrese la nacionalidad del autor: ");
                    String AU_nacionalidad = scanner.nextLine();
                    insertarAutor(Au_nombre, AU_nacionalidad);
                    System.out.println("Autor insertado");
                    break;
                }
                case "3": {
                    System.out.print("Ingrese el ID de la obra a buscar: ");
                    Integer idObra = Integer.parseInt(scanner.nextLine());
                    buscarObra(idObra);
                    break;
                }
                case "4": {
                    System.out.print("Ingrese el ID del autor a buscar: ");
                    Integer idAutor = Integer.parseInt(scanner.nextLine());
                    buscarAutor(idAutor);
                    break;
                }
                case "5": {
                    System.out.print("Ingrese el ID de la obra a modificar: ");
                    Integer idObra = Integer.parseInt(scanner.nextLine());
                    System.out.print("Ingrese el nuevo ID del autor: ");
                    Integer idAutor = Integer.parseInt(scanner.nextLine());
                    System.out.print("Ingrese el nuevo título de la obra: ");
                    String titulo = scanner.nextLine();
                    System.out.print("Ingrese el nuevo año de publicación: ");
                    Integer anoPublicacion = Integer.parseInt(scanner.nextLine());
                    modificarObra(idObra, idAutor, titulo, anoPublicacion);
                    break;
                }
                case "6": {
                    System.out.print("Ingrese el ID del autor a modificar: ");
                    Integer idAutor = Integer.parseInt(scanner.nextLine());
                    System.out.print("Ingrese el nuevo nombre del autor: ");
                    String nombre = scanner.nextLine();
                    System.out.print("Ingrese la nueva nacionalidad del autor: ");
                    String nacionalidad = scanner.nextLine();
                    modificarAutor(idAutor, nombre, nacionalidad);
                    break;
                }
                case "7": {
                    System.out.print("Ingrese el ID de la obra a borrar: ");
                    Integer idObra = Integer.parseInt(scanner.nextLine());
                    borrarObra(idObra);
                    break;
                }
                case "8": {
                    System.out.print("Ingrese el ID del autor a borrar: ");
                    Integer idAutorEliminar = Integer.parseInt(scanner.nextLine());
                    borrarAutor(idAutorEliminar);
                    break;
                }
                case "x":
                case "X":
                    System.out.println("Saliendo del programa...");
                    break;
                default:
                    System.out.println("Opción no válida. Por favor, seleccione una opción válida.");
            }

            System.out.println();
        } while (!"x".equalsIgnoreCase(opcion));

        scanner.close();
    }

    private static void insertarObra(String nombreAutor, String titulo, Integer anoPublicacion) {
        String url = "jdbc:sqlite:autores.sqlite";
        int idAutor = getOrCreateAuthorId(nombreAutor);

        String sqlInsertar = """
                INSERT INTO Obra (id_autor, titulo, ano_publicacion)
                VALUES (?, ?, ?);
                """;
        try (Connection conexion = DriverManager.getConnection(url)) {
            try (PreparedStatement sentencia = conexion.prepareStatement(
                    sqlInsertar,
                    Statement.RETURN_GENERATED_KEYS
            )) {
                sentencia.setInt(1, idAutor);
                sentencia.setString(2, titulo);
                if (anoPublicacion != null) {
                    sentencia.setInt(3, anoPublicacion);
                } else {
                    sentencia.setNull(3, java.sql.Types.INTEGER);
                }

                int filasInsertadas = sentencia.executeUpdate();
            }
        } catch (SQLException e) {
            System.err.println("Error al insertar la obra:");
            System.err.println(e.getMessage());
        }

    }

    private static int getOrCreateAuthorId(String nombreAutor) {
        String url = "jdbc:sqlite:autores.sqlite";
        String sqlSelect = "SELECT id FROM Autor WHERE nombre = ? LIMIT 1";
        try (Connection conexion = DriverManager.getConnection(url)) {
            try (PreparedStatement ps = conexion.prepareStatement(sqlSelect)) {
                ps.setString(1, nombreAutor);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        return rs.getInt("id");
                    }
                }
            }

            String sqlInsert = "INSERT INTO Autor (nombre) VALUES (?)";
            try (PreparedStatement psInsert = conexion.prepareStatement(sqlInsert, Statement.RETURN_GENERATED_KEYS)) {
                psInsert.setString(1, nombreAutor);
                int affected = psInsert.executeUpdate();
                try (ResultSet keys = psInsert.getGeneratedKeys()) {
                    if (keys.next()) {
                        return keys.getInt(1);
                    }
                }
            }
        } catch (SQLException e) {
            System.err.println("Error al obtener/crear autor:");
            System.err.println(e.getMessage());
        }
        return -1;
    }
    private static void insertarAutor(String nombre, String nacionalidad) {
        String url = "jdbc:sqlite:autores.sqlite";
        String sqlInsertar = """
                INSERT INTO Autor (nombre, nacionalidad)
                VALUES (?, ?);
                """;
        try (Connection conexion = DriverManager.getConnection(url)) {
            try (PreparedStatement sentencia = conexion.prepareStatement(
                    sqlInsertar,
                    Statement.RETURN_GENERATED_KEYS
            )) {
                sentencia.setString(1, nombre);
                sentencia.setString(2, nacionalidad);

                int filasInsertadas = sentencia.executeUpdate();
            } catch (SQLException e) {
                System.err.println("Error al insertar el autor:");
                System.err.println(e.getMessage());
            }
        } catch (SQLException e) {
            System.err.println("Error de conexión al insertar autor:");
            System.err.println(e.getMessage());
        }
    }

    private static void buscarObra(Integer id_Obra) {
        String url = "jdbc:sqlite:autores.sqlite";
        String sql = "SELECT id, id_autor, titulo, ano_publicacion FROM Obra WHERE id = ?";

        try (Connection con = DriverManager.getConnection(url);
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id_Obra);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    System.out.println("ID | ID_AUTOR | TITULO | AÑO DE PUBLICACION");
                    System.out.println("---------------------------------");
                    Integer id = rs.getInt("id");
                    Integer id_autor = rs.getInt("id_autor");
                    String titulo = rs.getString("titulo");
                    Integer ano_publicacion = rs.getInt("ano_publicacion");
                    System.out.printf("%d | %d | %s | %d%n", id, id_autor, titulo, ano_publicacion);
                } else {
                    System.out.println("Obra con id " + id_Obra + " no encontrada.");
                }
            }
        } catch (SQLException e) {
            System.err.println("Error buscando obra:");
            System.err.println(e.getMessage());
        }
    }

    private static void buscarAutor(Integer id_autor) {
        String url = "jdbc:sqlite:autores.sqlite";
        String sql = "SELECT id, nombre, nacionalidad FROM Autor WHERE id = ?";

        try (Connection con = DriverManager.getConnection(url);
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id_autor);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    System.out.println("ID | NOMBRE | NACIONALIDAD");
                    System.out.println("---------------------------------");
                    int id = rs.getInt("id");
                    String nombre = rs.getString("nombre");
                    String nac = rs.getString("nacionalidad");
                    System.out.printf("%d | %s | %s%n", id, nombre, nac);
                } else {
                    System.out.println("Autor con id " + id_autor + " no encontrado.");
                }
            }

        } catch (SQLException e) {
            System.err.println("Error buscando autor:");
            e.printStackTrace();
        }
    }

    private static void borrarObra(Integer idObra) {
        String url = "jdbc:sqlite:autores.sqlite";
        String sql = "DELETE FROM Obra WHERE id = ?";

        try (Connection con = DriverManager.getConnection(url);
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, idObra);
            int filas = ps.executeUpdate();
            if (filas > 0) {
                System.out.println("Obra con id " + idObra + " borrada correctamente.");
            } else {
                System.out.println("No se encontró ninguna obra con id " + idObra + ".");
            }
        } catch (SQLException e) {
            System.err.println("Error borrando la obra:");
            System.err.println(e.getMessage());
        }
    }

    private static void borrarAutor(Integer idAutor) {
        String url = "jdbc:sqlite:autores.sqlite";
        String sql = "DELETE FROM Autor WHERE id = ?";

        try (Connection con = DriverManager.getConnection(url);
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, idAutor);
            int filas = ps.executeUpdate();
            if (filas > 0) {
                System.out.println("Autor con id " + idAutor + " borrado correctamente.");
            } else {
                System.out.println("No se encontró ningún autor con id " + idAutor + ".");
            }
        } catch (SQLException e) {
            System.err.println("Error borrando el autor:");
            System.err.println(e.getMessage());
        }
    }

    private static void modificarObra(Integer id, Integer idAutor, String titulo, Integer anoPublicacion) {
        String url = "jdbc:sqlite:autores.sqlite";
        String sql = "UPDATE Obra SET id_autor = ?, titulo = ?, ano_publicacion = ? WHERE id = ?";

        try (Connection con = DriverManager.getConnection(url);
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, idAutor);
            ps.setString(2, titulo);
            ps.setInt(3, anoPublicacion);
            ps.setInt(4, id);

            int filas = ps.executeUpdate();
            if (filas > 0) {
                System.out.println("Obra con id " + id + " modificada correctamente.");
            } else {
                System.out.println("No se encontró ninguna obra con id " + id + ".");
            }
        } catch (SQLException e) {
            System.err.println("Error modificando la obra:");
            System.err.println(e.getMessage());
        }
    }

    private static void modificarAutor(Integer id, String nombre, String nacionalidad) {
        String url = "jdbc:sqlite:autores.sqlite";
        String sql = "UPDATE Autor SET nombre = ?, nacionalidad = ? WHERE id = ?";

        try (Connection con = DriverManager.getConnection(url);
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, nombre);
            ps.setString(2, nacionalidad);
            ps.setInt(3, id);

            int filas = ps.executeUpdate();
            if (filas > 0) {
                System.out.println("Autor con id " + id + " modificado correctamente.");
            } else {
                System.out.println("No se encontró ningún autor con id " + id + ".");
            }
        } catch (SQLException e) {
            System.err.println("Error modificando el autor:");
            System.err.println(e.getMessage());
        }
    }
 }
			
