using System.Reflection.Metadata;

namespace teoria1;

public class Matriz
{
    private int filas;
    private int columnas;
    private double[,] matriz;

    //Métodos de construcción
    public Matriz(int filas, int columnas)
    {
        this.filas = filas;
        this.columnas = columnas;
        this.matriz = new double[filas, columnas];
    }
    public Matriz(double[,] matriz)
    {
        this.matriz = matriz;
    }

    //Métodos de instancia
    public void SetElemento(int fila, int columna, double elemento)
    {
        this.matriz[fila, columna] = elemento;
    }
    public double GetElemento(int fila, int columna)
    {
        return matriz[fila, columna];
    }
    public void Imprimir()
    {
        for (int i = 0; i < filas; i++)
        {
            Console.Write('[');
            for (int j = 0; j < columnas; j++)
            {
                Console.Write(matriz[i, j]);
                //Si el elemento no es el último, dejar espacio
                if (j < columnas - 1) {Console.Write(", ");}
            }
            Console.WriteLine("]");
        }
    }
    public void Imprimir(string formatString)
    {
        for (int i = 0; i < filas; i++)
        {
            Console.Write('[');
            for (int j = 0; j < columnas; j++)
            {
                Console.Write(matriz[i, j].ToString(formatString));
                //Si el elemento no es el último, dejar espacio
                if (j < columnas - 1) {Console.Write(", ");}
            }
            Console.WriteLine("]");
        }
    }
    public double[] GetFila(int fila)
    {
        double[] arrFila = new double[this.columnas];
        for (int i = 0; i < this.columnas; i++)
            arrFila[i] = this.GetElemento(fila, i);
        return arrFila;
    }
    public double[] GetColumna(int columna)
    {
        double[] arrCol = new double[this.filas];
        for (int i = 0; i < this.filas; i++)
            arrCol[i] = this.GetElemento(i, columna);
        return arrCol;
    }
    public double[] GetDiagonalPrincipal()
    {
        double[] diagonalPrincipal = null;
        if (this.filas == this.columnas)
        {
            diagonalPrincipal = new double[this.filas]; //Es independientemente usar las filas o las columnas como dimensión
            for (int i = 0; i < this.filas; i++)
                diagonalPrincipal[i] = this.GetElemento(i, i);
        }
        else
            Console.WriteLine("ERROR: La matriz debe ser cuadrada");
        return diagonalPrincipal;
    }
    public double[] GetDiagonalSecundaria()
    {
        double[] diagonalSecundaria = null;
        if (this.filas == this.columnas)
        {
            diagonalSecundaria = new double[this.filas]; //Es independientemente usar las filas o las columnas como dimensión
            for (int i = 0; i < this.filas; i++)
                diagonalSecundaria[i] = this.GetElemento(i, this.filas - i - 1);
        }
        else
            Console.WriteLine("ERROR: La matriz debe ser cuadrada");
        return diagonalSecundaria;
    }
    public double[][] getArregloDeArreglo()
    {
        double[][] arregloDeArreglo = new double[this.filas][];
        for (int i = 0; i < this.filas; i++)
        {
            arregloDeArreglo[i] = new double[this.columnas];
            for (int j = 0; j < this.columnas; j++)
                arregloDeArreglo[i][j] = this.GetElemento(i, j);
        }
        return arregloDeArreglo;
    }
    public void sumarle(Matriz m)
    {
        bool condicion = (this.filas == m.filas && this.columnas == m.columnas);
        if (condicion)
        {
            for (int i = 0; i < this.filas; i++)
            {
                for (int j = 0; j < this.columnas; j++)
                    this.SetElemento(i, j, this.GetElemento(i, j) + m.GetElemento(i, j));
            }
        }
        else
            Console.WriteLine("ERROR: La matriz debe ser del mismo tamaño");
    }
    public void restarle(Matriz m)
    {
        bool condicion = (this.filas == m.filas && this.columnas == m.columnas);
        if (condicion)
        {
            for (int i = 0; i < this.filas; i++)
            {
                for (int j = 0; j < this.columnas; j++)
                    this.SetElemento(i, j, this.GetElemento(i, j) - m.GetElemento(i, j));
            }
        }
        else
            Console.WriteLine("ERROR: La matriz debe ser del mismo tamaño");
    }
    public void multiplicarPor(Matriz m) //Asumo que se refiere a multiplicar los elementos entre matrices de igual tamaño, ante la falta de aclaración
    {
        bool condicion = (this.filas == m.filas && this.columnas == m.columnas);
        if (condicion)
        {
            for (int i = 0; i < this.filas; i++)
            {
                for (int j = 0; j < this.columnas; j++)
                    this.SetElemento(i, j, this.GetElemento(i, j) * m.GetElemento(i, j));
            }
        }
        else
            Console.WriteLine("ERROR: La matriz debe ser del mismo tamaño");
    }
}
