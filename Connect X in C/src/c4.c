/*
   Sebastian Torrejon Alonzo
*/
#include "connect4.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[])
{
    char *board_size = "6x7";
    int winC = 4;

    if (argc == 3) // getting 2 inputs from user
    {
        board_size = argv[1];
        winC = atoi(argv[2]);
    }
    else if (argc == 2) // getting one input from user and detecting if its board-size or win-condition
    {
        if (strlen(argv[1]) == 1)
        {
            winC = atoi(argv[1]);
        }
        else
        {
            board_size = argv[1];
        }
    }

    set_cond(board_size, winC);
    create_scores();
    board();
    while (1)
    {
        choose();
        board();
        if (check('1'))
        {
            printf("Congratulations, Player 1. You win.\n");
            break;
        }
        if (check('2'))
        {
            printf("Congratulations, Player 2. You win.\n");
            break;
        }
    }

    // zk I would free scores here, instead of having many different calls to free() in your 
    // check() function.
    return 0;
}