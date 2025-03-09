using System.Text;

//Para utilizar este programa hay que pasar UN solo número como argumento
if (args.Length == 1) 
{
    int argumento = int.Parse(args[0]);
    Console.WriteLine($"{argumento} en sistema binario es igual a " + binaryConvert(argumento));
}

String binaryConvert(int numero) {
    StringBuilder numBinario = new StringBuilder();
    Stack<int> pilaBinaria = new Stack<int>();
    int resto;

    while (numero > 0) {
        resto = numero % 2;
        pilaBinaria.Push(resto);
        numero /= 2;
    }

    //Desapilar pila
    while (pilaBinaria.Count > 0) numBinario.Append(pilaBinaria.Pop());
    return numBinario.ToString();
}
