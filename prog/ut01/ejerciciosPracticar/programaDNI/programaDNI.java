public class programaDNI {
    public static void main(String[] args) {
        Integer numeroDNI;
        Character letraDNI;

        numeroDNI = 80239992;
        letraDNI = 'F';

        String apellidos;
        apellidos = "Bautista Jorge";

        String nombre;
        nombre = "Alejandro";

        Boolean esMasculino;
        esMasculino = true;

        Boolean esEspañol;
        esEspañol = true;

        String fechaNacimiento;
        fechaNacimiento = "23/05/1990";

        String fechaCaducidad;
        fechaCaducidad = "23/05/2030";
        Boolean esValido = true;

        // Mostrar toda la información
        System.out.println("DNI: " + numeroDNI + "-" + letraDNI);
        System.out.println("Nombre: " + nombre + " " + apellidos);
        System.out.println("Sexo: " + (esMasculino ? "Masculino" : "Femenino"));
        System.out.println("Nacionalidad: " + (esEspañol ? "Español" : "Extranjero"));
        System.out.println("Fecha de nacimiento: " + fechaNacimiento);
        System.out.println("DNI válido: " + (esValido ? "Sí" : "No"));
        System.out.println("Fecha de caducidad: " + fechaCaducidad);

    }
}