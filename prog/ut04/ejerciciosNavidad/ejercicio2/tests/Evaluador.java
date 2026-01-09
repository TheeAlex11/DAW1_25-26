import java.io.InputStream;
import java.io.File;
import java.nio.file.Paths;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Properties;
import java.util.List;
import java.util.ArrayList;
import java.util.Collections;
import java.util.stream.Stream;

/**
 * Clase principal para ejecutar pruebas unitarias.
 * 
 * Lee la configuración desde un archivo properties, verifica el sistema
 * operativo, compila las fuentes y los tests.
 * 
 * @version 1.0
 *          Debe ejecutarse desde el directorio del proyecto.
 */

public class Evaluador {
    public static void main(String[] args) throws Exception {
        System.out.println("Iniciando Evaluador...");
        Path pathConfig = Paths.get("tests").resolve("evaluador.properties");

        try (InputStream input = Files.newInputStream(pathConfig)) {
            Properties propiedades = new Properties();
            propiedades.load(input);

            String version = propiedades.getProperty("version");
            System.out.println("Evaluador versión " + version);
            System.out.println("Compilando fuentes...");
            if (!compilarFuentes()) {
                System.out.println("Fallo la compilacion de las fuentes. Abortando.");
                return;
            }
            System.out.println("Compilando tests...");
            if (!compilarTests()) {
                System.out.println("Fallo la compilacion de los tests. Abortando.");
                return;
            }
            System.out.println("Compilacion exitosa de fuentes y tests.");

            System.out.println("Buscando clases de Test...");
            String classpath = "compilados" + File.pathSeparator + Paths.get("tests", "compilados").toString();
            List<String> clasesTest = buscarClasesTest("tests" + File.separator + "compilados", classpath);
            if (clasesTest.isEmpty()) {
                System.out.println("No se encontraron clases de test para ejecutar.");
                return;
            }

            System.out.println("Ejecutando Tests...");
            ejecutarTests(clasesTest, classpath);
        } catch (Throwable e) {
            e.printStackTrace();
        }
    }

    private static boolean compilarFuentes() throws Exception {
        Path fuentesDir = Paths.get("fuentes");
        return compilar(fuentesDir, "compilados", null);
    }

    private static boolean compilarTests() throws Exception {
        Path testsDir = Paths.get("tests");
        String classpath = "compilados" + File.pathSeparator + Paths.get("..", "compilados").toString();
        return compilar(testsDir, "tests/compilados", classpath);
    }

    private static boolean compilar(Path dir, String outputDir, String classpath) throws Exception {
        // System.out.println("Compilando en: " + dir.toString());
        if (!Files.exists(dir) || !Files.isDirectory(dir)) {
            System.out.println("El directorio " + dir + " no existe o no es un directorio.");
            return false;
        }

        List<String> javaFiles = new ArrayList<>();
        try (Stream<Path> stream = Files.walk(dir)) {
            stream.filter(p -> Files.isRegularFile(p) && p.toString().endsWith(".java"))
                    .forEach(p -> javaFiles.add(p.toString()));
        }

        if (javaFiles.isEmpty()) {
            System.out.println("No se encontraron archivos .java en " + dir);
            return false;
        }

        // Ensure output directory exists
        Files.createDirectories(Paths.get(outputDir));

        List<String> command = new ArrayList<>();
        command.add("javac");
        command.add("-d");
        command.add(outputDir);
        if (classpath != null && !classpath.isEmpty()) {
            command.add("-cp");
            command.add(classpath);
        }
        command.addAll(javaFiles);

        ProcessBuilder processBuilder = new ProcessBuilder(command);
        processBuilder.inheritIO();
        Process process = processBuilder.start();
        int exitCode = process.waitFor();
        if (exitCode == 0) {
            System.out.println("Compilación exitosa.");
        } else {
            System.out.println("Error en la compilación. Código de salida: " + exitCode);
        }
        return exitCode == 0;
    }

    private static List<String> buscarClasesTest(String dirTests, String classpath) throws Exception {
        Path pathDirTests = Paths.get(dirTests);
        if (!Files.exists(pathDirTests) || !Files.isDirectory(pathDirTests))
            throw new Exception(
                    "El directorio " + dirTests + " no existe o no es un directorio. No se ejecutarán tests.");

        List<String> clasesTest = new ArrayList<>();
        try (Stream<Path> stream = Files.walk(pathDirTests)) {
            stream.filter(p -> Files.isRegularFile(p) && p.toString().endsWith(".class"))
                    .forEach(p -> {
                        Path rel = pathDirTests.relativize(p);
                        String className = rel.toString().replace(File.separatorChar, '.');
                        if (className.endsWith(".class")) {
                            className = className.substring(0, className.length() - 6);
                        }
                        // Filtrar por nombre simple que empiece por Test
                        String simple = className.contains(".") ? className.substring(className.lastIndexOf('.') + 1)
                                : className;
                        if (simple.startsWith("Test")) {
                            clasesTest.add(className);
                        }
                    });
        }
        Collections.sort(clasesTest);
        return clasesTest;
    }

    private static void ejecutarTests(List<String> clasesTest, String classpath) {
        // Leer resultados previos desde fichero (si existe)
        int testsPasados = 0;
        int testsTotales = 0;
        Path resultadosPath = Paths.get("resultados.tmp");

        for (String cls : clasesTest) {
            System.out.println("\n-> Ejecutando test: " + cls);
            try {
                ejecutarClase(cls, classpath);
                if (Files.exists(resultadosPath)) {
                    String contenido = new String(Files.readAllBytes(resultadosPath)).trim();
                    if (!contenido.isEmpty() && contenido.contains("/")) {
                        String[] partes = contenido.split("/");
                        testsPasados += Integer.parseInt(partes[0].trim());
                        testsTotales += Integer.parseInt(partes[1].trim());
                    }
                }
            } catch (Throwable e) {
                e.printStackTrace();
            }
        }
        System.out.println("=== RESUMEN FINAL ===");
        System.out.println("Tests pasados: " + testsPasados + "/" + testsTotales);
    }

    private static void ejecutarClase(String mainClass, String classpath) throws Exception {
        List<String> command = new ArrayList<>();
        command.add("java");

        if (classpath != null && !classpath.isEmpty()) {
            command.add("-enableassertions");
            command.add("-classpath");
            command.add(classpath);
        }
        command.add(mainClass);

        ProcessBuilder pb = new ProcessBuilder(command);
        pb.inheritIO();
        Process p = pb.start();
        p.waitFor();
    }

}
