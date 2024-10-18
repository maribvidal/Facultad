package ar.edu.unlp.oo1.ejercicio17;

/**
 *
 * @author alumnos
 */
public class Alquiler {
   Usuario usuario;
   Propiedad propiedad;
   DateLapse periodo;
   
   public Alquiler(Usuario usuario, Propiedad propiedad, DateLapse periodo) {
       this.usuario = usuario;
       this.propiedad = propiedad;
       this.periodo = periodo;
   }
   
   public double calcularPrecio() {
       int cantidadDias = this.periodo.sizeInDays();
       double precio = this.propiedad.getPrecio();
       return (cantidadDias * precio);
   }
   
   
}