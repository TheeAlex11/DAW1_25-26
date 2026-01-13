package ejerciciosNavidad.ejercicio5.fuentes;

public class Guerrero extends Personaje {
    private Integer fuerza;

    public Guerrero(String nombre, Integer nivel, Integer puntosVidaMaxima, Integer fuerza) throws Exception {
        super(nombre, nivel, puntosVidaMaxima);
        this.setFuerza(fuerza);
    }

    public Integer getFuerza() {
        return this.fuerza;
    }

    public void setFuerza(Integer fuerza) throws Exception {
        if (fuerza < 0 || fuerza > 50) {
            throw new IllegalArgumentException("La fuerza debe estar entre 0 y 50");
        }
        this.fuerza = fuerza;
    }
    @Override
    public void atacar(Personaje atacado) {
        Integer danoTotal;
        danoTotal = this.getNivel();
        danoTotal += this.getFuerza();

        if (this.getArma() != null) {
            danoTotal += this.getArma().getDano();
        }

        atacado.recibirAtaque(danoTotal);
    }
}
