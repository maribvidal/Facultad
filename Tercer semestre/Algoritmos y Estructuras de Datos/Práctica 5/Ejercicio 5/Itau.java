package tp5.ejercicio2;

import java.util.*;

import tp5.ejercicio1.Graph;
import tp5.ejercicio1.Vertex;
import tp5.ejercicio1.Edge;

public class Itau {
	public List<Jubilado> carteraJubilados(Graph<Persona> grafo, String nombrePersona, int gradoRango, int maxList) {
		//Crear un ArrayList ya que sabemos que la lista tiene un TOPE
		List<Jubilado> jubilados = new ArrayList<Jubilado>(maxList);
		
		if (!grafo.isEmpty()) {
			//Vamos a utilizar el BFS para este ejercicio
			Queue<Vertex<Persona>> colaPersonas = new Queue<Vertex<Persona>>();
			
			//Primero, asegurarnos de que exista el empleado pasado por parámetro
			Vertex<Persona> empleado = buscarPersona(grafo, nombrePersona);
			if (empleado != null) {
				boolean[] marcas = new boolean[grafo.getSize()];
				colaPersonas.enqueue(empleado);
				colaPersonas.enqueue(null); //Para separar por rango de búsqueda
				while (!colaPersonas.isEmpty() && gradoRango > 0 && jubilados.size() < maxList) {
					Vertex<Persona> verticeActual = colaPersonas.dequeue();
					if (verticeActual != null) {
						List<Edge<Persona>> adyacentesActuales = grafo.getEdges(verticeActual);
						Iterator<Edge<Persona>> iterador = adyacentesActuales.iterator();
						while (iterador.hasNext() && jubilados.size() < maxList) {
							Edge<Persona> aristaActual = iterador.next();
							Vertex<Persona> verticeDestino = aristaActual.getTarget();
							int posicion = verticeDestino.getPosition();
							if (!marcas[posicion]) {
								marcas[posicion] = true;
								
								//Encolamos todas las personas que no estén marcadas, pero a la lista de jubilados
								//solo vamos a agregar aquellas personas que cumplan con ciertos requisitos
								//1. Sean JUBILADOS ¦ 2. No hayan COBRADO
								colaPersonas.enqueue(verticeDestino);
								if (verticeDestino.getData().getTipo() == true && verticeDestino.getData().getCobro() == false) {
									jubilados.add(new Jubilado(verticeDestino.getData().getNombre(), verticeDestino.getData().getDomicilio()));
								}
							}
						}
					} else if (!colaPersonas.isEmpty()) {
						gradoRango--;
						colaPersonas.enqueue(null);
					}
				}
			}
		}
		
		return jubilados;
	}

	private Vertex<Persona> buscarPersona(Graph<Persona> grafo, String nombrePersona) {
		Vertex<Persona> devolver = null;
		int i = 0;
		
		while (devolver == null && i < grafo.getSize()) {
			if (grafo.getVertex(i).getData().getNombre() == nombrePersona)
				devolver = grafo.getVertex(i);
			i++;
		}
		
		return devolver;
	}
}
