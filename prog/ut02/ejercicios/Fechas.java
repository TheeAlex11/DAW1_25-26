import java.time.*;
import java.time.format.*;
import java.util.Scanner;

    public class Fechas {
		public static void main(String[] args){
			Scanner teclado = new Scanner(System.in);
			
			// 1. Fundamentos con LocalDate
			LocalDate hoy = LocalDate.now();
			
			Integer anio = hoy.getYear();
			Integer mesNum = hoy.getMonthValue();
			Month mesNombre = hoy.getMonth();
			Integer dia = hoy.getDayOfMonth();

			System.out.println("Fecha de hoy: " + hoy);
			System.out.println("Año: " + anio);
			System.err.println("Mes: " + mesNum);
			System.out.println("Día: " + dia);

			// 2. Fundamentos con LocalTime
			LocalTime ahora = LocalTime.now();
			LocalTime hora2 = LocalTime.of(8,30);

			System.out.println("¿El tiempo de ahora es despues de las 8:30? " + ahora.isAfter(hora2));

			//3.LocalDateTime básico
			
			LocalDate fechaEjemplo = LocalDate.of(2025, 10, 17);
			LocalTime horaEjemplo = LocalTime.of(9, 15);
			LocalDateTime fechaHoraEjemplo = LocalDateTime.of(fechaEjemplo, horaEjemplo);
			LocalDateTime fechaHoraSumada = fechaHoraEjemplo.plusHours(2);
			fechaHoraEjemplo.plusMinutes(45);
			System.out.println(fechaHoraSumada);
			
			//4.Formateo sencillo

			DateTimeFormatter formateado = DateTimeFormatter.ofPattern("dd/MM/yyyy");
			String h = hoy.format(formateado);
			System.out.println("Fecha de hoy formateada:" + h);
			
			//5.Parseo sencillo

			LocalDate fecha = LocalDate.of(2025, 12 ,05);
			String fechaTexto = "2025-12-05";

			fecha = LocalDate.parse(fechaTexto);
			System.out.println("Obtener el día de la semana:" + fecha.getDayOfWeek());

			//6.Formato "largo" en español
			
			LocalDate fecha2 = LocalDate.of(20025, 10, 17);

	
			DateTimeFormatter.ofPattern("EEEE, d 'de' MMM 'de' yyyy", new Locale("es","ES"));
			

			teclado.close();
		}
	}
