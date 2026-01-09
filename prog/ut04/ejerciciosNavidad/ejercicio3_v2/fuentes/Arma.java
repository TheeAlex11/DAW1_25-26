public class Arma {
    
    private String nombre;
    private Integer dano;
    
    public Arma(String nombre, Integer dano) throws Exception {
        this.nombre = nombre;
        if (dano == null || dano < 0) {
            throw new IllegalArgumentException("El daño no puede ser nulo o negativo.");
        }
        this.dano = dano;
    }
    
    public String getNombre() {
        return nombre;
    }
    
    public Integer getDano() {
        return dano;
    }
}