import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import static org.junit.jupiter.api.Assertions.*;

class ArmaMagicaTest {
    
	private ArmaMagica armaMagica; 
	private final String NOMBRE = "Nombre";
	private final Integer DANO = 13;
	private Guerrero aragorn;
    
    @BeforeEach
    void setUp() {
        this.armaMagica = new ArmaMagica(NOMBRE, DANO);
    }
    
	@Test
    @DisplayName("Test constructor válido")
    public void testConstructorValido() {
		assertNotNull(armaMagica, "El constructor devuelve null.");
	}
	
	@Test
    @DisplayName("Test getters válidos")
    public void testGettersValidos() {
		assertEquals(NOMBRE, armaMagica.getNombre(), "El getter getNombre no devuelve el valor correcto.");
		assertEquals(DANO, armaMagica.getDano(), "El getter getDano no devuelve el valor correcto.");
	}
    
}
