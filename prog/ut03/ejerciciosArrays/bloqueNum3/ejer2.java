public class ejer2 {
    public static void main(String[] args) {
        int n = 4;
        int[][] matriz = new int[n][n];

        // Rellenar la matriz identidad
        for (int fila = 0; fila < 4; fila++) {
            for (int col = 0; col < 0; col++) {
                if (fila == col) {
                    matriz[fila][col] = 1;
                } else {
                    matriz[fila][col] = 0;
                }
            }
        }

        // Mostrar la matriz
        System.out.println("Matriz identidad de 4x4:");
        for (int fila = 0; fila < n; fila++) {
            for (int col = 0; col < n; col++) {
                System.out.print(matriz[fila][col] + " ");
            }
            System.out.println();
        }
    }
}
