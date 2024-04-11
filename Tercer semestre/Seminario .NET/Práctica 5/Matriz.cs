namespace teoria5;

public class Matriz
{
    private int _filas;
    private int _columnas;
    private double[,] _matriz;
    //Propiedades de solo lectura
    public double[] diagonalPrincipal
    {
        get {
            double[] diagonalPrincipal = null;
            if (_filas == _columnas)
            {
                diagonalPrincipal = new double[_filas]; //Es independientemente usar las filas o las columnas como dimensión
                for (int i = 0; i < _filas; i++)
                    diagonalPrincipal[i] = _matriz[i, i]; //Usamos el indizador
            }
            else
                Console.WriteLine("ERROR: La matriz debe ser cuadrada");
            return diagonalPrincipal;
        }
    }
    public double[] diagonalSecundaria
    {
        get {
            double[] diagonalSecundaria = null;
            if (_filas == _columnas)
            {
                diagonalSecundaria = new double[_filas]; //Es independientemente usar las filas o las columnas como dimensión
                for (int i = 0; i < _filas; i++)
                    diagonalSecundaria[i] = _matriz[i, _filas - i - 1]; //Usamos el indizador
            }
            else
                Console.WriteLine("ERROR: La matriz debe ser cuadrada");
            return diagonalSecundaria;
        }
    }


    //Métodos de construcción
    public Matriz(int filas, int columnas)
    {
        _filas = filas;
        _columnas = columnas;
        _matriz = new double[filas, columnas];
    }
    public Matriz(double[,] matriz)
    {
        _matriz = matriz;
    }

    //Indizador para leer y escribir elementos de la matriz
    public double this[int fila, int columna]
    {
        get => _matriz[fila, columna];
        set => _matriz[fila, columna] = value;
    }

    //Métodos de instancia
    public void Imprimir()
    {
        for (int i = 0; i < _filas; i++)
        {
            Console.Write('[');
            for (int j = 0; j < _columnas; j++)
            {
                Console.Write(_matriz[i, j]);
                //Si el elemento no es el último, dejar espacio
                if (j < _columnas - 1) {Console.Write(", ");}
            }
            Console.WriteLine("]");
        }
    }
    public void Imprimir(string formatString)
    {
        for (int i = 0; i < _filas; i++)
        {
            Console.Write('[');
            for (int j = 0; j < _columnas; j++)
            {
                Console.Write(_matriz[i, j].ToString(formatString));
                //Si el elemento no es el último, dejar espacio
                if (j < _columnas - 1) {Console.Write(", ");}
            }
            Console.WriteLine("]");
        }
    }
    public double[] GetFila(int fila)
    {
        double[] arrFila = new double[_columnas];
        for (int i = 0; i < _columnas; i++)
            arrFila[i] = _matriz[fila, i]; //Usamos el indizador
        return arrFila;
    }
    public double[] GetColumna(int columna)
    {
        double[] arrCol = new double[_filas];
        for (int i = 0; i < _filas; i++)
            arrCol[i] = _matriz[i, columna]; //Usamos el indizador
        return arrCol;
    }
    public double[][] getArregloDeArreglo()
    {
        double[][] arregloDeArreglo = new double[_filas][];
        for (int i = 0; i < _filas; i++)
        {
            arregloDeArreglo[i] = new double[_columnas];
            for (int j = 0; j < _columnas; j++)
                arregloDeArreglo[i][j] = _matriz[i, j]; //Usamos el indizador
        }
        return arregloDeArreglo;
    }
    public void sumarle(Matriz m)
    {
        bool condicion = (_filas == m._filas && _columnas == m._columnas);
        if (condicion)
        {
            for (int i = 0; i < _filas; i++)
            {
                for (int j = 0; j < _columnas; j++)
                    _matriz[i, j] = _matriz[i, j] + m._matriz[i, j]; //Usamos los indizadores set y get
            }
        }
        else
            Console.WriteLine("ERROR: La matriz debe ser del mismo tamaño");
    }
    public void restarle(Matriz m)
    {
        bool condicion = (_filas == m._filas && _columnas == m._columnas);
        if (condicion)
        {
            for (int i = 0; i < _filas; i++)
            {
                for (int j = 0; j < _columnas; j++)
                    _matriz[i, j] = _matriz[i, j] - m._matriz[i, j]; //Usamos los indizadores set y get
            }
        }
        else
            Console.WriteLine("ERROR: La matriz debe ser del mismo tamaño");
    }
    public void multiplicarPor(Matriz m) //Asumo que se refiere a multiplicar los elementos entre matrices de igual tamaño, ante la falta de aclaración
    {
        bool condicion = (_filas == m._filas && _columnas == m._columnas);
        if (condicion)
        {
            for (int i = 0; i < _filas; i++)
            {
                for (int j = 0; j < _columnas; j++)
                    _matriz[i, j] = _matriz[i, j] * m._matriz[i, j]; //Usamos los indizadores set y get
            }
        }
        else
            Console.WriteLine("ERROR: La matriz debe ser del mismo tamaño");
    }
}
