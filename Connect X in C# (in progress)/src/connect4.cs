/*
   Sebastian Torrejon Alonzo
*/

using System;
public partial class connect4
{
    private int rows;
    private int cols;
    private int win_length;

    public connect4(int rows, int cols, int win_length)
    {
        this.rows = rows;
        this.cols = cols;
        this.win_length = win_length;
    }
    public void play_game()
    {
        Console.WriteLine("Connect 4 with {0} rows, {1} columns, and win condition of {2}.", rows, cols, win_length);
    }

}