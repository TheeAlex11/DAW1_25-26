import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;

import java.io.ByteArrayOutputStream;
import java.io.PrintStream;

import static org.junit.jupiter.api.Assertions.*;

/**
 * Tests de regresión para la clase Facturador
 * Verifica que la salida del programa contiene los valores esperados
 */
public class FacturadorTest {

    private final ByteArrayOutputStream salidaCapturada = new ByteArrayOutputStream();
    private final PrintStream salidaOriginal = System.out;

    @BeforeEach
    public void configurarCapturaSalida() {
        // Redirigir System.out a nuestro ByteArrayOutputStream
        System.setOut(new PrintStream(salidaCapturada));
    }

    @AfterEach
    public void restaurarSalida() {
        // Restaurar System.out original
        System.setOut(salidaOriginal);
    }

    @Test
    public void testSalidaCompletaFactura() throws Exception {
        // Ejecutar el programa
        Facturador.main(new String[]{});

        // Obtener la salida capturada
        String salida = salidaCapturada.toString();

        // Verificar cabecera y cliente
        assertTrue(salida.contains("FACTURA DE ACTUACIONES"), 
            "La salida debe contener la cabecera 'FACTURA DE ACTUACIONES'");
        assertTrue(salida.contains("Cliente: Ayuntamiento de Badajoz"), 
            "La salida debe contener el nombre del cliente");

        // Verificar base imponible
        assertTrue(salida.contains("BASE IMPONIBLE: 72800.0 euros"), 
            "La salida debe contener la base imponible correcta: 72800.0");

        // Verificar IVA
        assertTrue(salida.contains("IVA (21%): 15288.00 euros"), 
            "La salida debe contener el IVA correcto: 15288.00");

        // Verificar total factura
        assertTrue(salida.contains("TOTAL FACTURA: 88088.00 euros"), 
            "La salida debe contener el total correcto: 88088.00");

        // Verificar créditos obtenidos
        assertTrue(salida.contains("Créditos obtenidos: 4108"), 
            "La salida debe contener los créditos correctos: 4108");
    }

    @Test
    public void testContieneDetallesConciertos() throws Exception {
        // Ejecutar el programa
        Facturador.main(new String[]{});

        // Obtener la salida capturada
        String salida = salidaCapturada.toString();

        // Verificar que se muestran los conciertos del repertorio
        assertTrue(salida.contains("Concierto: Tributo Robe"), 
            "La salida debe contener el primer concierto");
        assertTrue(salida.contains("Concierto: Magia Knoppler"), 
            "La salida debe contener el tercer concierto");
        assertTrue(salida.contains("Concierto: Demonios Rojos"), 
            "La salida debe contener el cuarto concierto");

        // Verificar que se muestran asistentes
        assertTrue(salida.contains("Asistentes: 4000"), 
            "La salida debe mostrar el número de asistentes");
    }

    @Test
    public void testFormatoFactura() throws Exception {
        // Ejecutar el programa
        Facturador.main(new String[]{});

        // Obtener la salida capturada
        String salida = salidaCapturada.toString();

        // Verificar que la salida no está vacía
        assertFalse(salida.isEmpty(), 
            "La salida no debe estar vacía");

        // Verificar que contiene las secciones principales
        assertTrue(salida.contains("FACTURA"), 
            "La salida debe contener la palabra FACTURA");
        assertTrue(salida.contains("Cliente:"), 
            "La salida debe contener la etiqueta Cliente:");
        assertTrue(salida.contains("BASE IMPONIBLE:"), 
            "La salida debe contener la etiqueta BASE IMPONIBLE:");
        assertTrue(salida.contains("IVA"), 
            "La salida debe contener información sobre IVA");
        assertTrue(salida.contains("TOTAL FACTURA:"), 
            "La salida debe contener la etiqueta TOTAL FACTURA:");
        assertTrue(salida.contains("Créditos obtenidos:"), 
            "La salida debe contener la etiqueta Créditos obtenidos:");
    }
}