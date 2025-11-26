import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class testValidadorClave {
    @Test
    public void testValidadorClave() {
        ValidadorClave validadorclave = new ValidadorClave();
        assertNotEquals(null, validadorclave);
    }

    @Test
    public void testCalcular(){
        Double resultado = Cruzador.calcular(0, 29, 0, 315000, -21, 0, 1);
        assertEquals(6300, resultado, 0.01);
    }
}
