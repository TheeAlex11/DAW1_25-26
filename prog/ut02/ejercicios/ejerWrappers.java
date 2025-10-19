import java.util.Scanner;

public class ejercicioUno {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        // Parte Integer

        // Ejercicio 1
        Integer num = 25;
        System.out.println("Ejercicio 1: Valor de num = " + num);
    
        String cadena = "123";
        Integer objInteger = Integer.valueOf(cadena);
        int valorEntero = objInteger.intValue();

        // Ejercicio 2
        System.out.println("Ejercicio 2: Valor convertido a int = " + valorEntero);

        // Ejercicio 3
        System.out.println("Ejercicio 3: Rango de int:");
        System.out.println("Valor máximo = " + Integer.MAX_VALUE);
        System.out.println("Valor mínimo = " + Integer.MIN_VALUE);

        // Ejercicio 4
        System.out.print("Ejercicio 4: Ingresa un número: ");
        String entrada = sc.nextLine();
        int numeroUsuario = Integer.parseInt(entrada);
        System.out.println("El número multiplicado por 2 es: " + (numeroUsuario * 2));

        // Parte float

        // Ejercicio 5
        System.out.println("Ejercicio 5: Objeto Float con valor 3.14f:");
        Float numeroFloat = 3.14f;
        System.out.printf("%.2f\n", numeroFloat);

        // Ejercicio 6
        System.out.println("Ejercicio 6: Convertir cadena \"9.75\" a float y sumarle 1:");
        float convertidoFloat = Float.parseFloat("9.75");
        System.out.println(convertidoFloat + 1);

        // Ejercicio 7
        System.out.println("Ejercicio 7: Rango de Float:");
        System.out.println("Valor máximo = " + Float.MAX_VALUE);
        System.out.println("Valor mínimo = " + Float.MIN_VALUE);

        // Ejercicio 8
        System.out.println("Ejercicio 8: Comparar dos objetos Float:");
        Float aFloat = 5.5f;
        Float bFloat = 7.2f;
        if (aFloat.compareTo(bFloat) > 0) {
            System.out.println(aFloat + " es mayor que " + bFloat);
        } else if (aFloat.compareTo(bFloat) < 0) {
            System.out.println(bFloat + " es mayor que " + aFloat);
        } else {
            System.out.println(aFloat + " y " + bFloat + " son iguales");
        }

        // Parte Double
        
        // Ejercicio 9
        System.out.println("Ejercicio 9: Variable Double con valor 12.3456 redondeado:");
        Double numDouble = 12.3456;
        System.out.println(Math.round(numDouble));

        // Ejercicio 10
        System.out.println("Ejercicio 10: Convertir cadena \"45.678\" a double y mostrar el doble:");
        double convertidoDouble = Double.parseDouble("45.678");
        System.out.println(convertidoDouble * 2);

        // Ejercicio 11
        System.out.println("Ejercicio 11: Comprobar si Double es NaN:");
        Double nanDouble = Double.NaN;
        System.out.println("Es NaN? " + Double.isNaN(nanDouble));

        // Ejercicio 12
        System.out.print("Ejercicio 12: Ingresar dos números reales y mostrar el mayor:\n");
        System.out.print("Ingresa el primer número real: ");
        Double num1 = Double.parseDouble(sc.nextLine());
        System.out.print("Ingresa el segundo número real: ");
        Double num2 = Double.parseDouble(sc.nextLine());
        if (num1.compareTo(num2) > 0) {
            System.out.println(num1 + " es mayor que " + num2);
        } else if (num1.compareTo(num2) < 0) {
            System.out.println(num2 + " es mayor que " + num1);
        } else {
            System.out.println(num1 + " y " + num2 + " son iguales");
        }

        // Parte Boolean

        //Ejercicio 13
        System.out.println("Ejercicio 13: Crear Boolean con valor true y mostrar valor primitivo:");
        Boolean boolObj = Boolean.TRUE;
        System.out.println(boolObj.booleanValue());

        // Ejercicio 14
        System.out.println("Ejercicio 14: Convertir cadenas \"true\" y \"false\" a Boolean:");
        Boolean bTrue = Boolean.valueOf("true");
        Boolean bFalse = Boolean.valueOf("false");
        System.out.println("Boolean de \"true\": " + bTrue);
        System.out.println("Boolean de \"false\": " + bFalse);

        // Ejercicio 15
        System.out.print("Ejercicio 15: Ingresa una cadena para comprobar si es true o false: ");
        String entradaBool = sc.nextLine();
        boolean valorBool = Boolean.parseBoolean(entradaBool);
        System.out.println("La cadena ingresada representa el valor booleano: " + valorBool);

        // Ejercicio 16
        System.out.println("Ejercicio 16: Comparar dos objetos Boolean:");
        Boolean bool1 = true;
        Boolean bool2 = false;
        System.out.println("bool1 = " + bool1 + ", bool2 = " + bool2);
        System.out.println("¿Son iguales? " + bool1.equals(bool2));

        // Parte String

        // Ejercicio 17
        System.out.println("Ejercicio 17: Mostrar longitud de la cadena \"Java\":");
        String texto = "Java";
        System.out.println("Longitud: " + texto.length());
        
        // Ejercicio 18
        System.out.print("Ejercicio 18: Ingresa una palabra y mostrar la primera letra: ");
        String palabra = sc.nextLine();
        System.out.println("Primera letra: " + palabra.charAt(0));

        // Ejercicio 19
        System.out.println("Ejercicio 19: Mostrar los primeros tres caracteres de \"Programación\":");
        String palabra2 = "Programación";
        System.out.println("Subcadena: " + palabra2.substring(0, 3));    

        sc.close();
    }
}
