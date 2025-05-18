package unlp.oo2.patrones.ej19;

public class WeatherDecoratorPromedio extends WeatherDecorator {
	//
	public WeatherDecoratorPromedio(WeatherData componente) {
		super(componente);
	}
	
	// INTERFAZ PÚBLICA	
	
	@Override
    public String displayData() {
        String cadena = this.getComponente().displayData() + " Promedio: " + this.getPromedioHistorico() + ";";
        return cadena;
    }
}