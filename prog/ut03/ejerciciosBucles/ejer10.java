public class ejer10 {
    public static void main(String[] args) {
        System.out.println(invertir("Hola"));
        System.out.println(invertir("Adiós"));
        System.out.println(invertir("Los bucles repiten código"));
        System.out.println(invertir("Las funciones ordenan nuestro codigo"));
        System.out.println(invertir("¡Ateneos al código!"));
    }
    
    public static String invertir(String cadena) {
        String resultado;
        resultado = "";
        for (int i = cadena.length() -1; i >= 0; i--) {
            resultado += cadena.charAt(i);
            
        }


        return resultado;
    }
}
    