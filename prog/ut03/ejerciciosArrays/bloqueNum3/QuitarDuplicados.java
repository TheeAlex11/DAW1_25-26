import java.lang.reflect.Array;
// ARRAY 2.4
public class QuitarDuplicados{
    public static void main(String[] args) {
        Integer[] inicial1 = { 1, 2, 2, 3 };
        Integer[] inicial2 = { 4, 3, 2, 65, 7, 6 };


        Integer[] final1 = quitarDuplicados(inicial1);

        for (int i = 0; i < final1.length; i++){
            System.out.print(final1[i] + " ");
        }
    }

    public static Integer[] quitarDuplicados(Integer[] listaInicial) {
        Integer[] resultado = { 42, 42, 42 };
        Integer iResultado = 0; // La siguiente posicion vacia
        
        for (int i = 0; i < listaInicial.length; i++) {
            
            Integer elemento = listaInicial[i];
            Boolean duplicado = false; // Bandera
            for (int j = 0; j < resultado.length; j++) {
                if (elemento == resultado[j]) {
                    duplicado = true;
                    break;
                }
            }
            if (duplicado == false) {
                resultado[iResultado++] = elemento;
            }
        } 
        return resultado;
    }
}