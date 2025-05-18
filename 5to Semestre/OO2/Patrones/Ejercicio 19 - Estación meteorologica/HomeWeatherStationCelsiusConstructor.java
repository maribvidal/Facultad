package unlp.oo2.patrones.ej19;

import java.util.List;

public class HomeWeatherStationCelsiusConstructor extends HomeWeatherStationFahrenheitConstructor {
	//
	// INTERFAZ PÚBLICA
	
	@Override
	public void proveerDatos(double temperaturaF, double presion, double radiacionSolar, List<Double> listaTemperaturas) {
		super.proveerDatos(temperaturaF, presion, radiacionSolar, listaTemperaturas);
		this.producto = new WeatherDecoratorCelsius(this.producto);
	}
}