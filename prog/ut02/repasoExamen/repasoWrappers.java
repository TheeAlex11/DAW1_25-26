public class repasoWrappers {
    public static void main(String[] args) {
        // Correspondencia de primitivo a Wrapper
        Integer.MAX_VALUE = 2147483647;
        Integer.MIN_VALUE = -2147483648;

        int primerInt = 10;
        Integer integerWrapper = Integer.valueOf(primerInt);

        double primerDouble = 20.5;
        Double doubleWrapper = Double.valueOf(primerDouble);

        String strInt = "30";
        Integer intFromString = Integer.valueOf(strInt);

        String strDouble = "40.75";
        Double doubleFromString = Double.valueOf(strDouble);

        int intDesdeWrapper = integerWrapper.intValue(); // Obtiene el valor int del Wrapper
        double doubleDesdeWrapper = doubleWrapper.doubleValue(); // Obtiene el valor double del Wrapper

        int intDesdeString = Integer.parseInt(strInt);

        Integer a = 5;
        Integer b = 10;
        int comparacion = a.compareTo(b); // Devuelve un valor negativo porque 5 < 10

        String intComoString = integerWrapper.toString();
        String doubleComoString = doubleWrapper.toString();

        // --------------------- Clase Float  --------------------------------//
        Float.MAX_VALUE = 3.4028235e+38f;
        Float.MIN_VALUE = 1.4e-45f;
       
        float wrapperPrimitivo = 15.5f;
        Float floatWrapper = Float.valueOf(wrapperPrimitivo);

        String stringFloat = "25.75";
        Float floatFromString = Float.valueOf(stringFloat);

        Float floatValue = Float.valueOf(30.5f);
        float floatPrimitivo = floatValue.floatValue();

        Float f1 = 12.5f;
        Float f2 = 10.5f;
        int comparacionFloat = f1.compareTo(f2); // Devuelve un valor positivo

        String floatString = "45.85";
        float floatParseado = Float.parseFloat(floatString);

        Float nanValue = Float.valueOf(Float.NaN);
        boolean esNaN = nanValue.isNaN();
        System.out.println("¿El valor es NaN? " + esNaN);

        // ----------------------------- Clase Double  --------------------------------//
        Double MAX_DOUBLE = Double.MAX_VALUE;
        Double MIN_DOUBLE = Double.MIN_VALUE;

        double doublePrimitivo = 50.75;
        
        Double doubleWrapper2 = Double.valueOf(doublePrimitivo);
        
        String stringDouble2 = "60.85";
        
        Double doubleFromString2 = Double.valueOf(stringDouble2);
        
        Double doubleValue2 = Double.valueOf(70.95);

        double doubleDesdeString2 = Double.parseDouble(stringDouble2);
        
        double doublePrimitivo2 = doubleValue2.doubleValue();
       
        Double d1 = 80.5;
        Double d2 = 90.5;
        int comparacionDouble = d1.compareTo(d2); // Devuelve un valor negativo
        
        // ----------------------------- Clase Boolean  --------------------------------//
        Boolean.TRUE = true;
        Boolean.FALSE = false;
        
        Boolean boolWrapper = Boolean.valueOf(true);
        String stringBool = "false";
        Boolean boolFromString = Boolean.valueOf(stringBool);
        boolean boolPrimitivo = boolWrapper.booleanValue();
        Boolean b1 = Boolean.valueOf(true);
        Boolean b2 = Boolean.valueOf(false);
        int comparacionBool = b1.compareTo(b2);
        boolean boolParseado = Boolean.parseBoolean("true");
        boolean sonIguales = b1.equals(b2);

        // ----------------------------- Clase String  --------------------------------//
        String texto = "ABCDE";
        // length()
        int longitud = texto.length();
        // charAt()
        char caracter = texto.charAt(1);
        // substring()
        String subcadena = texto.substring(1, 4);
        // toUpperCase() y toLowerCase()
        String mayusculas = texto.toUpperCase();
        String minusculas = texto.toLowerCase();
        // replace()
        String reemplazo = texto.replace('A', 'Z');
        // indexOf()
        int indice = texto.indexOf('C');
        // equuals()
        boolean esIgual = texto.equals("ABCDE");

   } 
}
