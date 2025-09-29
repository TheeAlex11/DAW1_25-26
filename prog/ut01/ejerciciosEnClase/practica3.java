// Programa que calcule el area del circulo y la longitud de la circunferencia de un circulo
public class practica3{
	public static void main (String[] args){
		float numPi = 3.14f;
		float radioCirculo = 3.0f; // CM
		
		// Calcular area
		float areaCirculo;
		areaCirculo = (radioCirculo * radioCirculo) * numPi;
		System.out.println("Area: " + areaCirculo);
		
		// Calcular longitud
		float longitud;
		longitud = 2 * numPi * radioCirculo;
		System.out.println("Longitud: " + longitud);
		
	}
}