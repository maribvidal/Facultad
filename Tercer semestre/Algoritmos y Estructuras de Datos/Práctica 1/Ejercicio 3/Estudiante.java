package tp1;	

public class Estudiante {
		private String nombre; 
		private String apellido;
		private String comision; 
		private String email; 
		private String direccion;
		
		//GETTERS y SETTERS
		public String getNombre() {
			return nombre;
		}
		public void setNombre(String nombre) {
			this.nombre = nombre;
		}
		
		public String getApellido() {
			return apellido;
		}
		public void setApellido(String apellido) {
			this.apellido = apellido;
		}
		public String getComision() {
			return comision;
		}
		public void setComision(String comision) {
			this.comision = comision;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public String getDireccion() {
			return direccion;
		}
		public void setDireccion(String direccion) {
			this.direccion = direccion;
		}
		
		//Otros métodos
		public String tusDatos() {
			String imprimir = "Nombre: " + this.getNombre() + " / Apellido: " + this.getApellido() + " / E-Mail: " + this.getEmail() + " / Dirección: " + this.getDireccion() +
					" / Comisión: " + this.getComision();
			return imprimir;
		}
	}
