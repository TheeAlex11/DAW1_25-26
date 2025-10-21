import java.time.*;
import java.time.format.*;
import java.util.Locale;
import java.util.Scanner;
import java.util.stream.Collectors;

public class ejerFechas {
    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);

        // 1. Fundamentos con LocalDate
        LocalDate hoy = LocalDate.now();
        System.out.println("=== 1. Fundamentos con LocalDate ===");
        System.out.println("Fecha de hoy: " + hoy);
        System.out.println("Año: " + hoy.getYear());
        System.out.println("Mes (numérico): " + hoy.getMonthValue());
        System.out.println("Mes (nombre): " + hoy.getMonth());
        System.out.println("Día: " + hoy.getDayOfMonth());
        System.out.println();

        // 2. Fundamentos con LocalTime
        System.out.println("=== 2. Fundamentos con LocalTime ===");
        LocalTime ahora = LocalTime.now();
        LocalTime horaFija = LocalTime.of(8, 30);
        System.out.println("Hora actual: " + ahora);
        System.out.println("¿Ahora es después de las 08:30? " + ahora.isAfter(horaFija));
        System.out.println("¿Ahora es antes de las 08:30? " + ahora.isBefore(horaFija));
        System.out.println();

        // 3. LocalDateTime básico
        System.out.println("=== 3. LocalDateTime básico ===");
        LocalDate fechaEjemplo = LocalDate.of(2025, 10, 17);
        LocalTime horaEjemplo = LocalTime.of(9, 15);
        LocalDateTime fechaHoraEjemplo = LocalDateTime.of(fechaEjemplo, horaEjemplo);
        LocalDateTime fechaHoraSumada = fechaHoraEjemplo.plusHours(2).plusMinutes(45);
        System.out.println("Fecha y hora original: " + fechaHoraEjemplo);
        System.out.println("Tras sumar 2h 45m: " + fechaHoraSumada);
        System.out.println();

        // 4. Formateo sencillo
        System.out.println("=== 4. Formateo sencillo ===");
        DateTimeFormatter formatoCorto = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        System.out.println("Fecha de hoy formateada: " + hoy.format(formatoCorto));
        System.out.println();

        // 5. Parseo sencillo
        System.out.println("=== 5. Parseo sencillo ===");
        LocalDate fechaParseada = LocalDate.parse("2025-12-05");
        System.out.println("Día de la semana de 2025-12-05: " + fechaParseada.getDayOfWeek());
        System.out.println();

        // 6. Formato largo en español
        System.out.println("=== 6. Formato largo en español ===");
        LocalDate fecha2 = LocalDate.of(2025, 10, 17);
        DateTimeFormatter formateoLargo = DateTimeFormatter.ofPattern("EEEE, d 'de' MMMM 'de' yyyy", new Locale("es", "ES"));
        System.out.println("Fecha formateada: " + fecha2.format(formateoLargo));
        System.out.println();

        // 7. Parseo con patrón propio
        System.out.println("=== 7. Parseo con patrón propio ===");
        String fechaTextoEjer7 = "17-10-2025 09:30";
        DateTimeFormatter formatoEjer7 = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm");
        LocalDateTime fechaEjercicio7 = LocalDateTime.parse(fechaTextoEjer7, formatoEjer7);
        System.out.println("Fecha cambiada: " + fechaEjercicio7);
        System.out.println();

        // 8. Cálculos con fechas
        System.out.println("=== 8. Cálculos con fechas ===");
        System.out.print("Introduce un año: ");
        int year = teclado.nextInt();
        System.out.print("Introduce un mes (1-12): ");
        int month = teclado.nextInt();

        LocalDate fechaejer8 = LocalDate.of(year, month, 1);
        boolean esBisiesto = fechaejer8.isLeapYear();
        int diasMes = fechaejer8.lengthOfMonth();
        LocalDate ultimoDiaMes = fechaejer8.withDayOfMonth(diasMes);

        System.out.println("¿El año " + year + " es bisiesto? " + esBisiesto);
        System.out.println("El mes " + month + " tiene " + diasMes + " días.");
        System.out.println("La fecha del último día del mes es: " + ultimoDiaMes);
        System.out.println();

        // 9. Próximo viernes
        System.out.println("=== 9. Próximo viernes ===");
        LocalDate fechaBase = LocalDate.of(2025, 10, 20);
        int diasHastaViernes = (DayOfWeek.FRIDAY.getValue() - fechaBase.getDayOfWeek().getValue() + 7) % 7;
        diasHastaViernes = diasHastaViernes == 0 ? 7 : diasHastaViernes;
        LocalDate proximoViernes = fechaBase.plusDays(diasHastaViernes);
        System.out.println("Fecha base: " + fechaBase);
        System.out.println("Próximo viernes: " + proximoViernes);
        System.out.println();

        // 10. 24h ↔ 12h con am/pm
        System.out.println("=== 10. 24h ↔ 12h con am/pm ===");
        String textoHora = "14:35";
        DateTimeFormatter formatoEntrada = DateTimeFormatter.ofPattern("HH:mm");
        LocalTime hora24 = LocalTime.parse(textoHora, formatoEntrada);
        DateTimeFormatter formato12h = DateTimeFormatter.ofPattern("hh:mm a", new Locale("es", "ES"));
        System.out.println("Hora 24h: " + hora24.format(formatoEntrada));
        System.out.println("Hora 12h: " + hora24.format(formato12h));
        System.out.println();

        // 11. Combinar cadenas fecha+hora
        System.out.println("=== 11. Combinar cadenas fecha+hora ===");
        String fechaTexto = "17/10/2025";
        String horaTexto = "09:30";
        LocalDate fechaComb = LocalDate.parse(fechaTexto, DateTimeFormatter.ofPattern("dd/MM/yyyy"));
        LocalTime horaComb = LocalTime.parse(horaTexto, DateTimeFormatter.ofPattern("HH:mm"));
        LocalDateTime combinado = LocalDateTime.of(fechaComb, horaComb);
        System.out.println("Fecha y hora combinadas: " + combinado);
        System.out.println();

        // 12. Diferencia de horas
        System.out.println("=== 12. Diferencia de horas ===");
        LocalTime h1 = LocalTime.parse("08:15");
        LocalTime h2 = LocalTime.parse("11:40");
        long minutos = Duration.between(h1, h2).toMinutes();
        System.out.println("Entre " + h1 + " y " + h2 + " hay " + minutos + " minutos.");
        System.out.println();

        // 13. Listar todas las fechas de un mes
        System.out.println("=== 13. Listar todas las fechas de un mes ===");
        System.out.print("Introduce un año: ");
        int anyoLista = teclado.nextInt();
        System.out.print("Introduce un mes (1-12): ");
        int mesLista = teclado.nextInt();

        LocalDate inicioMes = LocalDate.of(anyoLista, mesLista, 1);
        DateTimeFormatter formatoLista = DateTimeFormatter.ofPattern("EEE dd/MM", new Locale("es", "ES"));
        String fechasMes = inicioMes.datesUntil(inicioMes.plusMonths(1))
                .map(f -> f.format(formatoLista))
                .collect(Collectors.joining(", "));
        System.out.println(fechasMes);
        System.out.println();

        // 14. Validar horario comercial
        System.out.println("=== 14. Validar horario comercial ===");
        System.out.print("Introduce una hora (HH:mm): ");
        String horaUsuarioStr = teclado.next();
        LocalTime horaUsuario = LocalTime.parse(horaUsuarioStr, DateTimeFormatter.ofPattern("HH:mm"));

        LocalTime inicioManiana = LocalTime.of(9, 0);
        LocalTime finManiana = LocalTime.of(14, 0);
        LocalTime inicioTarde = LocalTime.of(16, 0);
        LocalTime finTarde = LocalTime.of(19, 0);

        boolean dentroHorario = (!horaUsuario.isBefore(inicioManiana) && !horaUsuario.isAfter(finManiana)) ||
                                (!horaUsuario.isBefore(inicioTarde) && !horaUsuario.isAfter(finTarde));
        System.out.println("¿Está dentro del horario comercial (L-V 9–14h,16–19h)? " + dentroHorario);
        System.out.println();

        // 15. Generar próximas 5 sesiones de una clase semanal
        System.out.println("=== 15. Generar próximas 5 sesiones de una clase semanal ===");
        System.out.print("Introduce el día de la semana (ej. MARTES): ");
        DayOfWeek diaClase = DayOfWeek.valueOf(teclado.next().toUpperCase());
        System.out.print("Introduce la hora de inicio (HH:mm): ");
        LocalTime horaClase = LocalTime.parse(teclado.next(), DateTimeFormatter.ofPattern("HH:mm"));

        LocalDate hoyBase = LocalDate.now();
        int valorHoy = hoyBase.getDayOfWeek().getValue();
        int valorClase = diaClase.getValue();
        int diasDiferencia = ((valorClase - valorHoy + 7) % 7) + (valorClase == valorHoy ? 7 : 0);
        LocalDate primerDiaClase = hoyBase.plusDays(diasDiferencia);

        DateTimeFormatter formatoSesion = DateTimeFormatter.ofPattern("EEEE d MMMM yyyy 'a las' HH:mm", new Locale("es", "ES"));
        System.out.println(primerDiaClase.atTime(horaClase).format(formatoSesion));
        System.out.println(primerDiaClase.plusWeeks(1).atTime(horaClase).format(formatoSesion));
        System.out.println(primerDiaClase.plusWeeks(2).atTime(horaClase).format(formatoSesion));
        System.out.println(primerDiaClase.plusWeeks(3).atTime(horaClase).format(formatoSesion));
        System.out.println(primerDiaClase.plusWeeks(4).atTime(horaClase).format(formatoSesion));
        System.out.println();

        // 16. Crear una fecha
        System.out.println("=== 16. Crear una fecha ===");
        System.out.print("Introduce tu día de nacimiento: ");
        int diaNac = teclado.nextInt();
        System.out.print("Introduce tu mes de nacimiento (1-12): ");
        int mesNac = teclado.nextInt();
        System.out.print("Introduce tu año de nacimiento: ");
        int anioNac = teclado.nextInt();

        LocalDate cumple = LocalDate.of(anioNac, mesNac, diaNac);
        LocalDate cumple2030 = LocalDate.of(2030, mesNac, diaNac);
        System.out.println("Tu cumpleaños en 2030 caerá en: " + cumple2030.getDayOfWeek());
        System.out.println();

        teclado.close();
    }
}
