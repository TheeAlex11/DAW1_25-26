public class Personaje {
    private String nombre;
    private int nivel;
    private int puntosVida;
    private int puntosVidaMaximos;
    private Arma arma;
    
    // Constructor
    public Personaje(String nombre, int nivel, int puntosVida) {
        this.nombre = nombre;
        this.nivel = nivel;
        this.puntosVida = puntosVida;
        this.puntosVidaMaximos = puntosVida;
        this.arma = null;  // Inicializado a nulo
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
    
    public int getPuntosVidaMaximos() {
        return puntosVidaMaximos;
    }
    
    public Arma getArma() {
        return arma;
    }
    
    // Setters
    public void setNombre(String nombre) {
        if (nombre == null || nombre.isEmpty()) {
            throw new IllegalArgumentException("El nombre no puede ser nulo o vacío");
        }
        this.nombre = nombre;
    }
    
    public void setNivel(Integer nivel) {
        if (nivel == null) {
            this.nivel = 1;
            return;
        }
        if (nivel < 0) {
            throw new IllegalArgumentException("El nivel no puede ser negativo");
        }
        if (nivel > 10) {
            throw new IllegalArgumentException("El nivel no puede ser mayor de 10");
        }
        this.nivel = nivel;
    }
    
    public void setPuntosVida(Integer puntosVida) {
        if (puntosVida == null) {
            throw new IllegalArgumentException("Los puntos de vida no pueden ser nulos");
        }
        if (puntosVida < 0) {
            throw new IllegalArgumentException("Los puntos de vida no pueden ser negativos");
        }
        if (puntosVida > puntosVidaMaximos) {
            this.puntosVida = puntosVidaMaximos;
        } else {
            this.puntosVida = puntosVida;
        }
    }
    
    public void setPuntosVidaMaximos(Integer puntosVidaMaximos) {
        if (puntosVidaMaximos == null || puntosVidaMaximos <= 0) {
            throw new IllegalArgumentException("Los puntos de vida máximos deben ser mayores que cero");
        }
        this.puntosVidaMaximos = puntosVidaMaximos;
    }
    
    public void setArma(Arma arma) {
        this.arma = arma;
    }
    
    // Método para verificar si el personaje está vivo
    public boolean estaVivo() {
        return puntosVida > 0;
    }
    
    // Método para recibir ataque
    public void recibirAtaque(Integer dano) {
        if (dano == null || dano < 0) {
            throw new IllegalArgumentException("El daño no puede ser nulo o negativo");
        }
        puntosVida -= dano;
        if (puntosVida < 0) {
            puntosVida = 0;
        }
    }
    
    // Método para atacar a otro personaje
    public void atacar(Personaje atacado) {
        if (atacado == null) {
            throw new IllegalArgumentException("El personaje atacado no puede ser nulo");
        }
        int danoTotal = nivel;
        if (arma != null) {
            danoTotal += arma.getDano();
        }
        atacado.recibirAtaque(danoTotal);
    }
    
    // Método toString
    @Override
    public String toString() {
        String descripcionArma = (arma != null) ? arma.toString() : "Desarmado";
        return nombre + "[Nivel " + nivel + "] Vida: " + puntosVida + "/" + puntosVidaMaximos + " - " + descripcionArma;
    }
}