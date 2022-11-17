/*
   Sebastian Torrejon Alonzo
*/

using System;

class c4
{
    static void Main()
    {
        int rows = 6;
        int cols = 7;
        int win_length = 4;

        connect4 c4 = new connect4(rows, cols, win_length);
        c4.play_game();
    }
}