import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class TestPersonaje {
        static int testsTotales = 0;
        
    public static void main(String[] args){ 
        int testsPasados = 0;
        
        testsPasados += testConstructor();
        testsPasados += testEstaVivo();
        testsPasados += testToString();
        testsPasados += testSetters();
        testsPasados += testPuntosVidaMaximos();
    
        // Resumen
        System.out.println("Resumen TestPersonaje: " + testsPasados + "/" + testsTotales + "\n");
        
        try {
            Files.writeString(Paths.get("resultados.tmp"), testsPasados + "/" + testsTotales);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static int testConstructor() {
        testsTotales++;
        try{
            System.out.print("Test: Constructor y getters básicos... ");
            Personaje p = new Personaje("Aragorn", 10, 100);
        
            assert p.getNombre().equals("Aragorn") : "Nombre incorrecto";
            assert p.getNivel() == 10 : "Nivel incorrecto";
            assert p.getPuntosVida() == 100 : "Puntos de vida iniciales incorrectos";
            System.out.println("✓ OK");
            return 1;
        } catch (Throwable e) {
            System.out.println("✗ FALLÓ: " + e.getMessage());
            return 0;
        }
    }
    private static int testEstaVivo() {
        testsTotales++;
        try{
            System.out.print("Test: Método estaVivo()... ");
            Personaje p = new Personaje("Gimli", 5, 50);
        
            assert p.estaVivo() : "Debería estar vivo inicialmente";
            p.setPuntosVida(0);
            assert !p.estaVivo() : "Debería estar muerto con 0 puntos de vida";
            p.setPuntosVida(10);
            assert p.estaVivo() : "Debería estar vivo con puntos de vida positivos";
        
            System.out.println("✓ OK");
            return 1;
        } catch (Throwable e) {
            System.out.println("✗ FALLÓ: " + e.getMessage());
            return 0;
        }
    }
    private static int testToString() {
        testsTotales++;
        try{
            System.out.print("Test: Método toString()... ");
            Personaje p = new Personaje("Legolas", 8, 80);
            String esperado = "Legolas[Nivel 8] Vida: 80/80";
            assert p.toString().equals(esperado) : "toString() incorrecto. Esperado: \"" + esperado + "\", Obtenido: \"" + p.toString() + "\"";
        
            System.out.println("✓ OK");
            return 1;
        } catch (Throwable e) {
            System.out.println("✗ FALLÓ: " + e.getMessage());
            return 0;
        }
    }
    private static int testSetters() {
        testsTotales++;
        try{
            System.out.print("Test: Setters de nombre, nivel y puntos de vida... ");
            Personaje p = new Personaje("Frodo", 1, 30);
        
            p.setNombre("Sam");
            assert p.getNombre().equals("Sam") : "Setter de nombre falló";
        
            p.setNivel(2);
            assert p.getNivel() == 2 : "Setter de nivel falló";
        
            p.setPuntosVida(25);
            assert p.getPuntosVida() == 25 : "Setter de puntos de vida falló";
        
            System.out.println("✓ OK");
            return 1;
        } catch (Throwable e) {
            System.out.println("✗ FALLÓ: " + e.getMessage());
            return 0;
        }
    }
    private static int testPuntosVidaMaximos() {
        testsTotales++;
        try{
            System.out.print("Test: Puntos de vida máximos... ");
            Personaje p = new Personaje("Boromir", 7, 70);
        
            p.setPuntosVida(1000); // Asumimos que el máximo es 100
            assert p.getPuntosVida() <= 100 : "Los puntos de vida exceden el máximo permitido";
        
            System.out.println("✓ OK");
            return 1;
        } catch (Throwable e) {
            System.out.println("✗ FALLÓ: " + e.getMessage());
            return 0;
        }
    }
}
