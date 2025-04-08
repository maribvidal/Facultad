package unlp.oo2.patrones.ej4;

public class PendingItem extends EstadoItem {
    public void start(ToDoItem context) {
    	context.cambiarEstado(new InProgressItem());
    }
    
    public void togglePause(ToDoItem context) {
    	throw new RuntimeException("El objeto ToDoItem no se encuentra en pause o in-progress");
    }
    
    public void finish(ToDoItem context) {
    	// No hacer nada
    }
    
    public void addComment(ToDoItem context, String comment) {
    	context.getComentarios().add(comment);
    }
}
