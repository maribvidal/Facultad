package unlp.oo2.patrones.ej19;

import java.util.List;

public class HomeWeatherStationFahrenheitConstructor {
	protected WeatherDecorator producto = new WeatherDecoratorNull();
	//
	// INTERFAZ PÚBLICA
	
	public void proveerDatos(double temperaturaF, double presion, double radiacionSolar, List<Double> listaTemperaturas) {
		this.producto = new WeatherDecorator(
				new HomeWeatherStation(temperaturaF, presion, radiacionSolar, listaTemperaturas)
			);
	}
	
	public void visualizarMaximo() {
		this.producto = new WeatherDecoratorMaximo(this.producto);
	}
	
	public void visualizarMinimo() {
		this.producto = new WeatherDecoratorMinimo(this.producto);
	}
	
	public void visualizarPromedio() {
		this.producto = new WeatherDecoratorPromedio(this.producto);
	}
	
	public WeatherDecorator construir() {
		return this.producto;
	}
}
