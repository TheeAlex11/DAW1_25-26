import java.time.*;
import java.time.format.*;
import java.util.Locale;
import java.util.Scanner;

    public class ejerFechas {
		public static void main(String[] args){
			Scanner teclado = new Scanner(System.in);
			
			// 1. Fundamentos con LocalDate
			LocalDate hoy = LocalDate.now();
			
			Integer anio = hoy.getYear();
			Integer mesNum = hoy.getMonthValue();
			Month mesNombre = hoy.getMonth();
			Integer dia = hoy.getDayOfMonth();

			// System.out.println("Fecha de hoy: " + hoy);
			// System.out.println("Año: " + anio);
			// System.err.println("Mes: " + mesNum);
			// System.out.println("Día: " + dia);

			// 2. Fundamentos con LocalTime
			LocalTime ahora = LocalTime.now();
			LocalTime hora2 = LocalTime.of(8,30);

			//System.out.println("¿El tiempo de ahora es despues de las 8:30? " + ahora.isAfter(hora2));

			// 3. LocalDateTime básico
			
			LocalDate fechaEjemplo = LocalDate.of(2025, 10, 17);
			LocalTime horaEjemplo = LocalTime.of(9, 15);
			LocalDateTime fechaHoraEjemplo = LocalDateTime.of(fechaEjemplo, horaEjemplo);
			LocalDateTime fechaHoraSumada = fechaHoraEjemplo.plusHours(2);
			fechaHoraEjemplo.plusMinutes(45);
			//System.out.println(fechaHoraSumada);
			
			// 4. Formateo sencillo

			DateTimeFormatter formateado = DateTimeFormatter.ofPattern("dd/MM/yyyy");
			String h = hoy.format(formateado);
			//System.out.println("Fecha de hoy formateada:" + h);
			
			// 5. Parseo sencillo

			LocalDate fecha = LocalDate.of(2025, 12 ,05);
			String fechaTexto = "2025-12-05";

			fecha = LocalDate.parse(fechaTexto);
			//System.out.println("Obtener el día de la semana:" + fecha.getDayOfWeek());

			// 6. Formato "largo" en español

            LocalDate fecha2 = LocalDate.of(2025, 10 ,17);

            DateTimeFormatter formateo2 = DateTimeFormatter.ofPattern("EEEE, d 'de' MMM 'de' yyyy", new Locale("es","ES"));

			String formateado2 = fecha2.format(formateo2);

			System.out.println(formateado2);
			
			// 7. Parseo con patrón propio
			
			String fechaTextoEjer7 = "17-102025 09:30";
				
			//patron personalizado
			DateTimeFormatter formato = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm");
			
			//parseo cadena a local date time
			LocalDateTime fechaEjercicio7 = LocalDateTime.parse(fechaTexto,formato);

			//imprimir resultado
			System.out.println("Fecha cambiada" + fechaEjercicio7);


			// 8. Cálculos con fechas (bisiesto + fin de mes)
           
            System.out.print("Introduce un año: ");
            System.out.print("Introduce un mes (1-12): ");

            int year = teclado.nextInt();
            int month = teclado.nextInt();

            LocalDate fechaejer8 = LocalDate.of(year, month, 1);
            boolean esBisiesto = fechaejer8.isLeapYear();
            int diasMes = fechaejer8.lengthOfMonth();
            LocalDate ultimoDiaMes = fechaejer8.withDayOfMonth(diasMes);
            System.out.println("¿El año " + year + " es bisiesto? " + esBisiesto);
            System.out.println("El mes " + month + " tiene " + diasMes + " días.");
            System.out.println("La fecha del último día del mes es: " + ultimoDiaMes);



			// 9. Próximo viernes

            LocalDate fechaejer9 = LocalDate.of(2025, 10, 20);
            



			// 10. 24h ↔ 12h con am/pm

			String textoHora = "14:35";
			//Crear formateo como hora original
			DateTimeFormatter formatoDeEntrada = DateTimeFormatter.ofPattern("hh:mm");

			//cambiar parseando el texto a LocalTime, hora real

			LocalTime hora = LocalTime.parse (textoHora, formatoDeentrada);
			

			// 11. Combinar cadenas fecha+hora



			// 12. Diferencia de horas dentro del día



			// 13. Listar todas las fechas de un mes



			// 14. Validar si una hora cae en un horario comercial


			
			// 15. Generar próximas 5 sesiones de una clase semanal



			// 16. Crear una fecha




			teclado.close();
		}
	}
