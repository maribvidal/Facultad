String? userInput = "";
double strToNum;
double totalSum = 0;

Console.WriteLine("0 + ");
do {
    try 
    {
        Console.Write("Numero: ");
        userInput = Console.ReadLine();
        strToNum = double.Parse(userInput);
        Console.WriteLine(strToNum + " + ");
        totalSum += strToNum;
    }
    catch (Exception e)
    {
        if (userInput != " ") {
            Console.WriteLine("ERROR: " + e.Message);
        }
    }
} while (userInput != " ");
Console.Write(" = " + totalSum);
