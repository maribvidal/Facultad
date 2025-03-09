package repasoparcial;

public class Sistema {
    private int topeDias = 5;
    private int topeTurnos = 6;
    private Paciente [][] matriz = new Paciente [topeDias][topeTurnos];
    
    public Sistema() { //Constructo del sistema sin pacientes
    }
    
    //Se asume que el turno del día está libre
    public void colocarPaciente(Paciente unPaciente, int unDia, int unTurno) {
        this.matriz[unDia][unTurno] = unPaciente;
    }
    //Dado el nombre de un paciente, liberar todos sus turnos.
    //Por "liberar el turno" entiendo poner su lugar de la matriz en null
    public void quitarPaciente(String nomPaciente) {
        //No queda otra que recorrer toda la matriz
        for (int i = 0; i < topeDias; i++) {
            for (int j = 0; j < topeTurnos; j++) {
                //Primero comprobar que existe un objeto en dicha posición (evitar nullPointerException)
                if (this.matriz[i][j] != null) {
                    //Comprobar si el paciente tiene el mismo nombre
                    if (this.matriz[i][j].getNombre().equals(nomPaciente))
                        this.matriz[i][j] = null;
                }
            }
        }
    }
    //Dado un día D y el nombre de un paciente, devolver si el paciente tiene agendado un
    //turno ese día. Asuma que D es válido.
    public boolean tieneTurno(int unDia, String nomPaciente) {
        boolean aux = false;
        int i = 0;
        while (i < topeTurnos && !aux) {
            if (this.matriz[unDia][i] != null) {
                if (this.matriz[unDia][i].getNombre().equals(nomPaciente))
                    aux = true;
            }
            i++;
        }
        return aux;
    }

    @Override
    public String toString() {
        String aux = "";
        for (int i = 0; i < topeDias; i++) {
            aux = aux + "DÍA NÚMERO " + (i+1) + "\n";
            for (int j = 0; j < topeTurnos; j++) {
                aux = aux + "Turno no." + (j+1) + ": ";
                //Primero comprobar que existe un objeto en dicha posición (evitar nullPointerException)
                if (this.matriz[i][j] != null) {
                    aux = aux + this.matriz[i][j].toString();
                } else {
                    aux = aux + "vacío";
                }
                aux = aux + "\n";
            }
        }
        return aux;
    }
}
