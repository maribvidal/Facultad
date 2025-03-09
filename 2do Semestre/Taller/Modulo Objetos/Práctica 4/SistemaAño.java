package tema4;

public class SistemaAño extends Sistema { //Version de años del Sistema
    private double [] tempEstacion; //Vamos a usar un VECTOR para registrar el promedio de temperatura que tenga tal año
    int i;
    
    public SistemaAño(String nombre, String latitud, String longitud, int añosConsecutivos, int añoBase){
        super(nombre, latitud, longitud, añosConsecutivos, añoBase);
        this.tempEstacion = new double [this.getAñosConsecutivos()]; //Porque lo tenemos que hacer con los años
        
        //Inicializar cada valor de la matriz en un valor "muy alto"
        for (i = 0; i < this.getAñosConsecutivos(); i++){
            this.tempEstacion[i] = 999;
        }
    }

    
    //Métodos heredados
    @Override
    public void registrarTemp(double input1, int input2){
        this.tempEstacion[input2 - this.getAñoBase()] = input1; //Restarle al input2 el añoBase para saber a qué indice del vector acceder
    }
    
    @Override
    public double obtenerTemp(int input1){
        return (this.tempEstacion[input1 - this.getAñoBase()]);
    }
    
    @Override
    public String devolverMayorTemp(){
        int añoMax = 0;
        double tempMax = -1;
        for (i = 0; i < this.getAñosConsecutivos(); i++){ //Hacer otro FOR que itere los meses buscando la mayor temperatura
            if (this.tempEstacion[i] > tempMax){ //Si la encuentra, actualizar temp. max
                tempMax = this.tempEstacion[i];
                añoMax = i;
            }
        }
        
        String aux = "La mayor temperatura registrada (" + tempMax + ") ocurrió en el año " + (añoMax + this.getAñoBase());
        return aux;
    }
    
    //toString
    @Override
    public String toString(){
        String aux = super.toString(); //Buscar el toString() a partir de la clase arriba en la jerarquía
        for (i = 0; i < this.getAñosConsecutivos(); i++)
            aux = aux + "\n Año " + (this.getAñoBase() + i) + ": " + this.tempEstacion[i] + " ºC;";
        return aux;
    }
}
