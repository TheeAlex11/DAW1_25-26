public class Unicornios {

    private static Unicornio[] unicornios = new Unicornio[50];
    public static void main(String[] args) {
        unicornios[22] = new Unicornio();
        unicornios[42] = new Unicornio();
        unicornios[2] = new Unicornio();
        unicornios[27] = new Unicornio();
        unicornios[10] = new Unicornio();

        System.out.println("Número de unicornios: " + unicornios.length);

        int contador = 0;

        for (Unicornio unicornio : unicornios) {
            if (unicornio != null) {
                contador++;
            }
        }

        System.out.println("Número de unicornios creados: " + contador);

        Unicornio[] unicorniosCreados = new Unicornio[contador];
        int indice = 0;
        for (Unicornio unicornio : unicornios) {
            if (unicornio != null) {
                unicorniosCreados[indice] = unicornio;
                indice++;
            }
        }
        
        System.out.println("Número de unicornios en el nuevo array: " + unicorniosCreados.length);

    }
}

class Unicornio {}
