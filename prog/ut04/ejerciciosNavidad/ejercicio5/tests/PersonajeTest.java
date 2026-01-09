import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import static org.junit.jupiter.api.Assertions.*;

class PersonajeTest {
    
	private Personaje personaje; 
	private final String NOMBRE = "Nombre";
	private final Integer NIVEL = 5;
	private final Integer PTOS_VIDA_MAXIMOS = 75;
    
    @BeforeEach
    void setUp() {
		this.personaje = new Personaje(NOMBRE, NIVEL, PTOS_VIDA_MAXIMOS);
    }
    
	@Test
    @DisplayName("Test constructor válido")
    public void testConstructorValido() {
		assertNotNull(personaje, "El constructor devuelve null.");
	}
	
	@Test
    @DisplayName("Test getters válidos")
    public void testGettersValidos() {
		assertEquals(NOMBRE, personaje.getNombre(), "El getter getNombre no devuelve el valor correcto.");
		assertEquals(NIVEL, personaje.getNivel(), "El getter getNivel no devuelve el valor correcto.");
		assertEquals(PTOS_VIDA_MAXIMOS, personaje.getPuntosVidaMaximos(), "El getter getPuntosVidaMaximos no devuelve el valor correcto.");
		assertEquals(PTOS_VIDA_MAXIMOS, personaje.getPuntosVida(), "El getter getPuntosVida no devuelve el valor correcto.");
	}

	@Test
    @DisplayName("Test setter nombre")
    public void testSetterNombre() {
		assertThrows(IllegalArgumentException.class, () -> personaje.setNombre(null), "No se lanza excepción con parámetro nulo.");
		assertThrows(IllegalArgumentException.class, () -> personaje.setNombre(""), "No se lanza excepción con parámetro vacío.");
		final String NUEVO_NOMBRE = "Nuevo Nombre";
		personaje.setNombre(NUEVO_NOMBRE);
		assertEquals(NUEVO_NOMBRE, personaje.getNombre(), "El setter de Nombre o su getter está fallando.");
	}

	@Test
    @DisplayName("Test setter/getter Arma")
    public void testSetterGetterArma() {
		Arma arma = new Arma("Espada", 25);
		try{
			personaje.setArma(arma);
		}
		catch(Throwable e){
			e.printStackTrace();
			fail("Excepción inesperada.");
		}
		assertEquals(arma, personaje.getArma(), "El setter de Arma o su getter está fallando.");
	}
	
	@Test
    @DisplayName("Test toString")
    public void testToString() {
		assertTrue(personaje.toString().contains(NOMBRE), "El texto no incluye el nombre.");
		assertTrue(personaje.toString().contains(NIVEL.toString()), "El texto no incluye el nivel.");
		assertTrue(personaje.toString().contains(PTOS_VIDA_MAXIMOS + "/" + PTOS_VIDA_MAXIMOS), "El texto los puntos correctos.");
	}
	
}
