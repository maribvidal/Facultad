package unlp.oo2.patrones.ej19;

import java.util.List;
import java.util.stream.Collectors;

// Asumo que esta clase solo se utiliza después del
// HomeWeatherStation, porque si no claramente está mal

public class WeatherDecoratorCelsius extends WeatherDecorator {
	//
	public WeatherDecoratorCelsius(WeatherData componente) {
		super(componente);
	}
	
	// INTERFAZ PÚBLICA
	
	@Override
	public double getTemperatura() {
		double conversion = convertirACelsius(this.getComponente().getTemperatura());
		return conversion;
	}
	
	@Override
	public List<Double> getTemperaturas() {
		List<Double> listaConvertida = this.getComponente().getTemperaturas().stream()
											.mapToDouble(temp -> convertirACelsius(temp))
											.boxed()
											.collect(Collectors.toList());
		return listaConvertida;
	}
	
	@Override
    public String displayData() {
        return "Temperatura C: " + this.getTemperatura() +
               "; Presión atmosf: " + this.getPresion() +
               "; Radiación solar: " + this.getRadiacionSolar() + ";";
    }
	
	// Métodos privados
	
	private double convertirACelsius(double temperatura) {
		double conversion = (temperatura - 32) / 1.8;
		return conversion;
	}
}