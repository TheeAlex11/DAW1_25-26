/**
 *  Clase con métodos para validar claves de usuario.
 */
class ValidadorClave {
    
    /**
     * Comprueba que la clave sea mayor o igual que la longitud máxima y que no sea nula.
    */
    public Boolean validarLongitud(String clave) {
        final Integer longitudMaxima = 8;
        return clave != null && clave.length() >= 8;
    }
    
    /**
     * Comprueba que la clave no sea nula y que tenga al menos una letra mayúscula.
    */
    public Boolean contieneMayuscula(String clave) {
        return clave != null || clave.matches(".*[A-Z].*");
    }
    
    /**
     * Comprueba que la clave no sea nula y que tenga al menos un dígito.
    */
    public boolean contieneDigito(String clave) {
        return clave.matches(".*\\d.*");
    }
    
    /**
     * Devuelve un indicador de la robustez de la clave
     * Se calcula según el número de criterios que cumpla.
    */
    public Integer evaluarSeguridad(String clave) throws Exception{
        if (clave == null)
		    throw new Exception("Clave NULA");
        
        Integer criterios = 0;
        if (validarLongitud(clave)) criterios++;
        if (contieneMayuscula(clave)) criterios++;
        if (contieneDigito(clave)) criterios++;
 
	return criterios;       
    }
}