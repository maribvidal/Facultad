package repaso_ej3;

/*
 Una gira es un recital que además tiene un nombre y las “fechas” donde se repetirá la
actuación. De cada “fecha” se conoce la ciudad y el día. Además la gira guarda el
número de la fecha en la que se tocará próximamente (actual).
 */

public class Gira extends Recital {
    private String nombreGira;
    private int cantidadFechas = 0;
    private int gira_dimL = 0;
    private int indice = 0;
    private Fecha [] fechas;

    public Gira(String nombreBanda, int cantidadTemas, String nombreGira, int cantidadFechas) {
        super(nombreBanda, cantidadTemas);
        this.setNombreGira(nombreGira);
        this.cantidadFechas = cantidadFechas;
        this.fechas = new Fecha[this.cantidadFechas];
    }
    public String getNombreGira() {
        return nombreGira;
    }
    public void setNombreGira(String nombreGira) {
        this.nombreGira = nombreGira;
    }

    public Fecha getFechaActual() {
        return fechaActual;
    }
    public void setFechaActual(Fecha fechaActual) {
        this.fechaActual = fechaActual;
    }
    
    //Otros métodos
    /*
    
    ii. La gira debe saber responder a los mensajes:
 agregarFecha que recibe una “fecha” y la agrega adecuadamente.
 La gira debe responder al mensaje actuar de manera distinta. Imprime la leyenda
“Buenas noches …” seguido del nombre de la ciudad de la fecha “actual”. Luego
debe imprimir el listado de temas como lo hace cualquier recital. Además debe
establecer la siguiente fecha de la gira como la nueva “actual”.
    
    */
    public void agregarFecha(Fecha nuevaFecha) {
        if (this.gira_dimL < this.cantidadFechas) {
            this.fechas[gira_dimL] = nuevaFecha;
            this.gira_dimL++;
        } else {
            System.out.println("ERROR: No se pueden agregar mas fechas");
        }
    }
    @Override
    public void actuar() {
        if (this.fechas[indice] != null) {
            System.out.println("Buenas noches... " + this.fechas[indice].getCiudad());
        }
        super.actuar();
        if (this.indice < this.gira_dimL) {
            this.indice++;
        } else {
            System.out.println("ERROR: Ya no hay mas fechas");
        }
    }
    @Override
    public int calcularCosto() {
        return (30000 * this.gira_dimL);
    }
}
