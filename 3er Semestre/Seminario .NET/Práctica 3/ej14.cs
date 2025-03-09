using System.Text;

// PASAR ARGUMENTOS POR CONSOLA - dotnet run (mensaje a cifrar)
StringBuilder msjCifrar = new StringBuilder();
for (int i = 0; i < args.Length; i++) {
    msjCifrar.Append(args[i]);
}

Queue<int> colaClave = new Queue<int>();
colaClave.Enqueue(1);
colaClave.Enqueue(2);
colaClave.Enqueue(4);
colaClave.Enqueue(8);

msjCifrar = cifrarMensaje(msjCifrar);
Console.WriteLine(msjCifrar);
msjCifrar = descifrarMensaje(msjCifrar);
Console.WriteLine(msjCifrar);

StringBuilder cifrarMensaje(StringBuilder msj) {
    StringBuilder msjCifrado = new StringBuilder();
    int valorChar;
    int dequeuedElem;
    for (int i = 0; i < msj.Length; i++) {
        dequeuedElem = colaClave.Dequeue();
        valorChar = (int)msj[i];
        //Console.WriteLine(msj[i] + " " + dequeuedElem + " " + valorChar);
        valorChar += dequeuedElem;
        msjCifrado.Append(Convert.ToChar(valorChar));
        colaClave.Enqueue(dequeuedElem);
    }

    return msjCifrado;
}

StringBuilder descifrarMensaje(StringBuilder msj) {
    StringBuilder msjCifrado = new StringBuilder();
    int valorChar;
    int dequeuedElem;
    for (int i = 0; i < msj.Length; i++) {
        dequeuedElem = colaClave.Dequeue();
        valorChar = (int)msj[i];
        valorChar -= dequeuedElem;
        msjCifrado.Append(Convert.ToChar(valorChar));
        colaClave.Enqueue(dequeuedElem);
    }

    return msjCifrado;
}
