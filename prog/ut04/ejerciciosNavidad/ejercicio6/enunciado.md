# POO - Ejercicio 6

![Razas](razas.png)

## Objetivo:
Aprender a manejar enumeraciones.

## 1. Amplia la clase Guerrero
Vamos a ampliar la clase Guerrero con un nuevo atributo *raza*. Los guerreros podrán ser de una de la siguientes razas: Humano, Elfo, Enano, Hobbit u Orco.
Podríamos hacer que el atributo raza fuera de tipo String, pero entonces también podrían ser de raza "Caniche" y nos interesa tener los valores de raza limitados a los indicados. Cuando un atributo solo puede tener un conjunto limitado de valores, en Java utilizamos un tipo **enumerado**.

Para crear una enumeración en Java utilizamos el siguiente código:

```java
	public enum Raza { HUMANO, ELFO, ENANO, HOBBIT, ORCO };
```

(los valores de la enumeración se ponen en mayúsculas porque son constantes y son *public* para que puedan ser utilizadas por otras clases)

Para utilizarlas, si las hemos creado dentro de la clase Guerrero (por ejemplo) haríamos:

```java
	if (aragorn.getRaza() == Guerrero.Raza.HUMANO)
		...
```

### 1.1 Crea el atributo raza
Haz lo siguiente:

1. Declara la enumeración al principio de la clase, como si fuera un atributo más. 
2. Crea el atributo raza y su getter. No hagas setter porque no estará permitido cambiar de raza.
3. Modifica el constructos para recibir el valor de la raza del Guerrero.
4. Modifica el método toString para que muestre la raza del Guerrero.
