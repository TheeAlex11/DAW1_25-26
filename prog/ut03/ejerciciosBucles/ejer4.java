/*
1. Analisis 
    - Datos de entrada: 
        n - integer (numero enesimo)
    
    - Datos de salida:
        fila - integer

2. Tabla ejemplos (Suma los dos números anteriores)
    1 => 1
    2 => 1
    3 => 2
    4 => 3
    5 => 5
    6 => 8
    7 => 13
    8 => 21
    9 => 34

3. Escribir algoritmo

4. Andamio (Estructura del programa)

5. Resolver cada paso

*/

public class ejer4 {
    public static void main(String[] args) {
        for (int i = 0; i < 10; i++) {
            System.out.println(fibo(i));
        }
    }

    public static int fibo(int n) {
        if (n == 0) {
            return 0;
        } else if (n == 1) {
            return 1;
        }

        return fibo(n - 1) + fibo(n - 2);
    }
}