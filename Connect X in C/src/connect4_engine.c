/*
   Sebastian Torrejon Alonzo
*/
#include "connect4.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int row = 6;
int col = 7;
int wincond = 4;
char score[6][7];
char columns[] = "A B C D E F G H I J K L M N O P R S T U";
int bin = 0;
char disc = '1';
char *scores;

void set_cond(char *board_size, int winC) // set the right columns/rows/win-cond depending on user input
{
    wincond = winC;

    // zk a short-cut would be to use sscan(board_size, "%dx%d", &row, &col)
    if (strlen(board_size) == 3)
    {
        char temp_row = board_size[0];
        row = temp_row - '0';
        char temp_col = board_size[2];
        col = temp_col - '0';
    }
    else if (strlen(board_size) == 4)
    {
        char x = board_size[1];
        if (x == 'x' || x == 'X')
        {
            char temp_row = board_size[0];
            row = temp_row - '0';
            char temp_col[100] = "";
            char temp_col1 = board_size[2];
            char temp_col2 = board_size[3];
            strncat(temp_col, &temp_col1, 1);
            strncat(temp_col, &temp_col2, 1);
            col = atoi(temp_col);
        }
        else
        {
            char temp_row[100] = "";
            char temp_row1 = board_size[0];
            char temp_row2 = board_size[1];
            strncat(temp_row, &temp_row1, 1);
            strncat(temp_row, &temp_row2, 1);
            row = atoi(temp_row);
            char temp_col = board_size[3];
            col = temp_col - '0';
        }
    }
    else if (strlen(board_size) == 5)
    {
        char temp_row[100] = "";
        char temp_row1 = board_size[0];
        char temp_row2 = board_size[1];
        strncat(temp_row, &temp_row1, 1);
        strncat(temp_row, &temp_row2, 1);
        row = atoi(temp_row);
        char temp_col[100] = "";
        char temp_col1 = board_size[3];
        char temp_col2 = board_size[4];
        strncat(temp_col, &temp_col1, 1);
        strncat(temp_col, &temp_col2, 1);
        col = atoi(temp_col);
    }
    else
    {
        printf("error creating board dimensions");
        exit(0);
    }
}

void create_scores() // create the empty 2d board and fill it with dots
{
    char *temp_scores = malloc((row * col) * sizeof(char));
    for (int i = 0; i < row * col; i++)
    {
        temp_scores[i] = '.';
    }
    scores = temp_scores;
}

void board() // function to print in terminal the board and its values
{
    int n = col * 2 - 1;
    printf("%.*s\n", n, columns);
    for (int i = 0; i < row; i++)
    {
        for (int j = 0; j < col; j++)
        {
            printf("%c ", scores[i * col + j]);
        }
        printf("\n");
    }
}

void choose() // check for user input column is valid
{
    char c;
    while (1)
    {
        printf("Player %c, please enter a column: ", disc);
        scanf(" %c", &c);

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
            printf("Goodbye.");
            exit(0);
        default:
            bin = 666;
        }

        if ((bin >= 0 && bin < col) && (scores[bin] == '.'))
        {
            fill_bin();
            disc = (disc == '1') ? '2' : '1';
          
            break;
        }
        else
        {
            printf("Invalid input, please try again. ");
            board();
        }
    }
}

void fill_bin() // fill board with user input if input was valid
{
    for (int level = row - 1; level >= 0; level--)
    {
        if (scores[level * col + bin] == '.')
        {
            scores[level * col + bin] = disc;
            break;
        }
    }
}

// zk an idea for next time: Instead of having check() look for a specific player,
// consider having check look for *any* player and simply
// return which player won. That solution will allow you to
// make the while(1) loop in c4.c cleaner.

int check(char disc) // check for a winner
{
    int count, ways;

    // check for x-disc rows
    ways = col - wincond + 1;

    for (int i = 0; i < row; i++)
    { // go through each row
        for (int j = 0; j < ways; j++)
        { // go through each possible winnable position on the current row
            count = 0;
            for (int k = 0; k < wincond; k++)
            { // check for x in a row with same disc
                if (scores[i * col + (j + k)] == disc)
                {
                    count++;
                }
            }
            if (count == wincond)
            {
                free(scores);
                return 1;
            }
        }
    }

    // check for x-disc columns
    ways = row - wincond + 1;
    for (int i = 0; i < col; i++)
    { // go through each column
        count = 0;
        for (int j = 0; j < ways; j++)
        { // go through each possible winnable position on the current column
            count = 0;
            for (int k = 0; k < wincond; k++)
            { // check for x in a vertical-row with same disc
                if (scores[(j + k) * col + i] == disc)
                {
                    count++;
                }
            }
            if (count == wincond)
            {
                free(scores);
                return 1;
            }
        }
    }

    // check upward diagonal
    ways = col - wincond + 1;

    for (int i = (wincond - 1); i < row; i++)
    { // go through each row where a winnable diagonal can be at
        for (int j = 0; j < ways; j++)
        { // go through each possible winnable position on the current row
            count = 0;
            for (int k = 0; k < wincond; k++)
            { // check for x in a diagonal with same disc
                if (scores[(i - k) * col + (j + k)] == disc)
                {
                    count++;
                }
            }
            if (count == wincond)
            {
                free(scores);
                return 1;
            }
        }
    }

    // check downward diagonal
    ways = col - wincond + 1;

    for (int i = (wincond - 1); i < row; i++)
    { // go through each row where a winnable diagonal can be at
        for (int j = 1; j <= ways; j++)
        { // go through each possible winnable position on the current row
            count = 0;
            for (int k = 0; k < wincond; k++)
            { // check for x in a diagonal with same disc
                if (scores[(i - k) * col + (col - j - k)] == disc)
                {
                    count++;
                }
            }
            if (count == wincond)
            {
                free(scores);
                return 1;
            }
        }
    }
    return 0;
}
