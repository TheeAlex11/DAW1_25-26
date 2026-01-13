package ejerciciosNavidad.ejercicio5.fuentes;

public class Mago extends Personaje {
    private Integer mana;
    private Integer manaMaximo;

    public Mago(String nombre, Integer nivel, Integer puntosVidaMaxima, Integer manaMaximo) {
        super(nombre, nivel, puntosVidaMaxima);
        this.setManaMaximo(manaMaximo);
        this.setMana(this.manaMaximo);
    }

    public Integer getMana() {
        return this.mana;
    }

    public Integer getmanaMaximo() {
        return this.manaMaximo;
    }

    public void setMana(Integer mana) {
        if (mana > this.getmanaMaximo()) {
            throw new IllegalArgumentException("El mana no puede ser mayor que el mana maximo");
        }
    }

    public void setManaMaximo(Integer manaMaximo) {
        if (mana > this.getmanaMaximo()) {
            throw new IllegalArgumentException("El mana no puede ser mayor que el mana maximo");
        }
        if (mana == null || mana < 0) {
            this.mana = 0;
        } else {
            this.mana = mana;
        }
    }
    
    public Integer hechizar(Personaje objetivo, Integer manaUsado) {
        if (manaUsado > this.getMana()) {
            manaUsado = this.getMana();
        }
        
        this.setMana(this.getMana() - manaUsado);

        Integer dano = this.getNivel() + manaUsado;

        if (this.getArma() instanceof ArmaMagica) {
            dano += this.getArma().getDano();
        }

        objetivo.recibirDano(dano);
        return dano;
    }
    
    @Override

    public void atacar(Personaje atacado) {
        if (atacado == null) {
            return;
        }
    }

    
}
