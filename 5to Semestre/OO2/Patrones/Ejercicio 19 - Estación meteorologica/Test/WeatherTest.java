package unlp.oo2.patrones.ej19;

import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class WeatherTest {

	HomeWeatherStation hws;
	WeatherDecorator weatherFahrenheit;
	WeatherDecorator weatherCelsius;
	List<Double> tempHist;
	
	@BeforeEach
	void setUp() throws Exception {
		tempHist = new ArrayList<Double>();
		
		tempHist.add(84.0);
		tempHist.add(85.0);
		tempHist.add(86.0);
		tempHist.add(87.0);
		tempHist.add(88.0);
		
		hws = new HomeWeatherStation(86, 1008, 200, tempHist);
	}
	
	@Test
	void test_enunciado_ejemplo_5() {
		WeatherDecorator objetoActual = new WeatherDecoratorMaximo(
					new WeatherDecoratorMinimo(
								new WeatherDecoratorPromedio(
											new WeatherDecoratorCelsius(hws)
										)
							)
				);
				
		String valorEsperado = "Temperatura C: 30.0; Presión atmosf: 1008.0; Radiación solar: 200.0; Promedio: 30.0; Mínimo: 28.88888888888889; Máximo: 31.11111111111111;";
		Assertions.assertEquals(valorEsperado, objetoActual.displayData());
	}
	
	@Test
	void test_construir_weather_decorator_celsius() {
		HomeWeatherStationCelsiusConstructor constructorC = new HomeWeatherStationCelsiusConstructor();
		
		constructorC.proveerDatos(86, 1008, 200, tempHist);
		constructorC.visualizarPromedio();
		constructorC.visualizarMinimo();
		constructorC.visualizarMaximo();
		
		weatherCelsius = constructorC.construir();
				
		String valorEsperado = "Temperatura C: 30.0; Presión atmosf: 1008.0; Radiación solar: 200.0; Promedio: 30.0; Mínimo: 28.88888888888889; Máximo: 31.11111111111111;";
		Assertions.assertEquals(valorEsperado, weatherCelsius.displayData());
	}
	
	@Test
	void test_construir_weather_decorator_fahrenheit() {
		HomeWeatherStationFahrenheitConstructor constructorF = new HomeWeatherStationFahrenheitConstructor();
		
		constructorF.proveerDatos(86, 1008, 200, tempHist);
		constructorF.visualizarPromedio();
		
		weatherFahrenheit = constructorF.construir();
				
		String valorEsperado = "Temperatura F: 86.0; Presión atmosf: 1008.0; Radiación solar: 200.0; Promedio: 86.0;";
		Assertions.assertEquals(valorEsperado, weatherFahrenheit.displayData());
	}
}
