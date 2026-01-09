import java.nio.file.Files;
import java.nio.file.Paths;

public class TestPersonaje2 {
        static int testsTotales = 0;
        
    public static void main(String[] args){ 
        int testsPasados = 0;
        
        testsPasados += testSetNombreExcepcion();
        testsPasados += testSetNivelExcepcion();
        testsPasados += testSetPuntosVidaExcepcion();
        testsPasados += testSetPuntosVidaMaximosExcepcion();
        
        // Resumen
        System.out.println("Resumen TestPersonaje: " + testsPasados + "/" + testsTotales + "\n");
        
        try {
            Files.writeString(Paths.get("resultados.tmp"), testsPasados + "/" + testsTotales);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static int testSetNombreExcepcion() {
        testsTotales++;
        try{
            System.out.print("Test: Setter de nombre con valor nulo o vacío... ");
            Personaje p = new Personaje("Aragorn", 10, 100);
            try {
                p.setNombre("");
                System.out.println("✗ FALLÓ: No se lanzó excepción para nombre vacío");
                return 0;
            } catch (IllegalArgumentException e) {
                // Esperado
            }
            try {
                p.setNombre(null);
                System.out.println("✗ FALLÓ: No se lanzó excepción para nombre nulo");
                return 0;
            } catch (IllegalArgumentException e) {
                // Esperado
            }
            System.out.println("✓ OK");
            return 1;
        } catch (Throwable e) {
            System.out.println("✗ FALLÓ: " + e.getMessage());
            return 0;
        }
    }
    private static int testSetNivelExcepcion() {
        testsTotales++;
        try{
            System.out.print("Test: Setter de nivel con valor fuera de rango... ");
            Personaje p = new Personaje("Aragorn", 10, 100);
            try {
                p.setNivel(0);
                System.out.println("✗ FALLÓ: No se lanzó excepción para nivel fuera de rango");
                return 0;
            } catch (IllegalArgumentException e) {
                // Esperado
            }
            try {
                p.setNivel(11);
                System.out.println("✗ FALLÓ: No se lanzó excepción para nivel fuera de rango");
                return 0;
            } catch (IllegalArgumentException e) {
                // Esperado
            }
            p.setNivel(null);
            assert p.getNivel() == 1 : "El nivel debería establecerse a 1 si se pasa null";
            System.out.println("✓ OK");
            return 1;
        } catch (Throwable e) {
            System.out.println("✗ FALLÓ: " + e.getMessage());
            return 0;
        }
    }
    private static int testSetPuntosVidaExcepcion() {
        testsTotales++;
        try{
            System.out.print("Test: Setter de puntos de vida con valores fuera de rango... ");
            Personaje p = new Personaje("Aragorn", 10, 100);
            try {
                p.setPuntosVida(-1);
                System.out.println("✗ FALLÓ: No se lanzó excepción para puntos de vida negativos.");
                return 0;
            } catch (IllegalArgumentException e) {
                // Esperado
            }
            try {
                p.setPuntosVida(null);
                System.out.println("✗ FALLÓ: No se lanzó excepción para puntos de vida nulos.");
                return 0;
            } catch (IllegalArgumentException e) {
                // Esperado
            }
            p.setPuntosVida(101);
            assert p.getPuntosVida() == 100 : "Los puntos de vida no deberían superar los puntos de vida máximos.";
            System.out.println("✓ OK");
            return 1;
        } catch (Throwable e) {
            System.out.println("✗ FALLÓ: " + e.getMessage());
            return 0;
        }
    }
    private static int testSetPuntosVidaMaximosExcepcion() {
        testsTotales++;
        try{
            System.out.print("Test: Setter de puntos de vida máximos con valores fuera de rango... ");
            Personaje p = new Personaje("Aragorn", 10, 100);
            try {
                p.setPuntosVidaMaximos(-1);
                System.out.println("✗ FALLÓ: No se lanzó excepción para puntos de vida maximos negativos.");
                return 0;
            } catch (IllegalArgumentException e) {
                // Esperado
            }
            try {
                p.setPuntosVidaMaximos(null);
                System.out.println("✗ FALLÓ: No se lanzó excepción para puntos de vida maximos nulos.");
                return 0;
            } catch (IllegalArgumentException e) {
                // Esperado
            }
            try {
                p.setPuntosVidaMaximos(0    );
                System.out.println("✗ FALLÓ: No se lanzó excepción para puntos de vida maximos cero.");
                return 0;
            } catch (IllegalArgumentException e) {
                // Esperado
            }
            System.out.println("✓ OK");
            return 1;
        } catch (Throwable e) {
            System.out.println("✗ FALLÓ: " + e.getMessage());
            return 0;
        }
    }
}
