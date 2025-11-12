package prog.ut03.ejerciciosDepuracion;

public class ejerUno {
    public static void main(String[] args) {
        System.out.println(esPrimo(17) + " Debe ser true");
        System.out.println(esPrimo(2) + " Debe ser true");
        System.out.println(esPrimo(8) + " Debe ser false");
        System.out.println("------------------------------------------------------------------");
        System.out.println(contarPrimos(1, 10));

    }
    
    public static Boolean esPrimo(Integer numero) {
        Boolean primo = true;
        for (int i = 2; i < numero; i++) {
            if (numero % i == 0) {
                primo = false;
                break;
            }
        }

        return primo;
    }
    
    public static Integer contarPrimos(Integer numeroUno, Integer numeroDos) {
            if (numeroUno > numeroDos) {
                System.out.println("El primer numero no puede ser inferior al segundo!");
            }

            Integer contador = 0;
            for (Integer i = numeroUno; i <= numeroDos; i++) {
                if (esPrimo(i)) {
                    contador++;
                }
            }
            return contador;
    }
}
