import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import static org.junit.jupiter.api.Assertions.*;

class MagoTest {
    
	private Mago mago; 
	private final String NOMBRE = "Nombre";
	private final Integer NIVEL = 5;
	private final Integer PTOS_VIDA_MAXIMOS = 75;
	private final Integer MANA_MAXIMO = 75;
    
    @BeforeEach
    void setUp() {
		try{
        	this.mago = new Mago(NOMBRE, NIVEL, PTOS_VIDA_MAXIMOS, MANA_MAXIMO);
		}catch(Throwable e){
			fail("Error inesperado en el constructor.");
		}
    }
    
	@Test
    @DisplayName("Test constructor válido")
    public void testConstructorValido() {
		assertNotNull(mago, "El constructor devuelve null.");
	}
	
	@Test
    @DisplayName("Test getters válidos")
    public void testGettersValidos() {
		assertEquals(mago.getNombre(), NOMBRE, "El getter getNombre no devuelve el valor correcto.");
		assertEquals(mago.getNivel(), NIVEL, "El getter getNivel no devuelve el valor correcto.");
		assertEquals(mago.getPuntosVidaMaximos(), PTOS_VIDA_MAXIMOS, "El getter getPuntosVidaMaximos no devuelve el valor correcto.");
		assertEquals(mago.getPuntosVida(), PTOS_VIDA_MAXIMOS, "El getter getPuntosVida no devuelve el valor correcto.");
		assertEquals(mago.getMana(), MANA_MAXIMO, "El getter getMana no devuelve el valor correcto.");
		assertEquals(mago.getManaMaximo(), MANA_MAXIMO, "El getter getManaMaximo no devuelve el valor correcto.");
	}
    
	@Test
    @DisplayName("Test setter setMana")
    public void testSetMana() {
		assertThrows(IllegalArgumentException.class, () -> mago.setMana(null), "El setter setMana no lanza excepción con valor nulo.");
		assertThrows(IllegalArgumentException.class, () -> mago.setMana(-1), "El setter setMana no lanza excepción con valor menor que 0.");
		mago.setManaMaximo(47);
		assertThrows(IllegalArgumentException.class, () -> mago.setMana(48), "El setter setMana no lanza excepción con mayor que maná Máximo.");
	}

	@Test
    @DisplayName("Test setter setManaMaximo")
    public void testSetManaMaximo() {
		assertThrows(IllegalArgumentException.class, () -> mago.setManaMaximo(null), "El setter setManaMaximo no lanza excepción con valor nulo.");
		assertThrows(IllegalArgumentException.class, () -> mago.setManaMaximo(0), "El setter setManaMaximo no lanza excepción con valor menor que 1.");
		assertThrows(IllegalArgumentException.class, () -> mago.setManaMaximo(101), "El setter setManaMaximo no lanza excepción con mayor que 100.");
	}
    
	@Test
    @DisplayName("Test método hechizar")
    public void testHechizar() {
		//Hechizar sin arma mágica.
		final Integer PTOS_VIDA_ATACADO = 80;
		final Integer MANA_UTILIZADO = 12;
		Personaje hechizado = new Personaje("Atacado", 10, PTOS_VIDA_ATACADO);
		assertThrows(IllegalArgumentException.class, () -> mago.hechizar(hechizado, -1), "El método hechizar no lanza excepción con valor de maná utilizado negativo.");
		try{
			mago.hechizar(null, MANA_UTILIZADO);	//No pasa nada, no debe gastar maná.
			assertEquals(MANA_MAXIMO, mago.getMana(), "No debe gastarse maná si se intenta hechizar un personaje nulo.");
			mago.hechizar(hechizado, MANA_UTILIZADO);
		}
		catch(Throwable e){
			e.printStackTrace();
			fail("Excepción inesperada.");
		}
		assertEquals(PTOS_VIDA_ATACADO - NIVEL - MANA_UTILIZADO, hechizado.getPuntosVida(), "El método hechizar no causa el daño previsto cuando no se usa arma mágica.");
		//Atacar con arma mágica
		final Integer DANO_ARMA = 8;
		try{
			mago.setArma(new ArmaMagica("Centro de Amón", DANO_ARMA));
			mago.hechizar(hechizado, MANA_UTILIZADO);
		}
		catch(Throwable e){
			e.printStackTrace();
			fail("Excepción inesperada.");
		}
		assertEquals((PTOS_VIDA_ATACADO - NIVEL - MANA_UTILIZADO) - NIVEL - MANA_UTILIZADO - DANO_ARMA, hechizado.getPuntosVida(), "El método hechizado no causa el daño previsto cuando se usa arma mágica.");
		//Atacar con arma normal
		try{
			mago.setArma(new Arma("Espada", DANO_ARMA));
			mago.hechizar(hechizado, MANA_UTILIZADO);
		}catch(Throwable e){
			e.printStackTrace();
			fail("Excepción inesperada.");
		}
		assertEquals((PTOS_VIDA_ATACADO - NIVEL - MANA_UTILIZADO) - NIVEL - MANA_UTILIZADO - DANO_ARMA - NIVEL - MANA_UTILIZADO, hechizado.getPuntosVida(), "El método hechizado no causa el daño previsto cuando se tiene arma normal.");
	}
	
	@Test
    @DisplayName("Test método atacar")
    public void testAtacar() {
		assertThrows(IllegalArgumentException.class, () -> mago.atacar(null), "El método atacar no lanza excepción con valor de personaje nulo.");
		//Atacar sin arma
		final Integer PTOS_VIDA_ATACADO = 80;
		Personaje atacado = new Personaje("Atacado", 10, PTOS_VIDA_ATACADO);
		try{
			mago.atacar(atacado);
		}
		catch(Throwable e){
			e.printStackTrace();
			fail("Excepción inesperada.");
		}
		assertEquals(PTOS_VIDA_ATACADO - NIVEL, atacado.getPuntosVida(), "El método atacado no causa el daño previsto cuando no se usa arma.");
		//Atacar con arma normal
		final Integer DANO_ARMA = 4;
		try{
			mago.setArma(new Arma("Espada", DANO_ARMA));
			mago.atacar(atacado);
		}
		catch(Throwable e){
			e.printStackTrace();
			fail("Excepción inesperada.");
		}
		assertEquals((PTOS_VIDA_ATACADO - NIVEL) - NIVEL - DANO_ARMA, atacado.getPuntosVida(), "El método atacado no causa el daño previsto cuando se usa arma.");
		//Atacar con arma mágica
		try{
			mago.setArma(new ArmaMagica("Centro de Amón", DANO_ARMA));
			mago.atacar(atacado);
		}
		catch(Throwable e){
			e.printStackTrace();
			fail("Excepción inesperada.");
		}
		assertEquals((PTOS_VIDA_ATACADO - NIVEL) - NIVEL - DANO_ARMA - NIVEL - DANO_ARMA, atacado.getPuntosVida(), "El método atacado no causa el daño previsto cuando se usa arma.");
	}
    
}
