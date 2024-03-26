package tp1.ejercicio8;
import java.util.*;

public class Queue<T> extends Sequence {
	private List<T> data;
	
	//Métodos específicos de la clase
	public Queue() {
		this.data = new LinkedList<T>();
	}
	public void enqueue(T dato) {
		data.add(dato);
	}
	public T dequeue() {
		return data.remove(0);
	}
	public T head() {
		return data.get(0);
	}

	//Métodos heredados
	@Override
	public int size() {
		return data.size();
	};
	
	@Override
	public boolean isEmpty() {
		return (data.size() == 0);
	};
	
	 @Override
	 public String toString() {
		 String texto = "[ ";
		 for(T elem: data)
			 texto = texto + elem + " ";
		 return texto + "]";
	 }
}
