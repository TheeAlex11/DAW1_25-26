import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class ClaseATest {

    @Test
    public void testDoblarNumeroPositivo() {
        Double resultado = ClaseA.doblar(5.0);
        assertEquals(10.0, resultado, 0.001);
    }

    @Test
    public void testDoblarNumeroNegativo() {
        Double resultado = ClaseA.doblar(-3.5);
        assertEquals(-7.0, resultado, 0.001);
    }

    @Test
    public void testDoblarCero() {
        Double resultado = ClaseA.doblar(0.0);
        assertEquals(0.0, resultado, 0.001);
    }

    @Test
    public void testDoblarNull() {
        Double resultado = ClaseA.doblar(null);
        assertNull(resultado);
    }

    @Test
    public void testDoblarNumeroDecimal() {
        Double resultado = ClaseA.doblar(2.5);
        assertEquals(5.0, resultado, 0.001);
    }
}