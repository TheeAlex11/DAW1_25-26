import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class testConstructor {
    @Test
    public void testConstructor() {
        Cruzador cruzador = new Cruzador();
        assertNotEquals(null, cruzador);
    }

    @Test
    public void testCalcular(){
        Double resultado = Cruzador.calcular(0, 29, 0, 315000, -21, 0, 1);
        assertEquals(6300, resultado, 0.01);
    }
}
