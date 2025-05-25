package unlp.oo2.patrones.ej19;

import java.util.LinkedList;
import java.util.List;

public class WeatherDecoratorNull extends WeatherDecorator {
	//
	public WeatherDecoratorNull() {
		super(new HomeWeatherStation(0, 0, 0, new LinkedList<Double>()));
	} 
	
	// INTERFAZ PÚBLICA
	
    public double getTemperatura() { return 0; }

    public double getPresion() { return 0; }

    public double getRadiacionSolar() { return 0; }

    public List<Double> getTemperaturas() { return new LinkedList<Double>(); }

    public String displayData() { return ""; }
    
    public WeatherData getComponente() { return this.getComponente(); }
}