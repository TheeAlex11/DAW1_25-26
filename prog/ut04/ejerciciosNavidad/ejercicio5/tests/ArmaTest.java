import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import static org.junit.jupiter.api.Assertions.*;

class ArmaTest {
    
	private Arma arma; 
	private final String NOMBRE = "Nombre";
	private final Integer DANO = 10;
    
    @BeforeEach
    void setUp() {
		this.arma = new Arma(NOMBRE, DANO);
    }
    
	@Test
    @DisplayName("Test constructor válido")
    public void testConstructorValido() {
		assertNotNull(arma, "El constructor devuelve null.");
	}
	
	@Test
    @DisplayName("Test getters válidos")
    public void testGettersValidos() {
		assertEquals(NOMBRE, arma.getNombre(), "El getter getNombre no devuelve el valor correcto.");
		assertEquals(DANO, arma.getDano(), "El getter getDano no devuelve el valor correcto.");
	}

	@Test
    @DisplayName("Test toString")
    public void testToString() {
		assertEquals("Arma: " + NOMBRE + " Daño: " + DANO + " puntos.", arma.toString(), "El método toString no devuelve el texto correcto.");
	}
	
}
