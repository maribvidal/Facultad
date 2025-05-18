package unlp.oo2.patrones.ej19;

import java.util.List;

public class WeatherDecorator implements WeatherData {
	private WeatherData component;
	
	//
	
	public WeatherDecorator(WeatherData component) {
		this.component = component;
	} 
	
	// INTERFAZ PÚBLICA
	
    public double getTemperatura() { return this.getComponente().getTemperatura(); }

    public double getPresion() { return this.getComponente().getPresion(); }

    public double getRadiacionSolar() { return this.getComponente().getRadiacionSolar(); }

    public List<Double> getTemperaturas() { return this.getComponente().getTemperaturas(); }

    public String displayData() { return this.getComponente().displayData(); }
    
    // Específicas de la clase
    
    public WeatherData getComponente() { return this.component; }
    
    public double getMinimoHistorico() {
    	double valor = this.getTemperaturas().stream()
    										.min((t1, t2) -> Double.compare(t1, t2))
    										.orElse(null);
    	
    	return valor;
    }
    
    public double getMaximoHistorico() {
    	double valor = this.getTemperaturas().stream()
    										.max((t1, t2) -> Double.compare(t1, t2))
    										.orElse(null);
    	
    	return valor;
    }
    
    public double getPromedioHistorico() {
    	double valor = this.getTemperaturas().stream()
    										.mapToDouble(Double::doubleValue)
    										.sum() / this.getTemperaturas().size();
    	
    	return valor;
    }
}