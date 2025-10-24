public class Dojo1 {
    public static void main(String[] args) {
        Integer a, b;
        a = (int) (Math.random() * 10 + 1);
        b = (int) (Math.random() * 10 + 1);
        Integer c = b;

        System.out.println("a: " + a + ", b: " + b);

        System.out.println("Ahora las variables han intercambiado su valor:");

        b = a;
        a = c;

        System.out.println("a: " + a);
        System.out.println("b: " + b);
    }
}