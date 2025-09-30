public class programaIVA {
    public static void main(String[] args) {
        double precioSinIVA = 100.0; // Precio sin IVA
        double tasaIVA = 0.21; // Tasa de IVA (21%)

        double precioConIVA = precioSinIVA * (1 + tasaIVA); // Cálculo del precio con IVA
        System.out.println("Precio con IVA: " + precioConIVA);
    }
}