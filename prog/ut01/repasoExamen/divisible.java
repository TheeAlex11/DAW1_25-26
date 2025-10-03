public class divisible {
    public static void main(String[] args) {
        Integer primerNumero = 2;
        Integer segundoNumero = 1;
		Boolean esDivisible;
		
		Integer resto = primerNumero % segundoNumero;
		esDivisible = resto == 0;
		
		System.out.println(esDivisible);
        
    }
}