import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class calculadoraBasicaTest {
    @Test
    public void testConstructor() {
        calculadoraBasica calculadora = new calculadoraBasica();
        assertNotEquals(null, calculadora);
    }

    @Test
    public void testSumar() {
        calculadoraBasica calculadora = new calculadoraBasica();
        assertEquals(2, calculadora.sumar(1, 1));
        assertEquals(3, calculadora.sumar(2, 1));
        assertEquals(3, calculadora.sumar(1, 2));
        assertEquals(3, calculadora.sumar(5, -2));
        assertEquals(1, calculadora.sumar(0, 1));
    }

    @Test
    public void testRestar() {
        calculadoraBasica calculadora = new calculadoraBasica();
        assertEquals(2, calculadora.restar(3, 1));
        assertEquals(1, calculadora.restar(3, 2));
        assertEquals(-1, calculadora.restar(1, 2));
        assertEquals(-3, calculadora.restar(-5, -2));
        assertEquals(-1, calculadora.restar(0, 1));
    }

    @Test
    public void testMultiplicar() {
        calculadoraBasica calculadora = new calculadoraBasica();
        assertEquals(6, calculadora.multiplicar(2, 3));
        assertEquals(0, calculadora.multiplicar(0, 5));
        assertEquals(-6, calculadora.multiplicar(-2, 3));
        assertEquals(6, calculadora.multiplicar(-2, -3));
        assertEquals(15, calculadora.multiplicar(3, 5));
    }

    @Test
    public void testDividir() {
        calculadoraBasica calculadora = new calculadoraBasica();
        assertEquals(2, calculadora.dividir(6, 3));
        assertEquals(0, calculadora.dividir(0, 5));
        assertEquals(-2, calculadora.dividir(-6, 3));
        assertEquals(2, calculadora.dividir(-6, -3));
        assertEquals(0.6, calculadora.dividir(3, 5));
    }
}
