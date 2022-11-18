/*
   Sebastian Torrejon Alonzo
*/

using System;
public partial class connect4
{
    private int rows = 6;
    private int cols = 7;
    private int win_length = 4;
    private string player = "1";
    private int bin = 0;
    private string[] board;

    public connect4(string board_size, int winC)
    {
        win_length = winC;

        if (board_size.Length == 3)
        {
            rows = board_size[0] - '0';
            cols = board_size[2] - '0';
        }
        else if (board_size.Length == 4)
        {
            char x = board_size[1];
            if (x == 'x' || x == 'X')
            {
                rows = board_size[0] - '0';  
                cols = Int32.Parse(board_size.Substring(2));
            }
            else
            {
                rows = Int32.Parse(board_size.Substring(0,2));
                cols = board_size[3] - '0';  
            }
        }
        else if (board_size.Length == 5)
        {
            rows = Int32.Parse(board_size.Substring(0,2));
            cols = Int32.Parse(board_size.Substring(3));
        }
        else
        {
            Console.WriteLine("error creating board dimensions");
            Environment.Exit(0);
        }
    }

    public string header() { //return the name of each column
        return "A B C D E F G H I J K L M O P R S T U ".Substring( 0, cols * 2);
    }

    public void makeBoard() { //creates an array with dots of the size of the board.
        int size = cols * rows;
        board = new string[size];
        for (int i = 0; i < size; i++) {
            board[i] = ".";
        }
    }

    public void printBoard() { //prints to the terminal the array of dots in its corresponding rows
        Console.WriteLine(header());
        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < cols; j++) {
                Console.Write("{0} ", board[i * cols + j]);
            }
        Console.WriteLine("");
        }
    }

    public void choose() {
        char c;
        while (true)
        {
            Console.Write("Player {0}, please enter a column: ", player);
            c = Console.ReadLine()[0];

            switch (c)
            {
            case 'A':
            case 'a':
                bin = 0;
                break;
            case 'B':
            case 'b':
                bin = 1;
                break;
            case 'C':
            case 'c':
                bin = 2;
                break;
            case 'D':
            case 'd':
                bin = 3;
                break;
            case 'E':
            case 'e':
                bin = 4;
                break;
            case 'F':
            case 'f':
                bin = 5;
                break;
            case 'G':
            case 'g':
                bin = 6;
                break;
            case 'H':
            case 'h':
                bin = 7;
                break;
            case 'I':
            case 'i':
                bin = 8;
                break;
            case 'J':
            case 'j':
                bin = 9;
                break;
            case 'K':
            case 'k':
                bin = 10;
                break;
            case 'L':
            case 'l':
                bin = 11;
                break;
            case 'M':
            case 'm':
                bin = 12;
                break;
            case 'N':
            case 'n':
                bin = 13;
                break;
            case 'O':
            case 'o':
                bin = 14;
                break;
            case 'P':
            case 'p':
                bin = 15;
                break;
            case 'R':
            case 'r':
                bin = 16;
                break;
            case 'S':
            case 's':
                bin = 17;
                break;
            case 'T':
            case 't':
                bin = 18;
                break;
            case 'U':
            case 'u':
                bin = 19;
                break;
            case 'Q':
            case 'q':
                Console.WriteLine("Goodbye.");
                Environment.Exit(0);
                break;
            default:
                bin = 666;
                break;
            }

            if ((bin >= 0 && bin < cols) && (board[bin] == "."))
            {
                fillBin();
                if (player == "1") {
                    player = "2";
                } else {
                    player = "1";
                }
                break;
            }
            else
            {
                Console.WriteLine("Invalid input, please try again.");
                printBoard();
            }
        }
    }

    public void fillBin() {
        for (int level = rows - 1; level >= 0; level--)
        {
            if (board[level * cols + bin] == ".")
            {
                board[level * cols + bin] = player;
                break;
            }
        }
    }

    public void check(string player) {

        int count, ways;

        // check for x-disc rows
        ways = cols - win_length + 1;

        for (int i = 0; i < rows; i++)
        { // go through each row
            for (int j = 0; j < ways; j++)
            { // go through each possible winnable position on the current row
                count = 0;
                for (int k = 0; k < win_length; k++)
                { // check for x in a row with same disc
                    if (board[i * cols + (j + k)] == player)
                    {
                        count = count + 1;
            
                    }
                }
                if (count == win_length)
                {
                    Console.WriteLine("Congratulations, Player {0}. You win.", player);
                    Environment.Exit(0);
                }
            }
        }

        // check for x-disc columns
        ways = rows - win_length + 1;
        for (int i = 0; i < cols; i++)
        { // go through each column
            count = 0;
            for (int j = 0; j < ways; j++)
            { // go through each possible winnable position on the current column
                count = 0;
                for (int k = 0; k < win_length; k++)
                { // check for x in a vertical-row with same disc
                    if (board[(j + k) * cols + i] == player)
                    {
                        count++;
                    }
                }
                if (count == win_length)
                {
                    Console.WriteLine("Congratulations, Player {0}. You win.", player);
                    Environment.Exit(0);
                }
            }
        }

        // check upward diagonal
        ways = cols - win_length + 1;

        for (int i = (win_length - 1); i < rows; i++)
        { // go through each row where a winnable diagonal can be at
            for (int j = 0; j < ways; j++)
            { // go through each possible winnable position on the current row
                count = 0;
                for (int k = 0; k < win_length; k++)
                { // check for x in a diagonal with same disc
                    if (board[(i - k) * cols + (j + k)] == player)
                    {
                        count++;
                    }
                }
                if (count == win_length)
                {
                    Console.WriteLine("Congratulations, Player {0}. You win.", player);
                    Environment.Exit(0);
                }
            }
        }

        // check downward diagonal
        ways = cols - win_length + 1;

        for (int i = (win_length - 1); i < rows; i++)
        { // go through each row where a winnable diagonal can be at
            for (int j = 1; j <= ways; j++)
            { // go through each possible winnable position on the current row
                count = 0;
                for (int k = 0; k < win_length; k++)
                { // check for x in a diagonal with same disc
                    if (board[(i - k) * cols + (cols - j - k)] == player)
                    {
                        count++;
                    }
                }
                if (count == win_length)
                {
                    Console.WriteLine("Congratulations, Player {0}. You win.", player);
                    Environment.Exit(0);
                }
            }
        }
    }

    public void play_game()
    {
        Console.WriteLine("Connect 4 with {0} rows, {1} columns, and win condition of {2}.", rows, cols, win_length);
        makeBoard();
        printBoard();
        while (true)
        {
            choose();
            printBoard();
            check("1");
            check("2");
        }
    }

}