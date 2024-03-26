package tp1.ejercicio8;
import java.util.*;

public class DoubleEndedQueue<T> extends Queue<T> {
	public void enqueueFirst(T dato) {
		data.add(0, dato);
	}
}
