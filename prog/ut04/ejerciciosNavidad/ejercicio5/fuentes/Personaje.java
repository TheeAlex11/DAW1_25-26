public class Personaje{
    private String nombre;
    private Integer nivel;
    private Integer puntosVida;
    private Integer puntosVidaMaximos;
    private Boolean estasVivo;
    private Arma arma;

    // Constructor
    public Personaje(String nombre, Integer nivel, Integer puntosVida, Integer puntosVidaMaximos) {
        try{
        this.setNombre(nombre);
        }
        catch(Throwable e){
            e.printStackTrace();
            fail("Excepcion Inesperada");
        }
        this.setNivel(nivel);
        this.setPuntosVidaMaximos(puntosVidaMaximos);
        this.puntosVida = puntosVida;
        this.estasVivo = true;
    }

    // Getters
    public String getNombre(){
        return this.nombre;
    }

    public Integer getNivel(){
        return this.nivel;
    }
    
    public Integer getPuntosVidaMaximos(){
        return this.puntosVidaMaximos;
    }

    public Integer getPuntosVida(){
        return this.puntosVida;
    }

    public Boolean getEstasVivo(){
        return this.estasVivo;
    }

  
    
    // Setters
    public void setNombre(String nombre) throws Exception{
        if(nombre == null)
            throw new IllegalArgumentException("No puede ser nulo");
        if (nombre.isEmpty())
            throw new IllegalArgumentException("El nombre no puede estar vacio");
        this.nombre = nombre;
    }

    public void setNivel(Integer nivel){
        if(nivel == null || nivel < 1 || nivel > 100)
            return;
        this.nivel = nivel;
    }

    public void setPuntosVidaMaximos(Integer puntosVidaMaximos) {
        this.puntosVidaMaximos = puntosVidaMaximos;
        this.setPuntosVida(puntosVidaMaximos);
    }
    
    public void setPuntosVida(Integer puntosVida){
        if(puntosVida == null || puntosVida < 0){
            this.puntosVida = 0;
            this.estasVivo = false;
        }
        else if(puntosVida > this.getPuntosVidaMaximos()){
            this.puntosVida = this.getPuntosVidaMaximos();
        }
        else{
            this.puntosVida = puntosVida;
        }
    } 

    // Métodos
    public void recibirDanyo(Integer cantidad){
        if(cantidad == null || cantidad < 0)
            return;
        this.puntosVida = this.puntosVida - cantidad;
    }

    public void curar(Integer cantidad){
        if(cantidad == null || cantidad < 0)
            return;
        this.puntosVida = this.puntosVida + cantidad;
        
        if(this.puntosVida > this.puntosVidaMaximos)
            this.puntosVida = this.puntosVidaMaximos;
    }
    
    // instanceof Comprueba el objeto y alguna de sus derivadas.

    public void setArma(Arma arma){
        if ((arma instanceof ArmaMagica) && !(this instanceof Mago)){
            return;
        }
        this.arma = arma;
    }

    public Arma getArma(){
        return this.arma;
    }
     public void atacar(Personaje atacado){
        atacado.recibirAtaque(this.getNivel());

     }

     public void recibirAtaque(Integer dano){
        this.setPuntosVida(this.getPuntosVida() - dano);
     }


    @Override
    public String toString(){
        return this.nombre + " Nombre " + this.nivel + " Nivel [X] " + 
               this.puntosVida + " PV " + this.puntosVidaMaximos + " PV MAX";
    }
}
