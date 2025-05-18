package unlp.oo2.patrones.ej19;

import java.util.List;

public interface WeatherData {

    /**
     * Retorna la temperatura actual en grados Fahrenheit.
     * @return Temperatura en Fahrenheit.
     */
    public double getTemperatura();

    /**
     * Retorna la presión atmosférica actual en hPa.
     * @return Presión en hPa.
     */
    public double getPresion();

    /**
     * Retorna la radiación solar actual.
     * @return Radiación solar.
     */
    public double getRadiacionSolar();

    /**
     * Retorna una lista con todas las temperaturas sensadas hasta el momento,
     * en grados Fahrenheit.
     * @return Lista de temperaturas históricas en Fahrenheit.
     */
    public List<Double> getTemperaturas();

    /**
     * Retorna un reporte formateado de los datos actuales.
     * La implementación concreta definirá el formato exacto.
     * @return String con los datos formateados.
     */
    public String displayData();
}