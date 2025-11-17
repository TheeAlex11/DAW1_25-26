/*
 * Forma de ejecución
 * java < listado_telefonos.txt
 * 
 * 
 */

import java.util.Scanner;

public class simulacroExamenPt01 {
    public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		String[][] listado;
		listado = new String[7][50];

		for (int i = 0; i < 7; i++) {
			String linea = sc.nextLine();
			System.out.println(linea);

			String[] trozos = linea.split(":");
			listado[i][0] = trozos[0]; // Nombre del espía
			String[] trozos2 = trozos[1].split(","); // Teléfonos

			for (int j = 0; j < trozos2.length; j++) {
				listado[i][j + 1] = trozos2[j];
				
			}
			
		}

		sc.close();
    }
}