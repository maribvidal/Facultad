package tp1;

public class ej5 {
	public static class Contenedor {
		private int primerValor;
		private int segundoValor;
		private int tercerValor;
		
		public void setValores(int primerValor, int segundoValor, int tercerValor) {
			this.primerValor = primerValor;
			this.segundoValor = segundoValor;
			this.tercerValor = tercerValor;
		}
		
		public int getPrimerValor() {
			return this.primerValor;
		}
		public int getSegundoValor() {
			return this.segundoValor;
		}
		public int getTercerValor() {
			return this.tercerValor;
		}
		public int getSuma() {
			return this.getPrimerValor() + this.getSegundoValor() + this.getTercerValor();
  		}
	}
	
	public static Contenedor maxMinProm1(Contenedor valores) {
		Contenedor maxmin = new Contenedor();
		int valorMax;
		int valorMin;
		
		if ((valores.getPrimerValor() > valores.getSegundoValor()) && (valores.getPrimerValor() > valores.getSegundoValor())) {
			valorMax = valores.getPrimerValor();
		} else if (valores.getSegundoValor() > valores.getTercerValor()) {
			valorMax = valores.getSegundoValor();
		} else {valorMax = valores.getTercerValor();}
		
		if ((valores.getPrimerValor() < valores.getSegundoValor()) && (valores.getPrimerValor() < valores.getSegundoValor())) {
			valorMin = valores.getPrimerValor();
		} else if (valores.getSegundoValor() < valores.getTercerValor()) {
			valorMin = valores.getSegundoValor();
		} else {valorMin = valores.getTercerValor();}
		
		maxmin.setValores(valorMax, valorMin, (valores.getSuma() / 3));
		
		return maxmin;
	}
	
	public static void main(String[] args) {
		Contenedor pasado = new Contenedor();
		pasado.setValores(1, 4, 10);
		Contenedor maxminprom = maxMinProm1(pasado);
		System.out.println(maxminprom.getPrimerValor() + " " + maxminprom.getSegundoValor() + " " + maxminprom.getTercerValor());
	}
}
