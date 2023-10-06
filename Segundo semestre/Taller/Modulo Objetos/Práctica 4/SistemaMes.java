package tema4;

public class SistemaMes extends Sistema { //Version de meses del Sistema
    private double [] tempEstacion; //Vamos a usar un VECTOR para registrar las temperaturas que pasen en tal mes
    int i;
    
    public SistemaMes(String nombre, String latitud, String longitud, int añosConsecutivos, int añoBase){
        super(nombre, latitud, longitud, añosConsecutivos, añoBase);
        this.tempEstacion = new double [12]; //Porque son 12 los meses Xd
        
        //Inicializar cada valor de la matriz en un valor "muy alto"
        for (i = 0; i < 12; i++){
            this.tempEstacion[i] = 15;
        }
    }

    
    //Métodos heredados
    @Override
    public void registrarTemp(double input1, int input2){
        this.tempEstacion[input2 - 1] = input1;
    }
    
    @Override
    public double obtenerTemp(int input1){
        return (this.tempEstacion[input1 - 1]);
    }
    
    @Override
    public String devolverMayorTemp(){
        double tempMax = -1;
        int mesMax = 0;
        for (i = 0; i < 12; i++){ //Hacer otro FOR que itere los meses buscando la mayor temperatura
            if (this.tempEstacion[i] > tempMax){ //Si la encuentra, actualizar temp. max
                tempMax = this.tempEstacion[i];
                mesMax = i;
            }
        }
        
        String aux = "La mayor temperatura registrada (" + tempMax + ") ocurrió en el mes " + (mesMax + 1);
        return aux;
    }
    
    //toString
    @Override
    public String toString(){
        String aux = super.toString(); //Buscar el toString() a partir de la clase arriba en la jerarquía
        for (i = 0; i < 12; i++)
            aux = aux + "\n Mes nro. " + (i + 1) + ": " + this.tempEstacion[i] + " ºC;";
        return aux;
    }
}
