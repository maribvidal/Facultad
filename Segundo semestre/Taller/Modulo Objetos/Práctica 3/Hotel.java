package tema3;

import PaqueteLectura.GeneradorAleatorio;

public class Hotel {
    private int cantidadHabitaciones;
    private Habitacion [] habitaciones;
    
    public Hotel(int cantidadHabitaciones) { //Constructor
        int i;
        GeneradorAleatorio.iniciar();
        this.cantidadHabitaciones = cantidadHabitaciones;
        habitaciones = new Habitacion[this.cantidadHabitaciones];
        for (i = 0; i < this.cantidadHabitaciones; i++){
            Habitacion h = new Habitacion();
            h.setCostoNoche(2000 + GeneradorAleatorio.generarDouble(6000));
            h.setEstaOcupada(false);
            System.out.println(i + " " + h.toString());
            this.habitaciones[i] = h;
        }
    }
    
    //Otros métodos de instancia
    public void meterCliente(int indice, Cliente c) {
        this.habitaciones[indice].setCliente(c);
        this.habitaciones[indice].setEstaOcupada(true);
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
            cadenaTexto = cadenaTexto + "{Habitación " + i + ": " + habitaciones[i].getCostoNoche() + ", ";
            if (habitaciones[i].getEstaOcupada()) {
                cadenaTexto = cadenaTexto + "ocupada, " + habitaciones[i].getCliente().toString() + "} \n";
            } else {
                cadenaTexto = cadenaTexto + "libre} \n";
            }
            //cadenaTexto = cadenaTexto + habitaciones[i].getCliente().getNombre() + "\n"; INTENTABA INVOCAR UN CLIENTE Q NO EXISTÍA
            }
        return cadenaTexto;
    }
}
