package unlp.oo2.patrones.ej19;

public class WeatherDecoratorMaximo extends WeatherDecorator {
	//
	public WeatherDecoratorMaximo(WeatherData componente) {
		super(componente);
	}
	
	// INTERFAZ PÚBLICA	
	
	@Override
    public String displayData() {
        String cadena = this.getComponente().displayData() + " Máximo: " + this.getMaximoHistorico() + ";";
        return cadena;
    }
}