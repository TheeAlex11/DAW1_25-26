import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import static org.junit.jupiter.api.Assertions.*;

class GuerreroTest {
    
	private Guerrero guerrero; 
	private final String NOMBRE = "Nombre";
	private final Integer NIVEL = 5;
	private final Integer PTOS_VIDA_MAXIMOS = 75;
	private final Integer FUERZA = 25;
    
    @BeforeEach
    void setUp() {
		try{
        	this.guerrero = new Guerrero(NOMBRE, NIVEL, PTOS_VIDA_MAXIMOS, FUERZA);
		}catch(Throwable e){
			fail("Error inesperado en el constructor.");
		}
    }
    
	@Test
    @DisplayName("Test constructor válido")
    public void testConstructorValido() {
		assertNotNull(guerrero, "El constructor devuelve null.");
	}
	
	@Test
    @DisplayName("Test getters válidos")
    public void testGettersValidos() {
		assertEquals(guerrero.getNombre(), NOMBRE, "El getter getNombre no devuelve el valor correcto.");
		assertEquals(guerrero.getNivel(), NIVEL, "El getter getNivel no devuelve el valor correcto.");
		assertEquals(guerrero.getPuntosVidaMaximos(), PTOS_VIDA_MAXIMOS, "El getter getPuntosVidaMaximos no devuelve el valor correcto.");
		assertEquals(guerrero.getPuntosVida(), PTOS_VIDA_MAXIMOS, "El getter getPuntosVida no devuelve el valor correcto.");
		assertEquals(guerrero.getFuerza(), FUERZA, "El getter getFuerza no devuelve el valor correcto.");
	}
    
	@Test
    @DisplayName("Test setter setFuerza")
    public void testSetFuerza() {
		assertThrows(IllegalArgumentException.class, () -> guerrero.setFuerza(null), "El setter setFuerza no lanza excepción con valor nulo.");
		assertThrows(IllegalArgumentException.class, () -> guerrero.setFuerza(0), "El setter setFuerza no lanza excepción con valor menor que 1.");
		assertThrows(IllegalArgumentException.class, () -> guerrero.setFuerza(51), "El setter setFuerza no lanza excepción con mayor que 50.");
	}
    
	@Test
    @DisplayName("Test método atacar")
    public void testAtacar() {
		assertThrows(IllegalArgumentException.class, () -> guerrero.atacar(null), "El método atacar no lanza excepción con valor de personaje nulo.");
		//Atacar sin arma
		final Integer PTOS_VIDA_ATACADO = 80;
		Personaje atacado = new Personaje("Atacado", 10, PTOS_VIDA_ATACADO);
		try{
			guerrero.atacar(atacado);
		}
		catch(Throwable e){
			e.printStackTrace();
			fail("Excepción inesperada.");
		}
		assertEquals(PTOS_VIDA_ATACADO - NIVEL - FUERZA, atacado.getPuntosVida(), "El método atacado no causa el daño previsto cuando no se usa arma.");
		//Atacar con arma
		final Integer DANO_ARMA = 4;
		try{
			guerrero.setArma(new Arma("Espada", DANO_ARMA));
			guerrero.atacar(atacado);
		}
		catch(Throwable e){
			e.printStackTrace();
			fail("Excepción inesperada.");
		}
		assertEquals((PTOS_VIDA_ATACADO - NIVEL - FUERZA) - NIVEL - FUERZA - DANO_ARMA, atacado.getPuntosVida(), "El método atacado no causa el daño previsto cuando se usa arma.");
	}
    
}
