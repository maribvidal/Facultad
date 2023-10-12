package repaso_ej3;

/*
 Un evento ocasional es un recital que además tiene el motivo (a beneficio, show de TV
o show privado), el nombre del contratante del recital y el día del evento.
El constructor de eventos ocasionales además
recibe el motivo, el nombre del contratante y día del evento
*/

public class EventoOcasional extends Recital {
    private String motivo;
    private String nombreContratante;
    private int diaEvento;

    public EventoOcasional(String nombreBanda, int cantidadTemas, String motivo, String nombreContratante, int diaEvento) {
        super(nombreBanda, cantidadTemas);
        this.setMotivo(motivo);
        this.setNombreContratante(nombreContratante);
        this.setDiaEvento(diaEvento);
    }
    
    public String getMotivo() {
        return motivo;
    }
    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public String getNombreContratante() {
        return nombreContratante;
    }
    public void setNombreContratante(String nombreContratante) {
        this.nombreContratante = nombreContratante;
    }

    public int getDiaEvento() {
        return diaEvento;
    }
    public void setDiaEvento(int diaEvento) {
        this.diaEvento = diaEvento;
    }
    
    //Otros métodos
    /*
    
    iii. El evento ocasional debe saber responder al mensaje actuar de manera distinta:
 Si es un show de beneficencia se imprime la leyenda “Recuerden colaborar con…“
seguido del nombre del contratante.
 Si es un show de TV se imprime “Saludos amigos televidentes”
 Si es un show privado se imprime “Un feliz cumpleaños para…” seguido del
nombre del contratante.
Independientemente del motivo del evento, luego se imprime el listado de temas como
lo hace cualquier recital.
    
    */
    public void actuar() {
        if (this.getMotivo().toLowerCase().equals("show de beneficiencia")) {
            System.out.println("Recuerden colaborar con... " + this.getNombreContratante());
        } else if (this.getMotivo().toLowerCase().equals("show de tv")) {
            System.out.println("Saludos amigos televidentes");
        } else {
            System.out.println("Un feliz cumpleaños para... " + this.getNombreContratante());
        }
        super.actuar();
    }
    @Override
    public int calcularCosto() {
        int aux = 0;
        if (this.getMotivo().toLowerCase().equals("show de tv")) {
            aux = 50000;
        } else if (this.getMotivo().toLowerCase().equals("show privado")) {
            aux = 150000;
        }
        return aux;
    }
}
