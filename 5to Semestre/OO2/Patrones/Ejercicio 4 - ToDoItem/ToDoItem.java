package unlp.oo2.patrones.ej4;

import java.time.Duration;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class ToDoItem {
        private String name;
        private EstadoItem estado;
        private LocalDateTime tiempoInicial;
        private LocalDateTime tiempoFinal;
        private List<String> comentarios;

        // El objeto recien creado arranca con el estado 'PENDING'
        public ToDoItem(String name) {
        	this.estado = new PendingItem();
            this.tiempoInicial = LocalDateTime.now();
            this.comentarios = new ArrayList<String>();
        }
        
        public ToDoItem() {}

        public void start() {
        	this.estado.start(this);
        }

        public void togglePause() {
        	this.estado.togglePause(this);
        }
        
        public void finish() {
        	this.estado.finish(this);
        }

        public Duration workedTime() {
        	if (estado == null)
        		throw new RuntimeException("El objeto ToDoItem no se inicializó");
        	
        	return Duration.between(tiempoInicial, this.estado.workedTime());
        }


        public void addComment(String comment) {
        	this.estado.addComment(this, comment);
        }
        
        // Parte del patrón State
        public void cambiarEstado(EstadoItem nuevoEstado) {
        	this.estado = nuevoEstado;
        }
        
        // Debug
        public EstadoItem getEstado() {
        	return this.estado;
        }
        
        public List<String> getComentarios() {
        	return this.comentarios;
        }
}