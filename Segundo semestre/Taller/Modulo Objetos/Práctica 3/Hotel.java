package tema3;

public class Hotel {
    private int cantidadHabitaciones;
    private Habitacion [] habitaciones;
    
    public Hotel(int cantidadHabitaciones) { //Constructor
        this.cantidadHabitaciones = cantidadHabitaciones;
        habitaciones = new Habitacion[this.cantidadHabitaciones];
    }
    
    //Otros métodos de instancia
    public void meterCliente(int indice, Cliente c) {
        Habitacion h = new Habitacion();
        h.setCliente(c);
        h.setEstaOcupada(true);
        this.habitaciones[indice] = h;
    }
    
    public void aumentarPrecio(double monto) {
        int i;
        for (i = 0; i < this.cantidadHabitaciones; i++)
            this.habitaciones[i].setCostoNoche(this.habitaciones[i].getCostoNoche() + monto);
    }
    
    @Override
    public String toString() {
        int i;
        String cadenaTexto = "";
        //{Habitación 1: costo, libre u ocupada, información del cliente si está ocupada}
        //Crear cadena de texto
        for (i = 0; i < this.cantidadHabitaciones; i++) {
            if (this.habitaciones[i] != null) { //No leer si la habitación no fue instanciada
                cadenaTexto = cadenaTexto + "{Habitación " + i + ": " + habitaciones[i].getCostoNoche() + ", ";
                if (habitaciones[i].getEstaOcupada()) {
                    cadenaTexto = cadenaTexto + "ocupada, ";
                } else {
                    cadenaTexto = cadenaTexto + "libre, ";
                }
                cadenaTexto = cadenaTexto + habitaciones[i].getCliente().toString() + "\n";
            }
        }
        return cadenaTexto;
    }
}
