public class ClaseA {
    
    /**
     * Método estático que devuelve el doble de un valor Double
     * @param numero El número a doblar
     * @return El doble del número ingresado
     */
    public static Double doblar(Double numero) {
        if (numero == null) {
            return null;
        }
        return numero * 2;
    }
}