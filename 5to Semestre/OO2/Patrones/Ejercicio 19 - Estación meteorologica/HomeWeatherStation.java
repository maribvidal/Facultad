package unlp.oo2.patrones.ej19;

import java.util.ArrayList;
import java.util.List;

public class HomeWeatherStation implements WeatherData {
    private double temperaturaF;
    private double presion;
    private double radiacionSolar;
    private List<Double> listaTemperaturas;

    //
    
    public HomeWeatherStation(double temperaturaF, double presion, double radiacionSolar, List<Double> listaTemperaturas) {
    	this.temperaturaF = temperaturaF;
    	this.presion = presion;
    	this.radiacionSolar = radiacionSolar;
        this.listaTemperaturas = listaTemperaturas;
    }

    // INTERFAZ PÚBLICA

    public double getTemperatura() { return this.temperaturaF; }

    public double getPresion() { return this.presion; }

    public double getRadiacionSolar() { return this.radiacionSolar; }

    public List<Double> getTemperaturas() { return this.listaTemperaturas; }

    public String displayData() {
        return "Temperatura F: " + this.getTemperatura() +
               "; Presión atmosf: " + this.getPresion() +
               "; Radiación solar: " + this.getRadiacionSolar() + ";";
    }
}