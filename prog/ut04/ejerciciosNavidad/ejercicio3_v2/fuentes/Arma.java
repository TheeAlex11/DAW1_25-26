public class Arma {
    private String nombre;
    private Integer dano;
    
    // Constructor
    public Arma(String nombre, Integer dano) {
        if (nombre == null || nombre.isEmpty()) {
            throw new IllegalArgumentException("El nombre del arma no puede ser nulo o vacío");
        }
        if (dano == null || dano < 0) {
            throw new IllegalArgumentException("El daño del arma debe ser mayor o igual a cero");
        }
        this.nombre = nombre;
        this.dano = dano;
    }
    
    // Getters (solo lectura)
    public String getNombre() {
        return nombre;
    }
    
    public Integer getDano() {
        return dano;
    }
    
    // toString
    @Override
    public String toString() {
        return nombre + " (Daño: " + dano + ")";
    }
}