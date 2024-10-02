namespace cifrador;

public static class UtilityClass
{
    public static char GetLetter()
    {
        bool keyObtained = false;
        char userInput = char.MinValue;

        while (!keyObtained)
        {
            Console.Write("> ");
            userInput = Console.ReadKey(true).KeyChar;
            keyObtained = Char.IsLetter(userInput);
        }

        return userInput;
    }

    public static void GetSpacebar()
    {
        bool spaceObtained = false;
        
        while (!spaceObtained)
        {
            var keyInfo = Console.ReadKey(true);
            if (keyInfo.Key == ConsoleKey.Spacebar)
                spaceObtained = true;
        }
    }

    public static void WaitUser()
    {
        Console.WriteLine();
        Console.WriteLine("* PRESIONE UNA TECLA PARA CONTINUAR");
        UtilityClass.GetLetter();
    }

    public static string GetInput()
    {
        string? userInput = null;
        while (userInput == null)
        {
            Console.Write("> ");
            userInput = Console.ReadLine();
        }
        return userInput;
    }

    public static int GetNumber(int minInterval, int maxInterval)
    {
        int userNumber = 0;
        bool inputReceived = false;
        string? userInput = null;

        while (!inputReceived) {
            Console.Write("> ");
            userInput = Console.ReadLine();

            if (Int32.TryParse(userInput, out userNumber)) 
            {
                if (userNumber >= minInterval && userNumber <= maxInterval)
                    inputReceived = true;
            }
        }

        return userNumber;
    }

    public static void TimedWriteLine(string str, int sec = 1)
    {
        Thread.Sleep(200 * sec);
        Console.WriteLine(str);
    }

    public static void TimedWrite(string str, int halfsec = 1)
    {
        Thread.Sleep(500 * halfsec);
        Console.Write(str);
    }
}
