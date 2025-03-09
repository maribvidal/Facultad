package tp1.ejercicio8;

public class CircularQueue<T> extends Queue<T> {
	public T shift() {
		T shiftedElem = null; //Inicializar variable en null por si la cola está vacía
		if (!this.isEmpty()) { //Pero si no se encuentra vacía...
			shiftedElem = this.dequeue(); //Descolar el elemento del rabo y retornarlo
			this.enqueue(shiftedElem); //Encolarlo al frente
		}
		return shiftedElem;
	}
}
