public class Cruzador {
    
    /**
     * Calcula el tiempo o distancia de encuentro para móviles que se cruzan
     */
    public static double calcular(double pos1, double vel1, double acel1,
                                 double pos2, double vel2, double acel2,
                                 int incognita) {
        
        // Ecuación: pos1 + vel1*t + 0.5*acel1*t² = pos2 + vel2*t + 0.5*acel2*t²
        // Reorganizando: 0.5*(acel1 - acel2)*t² + (vel1 - vel2)*t + (pos1 - pos2) = 0
        
        double a = 0.5 * (acel1 - acel2);
        double b = vel1 - vel2;
        double c = pos1 - pos2;
        
        if (incognita == 1) {
            // Calcular tiempo de encuentro
            return calcularTiempo(a, b, c);
        } else {
            // Calcular distancia de encuentro
            double tiempo = calcularTiempo(a, b, c);
            return calcularDistancia(pos1, vel1, acel1, tiempo);
        }
    }
    
    private static double calcularTiempo(double a, double b, double c) {
        // Resolver ecuación cuadrática: a*t² + b*t + c = 0
        
        if (a == 0) {
            // Ecuación lineal: b*t + c = 0
            if (b == 0) {
                throw new ArithmeticException("No hay solución: ambos móviles tienen la misma posición y velocidad");
            }
            double tiempo = -c / b;
            if (tiempo < 0) {
                throw new ArithmeticException("El tiempo de encuentro es negativo - no se encontrarán");
            }
            return tiempo;
        }
        
        // Ecuación cuadrática
        double discriminante = b * b - 4 * a * c;
        
        if (discriminante < 0) {
            throw new ArithmeticException("No hay solución real - los móviles no se encontrarán");
        }
        
        double t1 = (-b + Math.sqrt(discriminante)) / (2 * a);
        double t2 = (-b - Math.sqrt(discriminante)) / (2 * a);
        
        // Devolver el tiempo positivo más pequeño
        if (t1 >= 0 && t2 >= 0) {
            return Math.min(t1, t2);
        } else if (t1 >= 0) {
            return t1;
        } else if (t2 >= 0) {
            return t2;
        } else {
            throw new ArithmeticException("Ambos tiempos son negativos - no se encontrarán");
        }
    }
    
    private static double calcularDistancia(double pos, double vel, double acel, double tiempo) {
        return pos + vel * tiempo + 0.5 * acel * tiempo * tiempo;
    }
}