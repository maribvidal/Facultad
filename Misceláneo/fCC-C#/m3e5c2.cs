string? inputString;
int inputValue;
Boolean validEntry = false;

Console.WriteLine("Enter an integer value between 5 and 10");

do
{
    inputString = Console.ReadLine();
    validEntry = int.TryParse(inputString, out inputValue);
    if (validEntry)
    {
        validEntry = (inputValue > 4 && inputValue < 11) ? true : false;
        if (!validEntry)
            Console.WriteLine($"You entered {inputValue}. Please enter a number between 5 and 10.");
    }
    else
        Console.WriteLine("Sorry, you entered an invalid number, please try again");
} while (validEntry == false);

Console.WriteLine($"Your input value ({inputValue}) has been accepted.");
