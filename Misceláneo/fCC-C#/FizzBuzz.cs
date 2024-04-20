/*REGLAS DEL FIZZBUZZ
    -Valores de salida de 1 a 100, un número por línea, dentro del bloque de código de iteración
    -Si el valor actual es divisible por 3, se imprime el término Fizz junto al número
    -Si el valor actual es divisible por 5, se imprime el término Buzz junto al número
    -Si el valor actual es divisible por 3 Y por 5, se imprime el término FizzBuzz junto al número
*/
class FizzBuzz 
{
    static void Main() {
        for (int i = 0; i <= 100; i++)
        {
            Console.Write(i); //El número siempre se va a escribir
            if (i % 3 == 0 || i % 5 == 0) 
            {
                Console.Write(" - ");
                if (i % 3 == 0)
                    Console.Write("Fizz");
                if (i % 5 == 0)
                    Console.Write("Buzz");
            }
        Console.WriteLine();
        }
    }
}
