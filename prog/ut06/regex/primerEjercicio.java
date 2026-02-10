import java.util.regex.*;

public class primerEjercicio {
    public static void main(String[] args) {
        String texto = "Se me ocurrió estudiar 1DAM después de ver que en DAM no se veía bien HTML ni JavaScript como se ven en DAW2";

        //String[] buscamos = { "DAW1", "DAW2", "1DAM", "2DAM" };
        
        String regex = "[DAW[12]|[12]DAM"; // Expresion regular

        Pattern patron = Pattern.compile(regex);
        Matcher matcher = patron.matcher(texto);

        if (matcher.find()) 
            System.out.println("Si está");
        else
            System.out.println("No está");


        

    }
}