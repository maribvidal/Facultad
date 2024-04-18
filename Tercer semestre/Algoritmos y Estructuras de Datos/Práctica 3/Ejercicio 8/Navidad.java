package tp3;

public class Navidad<T> {
	GeneralTree<T> Abeto;
	
	public Navidad (GeneralTree<T> abeto) {
		Abeto = abeto;
	}
	
	public String esAbetoNavideño() {
		String output = (!Abeto.isEmpty() && esUnAbeto(Abeto)) ? "Yes" : "No";
		return output;
	}
	private boolean esUnAbeto(GeneralTree<T> vertice) {
		boolean devolverValor = true;
		
		//El único caso que nos interesa es si no es una hoja, ya que solo
		//nos interesa saber la cantidad de hijos hoja de los nodos no-hoja
		if (!vertice.isLeaf()) {
			int cantidadHijosHoja = 0;
			
			//Contar la cantidad de hijos hoja que tiene, y recorrer los que no sean hojas
			for (GeneralTree<T> hijo : vertice.getChildren()) {
				if (hijo.isLeaf())
					cantidadHijosHoja++;
				else
					devolverValor = devolverValor && esUnAbeto(hijo);
			}
			
			//Con que solo un vértice del árbol no cumpla con la condición
			//nos basta para saber que el árbol no es un abeto
			if (cantidadHijosHoja < 3)
				devolverValor = false;
		}
		
		return devolverValor;
	}
}
