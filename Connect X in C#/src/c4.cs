/*
   Sebastian Torrejon Alonzo
*/

using System;

class c4
{
    static void Main(string[] args)
    {
        string board_size = "6x7";
        int winC = 4;

        if (args.Length == 2) // getting 2 inputs from user
        {
            board_size = args[0];
            winC = Int32.Parse(args[1]);
        }
        else if (args.Length == 1) // getting one input from user and detecting if its board-size or win-condition
        {
            if (args[0].Contains('x'))
            {
                board_size = args[0];
            }
            else
            {
                winC = Int32.Parse(args[0]);
            }
        }

        connect4 c4 = new connect4(board_size, winC);
        c4.play_game();
    }
}