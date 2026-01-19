public class Personaje {
    private String nombre;
    private int nivel;
    private int puntosVida;
    private int puntosVidaMaximos;
    
    // Constructor
    public Personaje(String nombre, int nivel, int puntosVida) {
        this.nombre = nombre;
        this.nivel = nivel;
        this.puntosVida = puntosVida;
        this.puntosVidaMaximos = puntosVida;
    }
    
    // Getters
    public String getNombre() {
        return nombre;
    }
    
    public int getNivel() {
        return nivel;
    }
    
    public int getPuntosVida() {
        return puntosVida;
    }
    
    // Setters
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public void setNivel(int nivel) {
        this.nivel = nivel;
    }
    
    public void setPuntosVida(int puntosVida) {
        // Limitar los puntos de vida al máximo (100)
        if (puntosVida > 100) {
            this.puntosVida = 100;
        } else {
            this.puntosVida = puntosVida;
        }
    }
    
    // Método para verificar si el personaje está vivo
    public boolean estaVivo() {
        return puntosVida > 0;
    }
    
    // Método toString
    @Override
    public String toString() {
        return nombre + "[Nivel " + nivel + "] Vida: " + puntosVida + "/" + puntosVidaMaximos;
    }
}