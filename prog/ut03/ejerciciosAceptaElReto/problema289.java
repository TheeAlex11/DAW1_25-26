import java.util.Arrays;

public class problema289 {
    public static void main(String[] args) {
        Integer[] caso1 = { 1, 2, 3 };
        Integer[] caso2 = { 3, 1, 4, 2 };
        Integer[] caso3 = { 30, 40, 50, 60 };
        Integer[] caso4 = { 5 };

        System.out.println(calcularEsfuerzo(caso1) + " debe ser " + 9);
        System.out.println(calcularEsfuerzo(caso2) + " debe ser " + 19);
        System.out.println(calcularEsfuerzo(caso3) + " debe ser " + 360);
        System.out.println(calcularEsfuerzo(caso4) + " debe ser " + 0);

    }

    public static Integer calcularEsfuerzo(Integer[] sumandos) {
        Integer esfuerzo = 0;

        if (sumandos.length < 1) {
            return 0;
        }

        Arrays.sort(sumandos);
        Integer resultado = sumandos[0] + sumandos[1];
        esfuerzo += resultado;
        
        sumandos[0] = resultado;

        for (int i = 1; i < sumandos.length - 2; i++) {
            sumandos[i] = sumandos[i + 1];
        }

        return esfuerzo;
    }
}