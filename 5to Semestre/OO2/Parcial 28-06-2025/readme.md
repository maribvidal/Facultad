# Parcial - Orientación a Objetos II - 28/06/2025
## Ejercicio de Refactoring
La plataforma de renta de vehículos "RentaOOs" está implementada de la siguiente manera. Actualmente ofrece tres tipos de rentas, básico, plus, y kilometraje libre, que se puede cambiar en cualquier momento durante la renta del vehículo.
```Java
1. public class Renta {
2. 	private Vehiculo vehiculo;
3. 	private Cliente cliente;
4. 	private int diasRenta;
5. 	private String tipoRenta;
6. 	private int kilometrajeInicial;
7. 	
8. 	public Renta(Vehiculo vehiculo, 
9. 			Cliente cliente, int diasRenta) {
10. 		this.vehiculo = vehiculo;
11. 		this.cliente = cliente;
12. 		this.diasRenta = diasRenta;
13. 		this.kilometrajeInicial = 
14. 				vehiculo.getKilometraje();
15. 		this.tipoRenta = "BASICO";
16. 	}
17. 	
18. 	public void setTipoRenta(String tipoRenta){
19. 		this.tipoRenta = tipoRenta;  }
20. 	
21. 	public double calcularTotal() {
22. 		if (this.tipoRenta == "BASICO") {
23. 			int kilometrosRecorridos = vehiculo.getKilometraje() - this.kilometrajeInicial;
24. 			double precio = diasRenta * vehiculo.getPrecioPorDia()
25. 					+ kilometrosRecorridos * vehiculo.getPrecioPorKm();
26. 			double adicional = 1;
27. 			// los autos mas viejos tienen un 15% de descuento
28. 			if (vehiculo.getAntiguedad() > 5) {
29. 				adicional = 0.85;
30. 			}
31. 			return precio * adicional;
32. 		}
33. 		else if (this.tipoRenta == "PLUS") {
34. 			int kilometrosRecorridos = vehiculo.getKilometraje() - this.kilometrajeInicial;
35. 			return kilometrosRecorridos * vehiculo.getPrecioPorKm();
36. 		} else { // sí el tipo de renta es "KILOMETRAJE_LIBRE"
37. 			return diasRenta * vehiculo.getPrecioPorDia();
38. } } }
x. // VEHICULO
x. public class Vehiculo {
x.  public double getPrecioPorDia() {...}
x.  public int getKilometraje() {...}
x.  public double getPrecioPorKm() {...}
x.  public void aumentarKilometraje(int cantidadKm) {...}
x. }
x. // TEST
x. public class RentaTest {
x.     @Test
x.     public void testBasicoYKilometrajeLibre() {
x.     	int precioPorDia = 100;
x.     	int precioPorKm = 5;
x.     	int antiguedad = 4;
x.     	int kilometraje = 10000;
x.     	
x.     	Vehiculo vehiculo = new Vehiculo(kilometraje, 
x.              precioPorDia, precioPorKm, antiguedad);
x.     	Cliente cliente = new Cliente("Ana");
x.     	Renta renta = new Renta(vehiculo, cliente, 3);
x.     	
x.     	// Simulamos uso del vehículo
x.     	vehiculo.aumentarKilometraje(200);
x.     	double esperadoBasico = (3 * 100 + 200 * 5);
x.     	assertEquals(esperadoBasico, renta.calcularTotal());
x.     	
x.     	renta.setTipoRenta("KILOMETRAJE_LIBRE");
x.     	double esperadoLibre = 3 * 100;
x.     	assertEquals(esperadoLibre, renta.calcularTotal());
x.     }
x. }
```
### Tareas: (debe realizar los tres ítems para aprobar el tema):
1. Enumere los code smell que encuentra en el código indicando las líneas afectadas.
2. Indique que refactorings utilizará para solucionar cada uno de los smells. Explique los pasos necesarios para realizar los refactorings elegidos, haciendo referencia al código cuando corresponda. Muestre el código final resultante luego de aplicar esos refactorings en la clase Renta, y si hace falta, en la clase RentaTest.
3. Realice el diagrama de clases del código refactorizado. Si utilizó un patrón de diseño, indíquelo en el diagrama mostrando los roles del patrón.
