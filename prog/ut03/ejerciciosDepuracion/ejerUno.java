package prog.ut03.ejerciciosDepuracion;

public class ejerUno {
    public static void main(String[] args) {
        System.out.println(esPrimo(17) + " Debe ser true");
        System.out.println(esPrimo(2) + " Debe ser true");
        System.out.println(esPrimo(8) + " Debe ser false");

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
}
