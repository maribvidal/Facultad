// Ejercicio 12 - Práctica 2
using System;

//Inciso A
for (Meses mes = Meses.diciembre; mes >= Meses.enero; mes--)
{
    Console.WriteLine("Mes: " + mes.ToString());
}

//Inciso B
Console.Write("\nIngrese una palabra: ");
string str_input = Console.ReadLine();
Boolean esUnMes = false;
for (Meses mes = Meses.enero; mes <= Meses.diciembre; mes++)
{
    if (mes.ToString() == str_input) {
        esUnMes = true;
    }
}
Console.WriteLine("¿Es un mes " + str_input + "? " + esUnMes.ToString());

//INSTRUCCIONES DE NIVEL SUPERIOR
enum Meses
{
    enero, febrero, marzo, abril, mayo, junio, julio, agosto, septiembre, octubre, noviembre, diciembre
}
