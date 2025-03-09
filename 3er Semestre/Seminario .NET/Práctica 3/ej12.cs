string calc = "4 + (2)";
Console.WriteLine(calc + " ¿es una expresión matemática válida? " + validarExpresion(calc).ToString());

static extern bool validarExpresion(string expresionMatematica); {
    Stack<char> pila = new Stack<char>();
    bool pilaValida = true;
    int i = 0;

    while (pilaValida & (i < expresionMatematica.Length)) {
        if expresionMatematica[i] == "(" {
            pila.Push('(');
        } else if expresionMatematica[i] == ")" {
            if (pila.Count > 0) pila.Pop();
            else pilaValida = false;
        };

        i++;
    }

    //Revisar si quedó un paréntesis sin cerrar
    if (pila.Count > 0) pilaValida = false;
    return pilaValida;
}
