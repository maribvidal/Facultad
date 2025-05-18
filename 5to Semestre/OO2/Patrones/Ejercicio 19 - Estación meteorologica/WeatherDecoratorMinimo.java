package unlp.oo2.patrones.ej19;

public class WeatherDecoratorMinimo extends WeatherDecorator {
	//
	public WeatherDecoratorMinimo(WeatherData componente) {
		super(componente);
	}
	
	// INTERFAZ PÚBLICA	
	
	@Override
    public String displayData() {
        String cadena = this.getComponente().displayData() + " Mínimo: " + this.getMinimoHistorico() + ";";
        return cadena;
    }
}