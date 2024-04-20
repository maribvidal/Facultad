string? userInput;
Boolean validInput = false;

Console.WriteLine("Enter your role name (Administrator, Manager, or User)");

do
{
    userInput = Console.ReadLine();
    userInput.Trim();
    switch (userInput.ToLower())
    {
        case "administrator":
        case "manager":
        case "user":
            validInput = true;
            break;
        default:
            Console.WriteLine($"The role name that you entered, \"{userInput}\" is not valid. Enter your role name (Administrator, Manager, or User)");
            break;
    }
} while (validInput == false);

Console.WriteLine($"Your input value ({userInput}) has been accepted.");
