public class Perseguidor {
    
    /**
     * Calcula el tiempo o distancia de alcance para móviles que se persiguen
     * Se asume que el móvil 2 persigue al móvil 1
     */
    public static double calcular(double pos1, double vel1, double acel1,
                                 double pos2, double vel2, double acel2,
                                 int incognita) {
        
        // Para persecución: pos1 + vel1*t + 0.5*acel1*t² = pos2 + vel2*t + 0.5*acel2*t²
        // Es la misma ecuación que para cruce, pero típicamente pos2 > pos1 en persecución
        
        double a = 0.5 * (acel1 - acel2);
        double b = vel1 - vel2;
        double c = pos1 - pos2;
        
        if (incognita == 1) {
            // Calcular tiempo de alcance
            return calcularTiempoPersecucion(a, b, c);
        } else {
            // Calcular distancia de alcance
            double tiempo = calcularTiempoPersecucion(a, b, c);
            return calcularDistancia(pos1, vel1, acel1, tiempo);
        }
    }
    
    private static double calcularTiempoPersecucion(double a, double b, double c) {
        // Misma lógica que en Cruzador pero con validaciones específicas para persecución
        
        if (a == 0) {
            // Ecuación lineal
            if (b == 0) {
                throw new ArithmeticException("No hay solución: el perseguidor nunca alcanzará al otro móvil");
            }
            double tiempo = -c / b;
            if (tiempo < 0) {
                throw new ArithmeticException("El tiempo de alcance es negativo - no alcanzará");
            }
            return tiempo;
        }
        
        // Ecuación cuadrática
        double discriminante = b * b - 4 * a * c;
        
        if (discriminante < 0) {
            throw new ArithmeticException("No hay solución real - el perseguidor nunca alcanzará al otro móvil");
        }
        
        double t1 = (-b + Math.sqrt(discriminante)) / (2 * a);
        double t2 = (-b - Math.sqrt(discriminante)) / (2 * a);
        
        // Para persecución, buscar el primer tiempo positivo
        if (t1 >= 0 && t2 >= 0) {
            return Math.min(t1, t2);
        } else if (t1 >= 0) {
            return t1;
        } else if (t2 >= 0) {
            return t2;
        } else {
            throw new ArithmeticException("El perseguidor nunca alcanzará al otro móvil");
        }
    }
    
    private static double calcularDistancia(double pos, double vel, double acel, double tiempo) {
        return pos + vel * tiempo + 0.5 * acel * tiempo * tiempo;
    }
}