package repaso_ej2;

public class Estacionamiento {
    private String nombre;
    private String direccion;
    private String horaApertura;
    private String horaCierre;
    
    private int nroPisos;
    private int nroPlazas;
    private Auto [][] matriz_autos;

    //Constructor
    public Estacionamiento(String nombre, String direccion){
        this.setNombre(nombre);
        this.setDireccion(direccion);
        this.setHoraApertura("8.00");
        this.setHoraCierre("21.00");
        this.nroPisos = 5;
        this.nroPlazas = 10;
        this.matriz_autos = new Auto [this.nroPisos][this.nroPlazas];
    }
    public Estacionamiento(String nombre, String direccion, String horaApertura, String horaCierre, int nroPisos, int nroPlazas){
        this.setNombre(nombre);
        this.setDireccion(direccion);
        this.setHoraApertura(horaApertura);
        this.setHoraCierre(horaCierre);
        this.nroPisos = nroPisos;
        this.nroPlazas = nroPlazas;
        this.matriz_autos = new Auto [nroPisos][nroPlazas];
    }
    
    //Getters
    public String getNombre() {
        return nombre;
    }
    public String getDireccion() {
        return direccion;
    }
    public String getHoraApertura() {
        return horaApertura;
    }
    public String getHoraCierre() {
        return horaCierre;
    }

    //Setters
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
    public void setHoraApertura(String horaApertura) {
        this.horaApertura = horaApertura;
    }
    public void setHoraCierre(String horaCierre) {
        this.horaCierre = horaCierre;
    }
    
    //Otros métodos
    public void insertarAuto(Auto unAuto, int posPiso, int posPlaza) {
        this.matriz_autos[posPiso][posPlaza] = unAuto; //Se asume que el lugar está vacío
    }
    public String buscarAutoPorPatente(String patente) {
        String aux = "";
        int posPiso = -1, posPlaza = -1;
        boolean encontrado = false;
        int i = 0, j = 0;
        while (i < this.nroPisos && !encontrado) { //Buscar en los pisos
            while (j < this.nroPlazas && !encontrado) { //Buscar en las plazas de cada piso
                if (this.matriz_autos[i][j] != null) { //Si hay un auto en esa plaza...
                    if (this.matriz_autos[i][j].getPatente().equals(patente)) { //Si la patente coincide...
                        encontrado = true;
                        posPiso = i;
                        posPlaza = j;
                    }
                }
                j++;
            }
            j = 0;
            i++;
        }
        if (encontrado) {
            aux = "El auto de patente " + patente + " se encuentra en el piso " + (posPiso+1) + ", plaza " + (posPlaza+1);
        } else {
            aux = "Auto Inexistente";
        }
        return aux;
    }
    public int numAutosPorPlaza(int numPlaza) {
        int cont = 0;
        for (int i = 0; i < this.nroPisos; i++) { //Teniendo en cuenta todos los pisos
            if (this.matriz_autos[i][numPlaza] != null) //Registrar el número de autos ubicados en numPlaza
                cont++; //Si la plaza está ocupada, entonces incrementar el contador
        }
        return cont;
    }
    public String toString() {
        String aux = "";
        for (int i = 0; i < this.nroPisos; i++) {
            for (int j = 0; j < this.nroPlazas; j++) {
                aux = aux + "Piso " + (i+1) + " Plaza " + (j+1) + " ";
                if (this.matriz_autos[i][j] != null) {
                    aux = aux + this.matriz_autos[i][j].toString() + " ";
                } else {
                    aux = aux + "libre ";
                }
            }
            aux = aux + "\n"; //Dejar una línea
        }
        return aux;
    }
}
