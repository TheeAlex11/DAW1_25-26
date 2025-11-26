import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class ValidadorClaveTest {
    
    @Test
    public void testConstructor() {
        ValidadorClave validador = new ValidadorClave();
        assertNotEquals(null, validador);
    }

    @Test
    public void validarLongitud() {
        ValidadorClave validador = new ValidadorClave();
        assertEquals(true, validador.validarLongitud("12345678"));
        assertEquals(false, validador.validarLongitud("1234567"));
        assertEquals(false, validador.validarLongitud("true"));
        assertEquals(false, validador.validarLongitud(null));
    }

    @Test
    public void contieneMayuscula() {
        ValidadorClave validador = new ValidadorClave();
        assertEquals(true, validador.contieneMayuscula("HOLA5678"));
        assertEquals(false, validador.contieneMayuscula("d123456"));
        assertEquals(false, validador.contieneMayuscula("d12345"));
        assertEquals(false, validador.contieneMayuscula("true"));
        assertEquals(false, validador.contieneMayuscula(null));
    }

    @Test
    public void contieneDigito() {
        ValidadorClave validador = new ValidadorClave();
        assertEquals(true, validador.contieneDigito("HOLA5678"));
        assertEquals(true, validador.contieneDigito("d123456"));
        assertEquals(true, validador.contieneDigito("d12345"));
        assertEquals(false, validador.contieneDigito("true"));
    }

    @Test
    public void evaluarSeguridad() {
        ValidadorClave validador = new ValidadorClave();

        try {
            assertEquals(3, validador.evaluarSeguridad("HOLA5678"));
            assertEquals(2, validador.evaluarSeguridad("d123456"));
            assertEquals(2, validador.evaluarSeguridad("d12345"));
            assertEquals(1, validador.evaluarSeguridad("true"));
            assertEquals(null, validador.evaluarSeguridad(null));

        } catch (Exception e) {
            System.out.println(e);
        }

    }

}
