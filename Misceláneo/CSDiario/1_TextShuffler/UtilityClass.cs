namespace textShuffler;

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

    public static int GetNumber(int maxInterval)
    {
        int userNumber = 0;
        bool inputReceived = false;
        string? userInput = null;

        while (!inputReceived) {
            Console.Write("> ");
            userInput = Console.ReadLine();

            if (Int32.TryParse(userInput, out userNumber)) 
            {
                if (userNumber <= maxInterval)
                    inputReceived = true;
            }
        }

        return userNumber;
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
        string? userInput = "";
        while (String.IsNullOrEmpty(userInput))
        {
            Console.Write(">:__");
            userInput = Console.ReadLine();
        }
        return userInput;
    }

    public static string GetFilePath()
    {
        string? userPath = "";
        while (!File.Exists(userPath))
        {
            userPath = GetInput();
        }
        return userPath;
    }
}