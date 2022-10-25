#ifndef CONNECT4_H
#define CONNECT4_H

// Declare your helper functions here.

void set_cond(char *board_size, int winC);
void create_scores();
void board();
void choose();
void fill_bin();
int check(char disc);

#endif