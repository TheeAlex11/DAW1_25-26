import java.util.regex.*;

public class ejercicioUno {
    public static void main(String[] args) {
        String regex = "^(\\+34|0034)?\\d{9}$";

        String[] telefonos = {
                "612345678", // Valido
                "+34612345678", // Valido
                "0034612345678", // Valido
                "12345", // No valido
                "+33123456789" // No valido
        };

        for (String telefono : telefonos) {
            if (telefono.matches(regex)) {
                System.out.println(telefono + " es válido");
            } else {
                System.out.println(telefono + " es inválido");
            }

        }
    }

    public static boolean validarTelefono(String telefono) {
        String regex = "^(\\+34|0034)?\\d{9}$";
        return telefono.matches(regex);
    }
}
