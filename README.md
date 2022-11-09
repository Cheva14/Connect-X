# Connect X



## Overview

For this project I implemented the game [Connect 4](https://kevinshannon.dev/connect4) in C, Scheme, Javascript, and Ruby. 

I added two additional features:
1. The size of the board is configurable.
2. The run length needed to win is configurable.


## Objectives

This project has two main objectives
1. Review C, Scheme, Javascript, and Ruby.
2. Serve as a project to which I can compare programming languages


## Interface

When running the game, you have to follow this interface:
1. The command line take two optional parameters:
   1. board size in the form `rowsxcolumns` (e.g., `6x7`)
   2. the number of checkers in a row needed to win (i.e, the _win length_)
   (For example `./c4 9x13 6` will launch a game with 9 rows, 13 columns, and a win length of 6.)
2. If the user doesn't supply one or more optional parameters, the default board size is 6x7 and the default win length is 4.
3. When a player wins, a print message <code>Congratulations, Player <em>x</em>. You win.</code> then exit.
4. The columns are labeled with letters beginning with `A`.  To make a move, each player enters the letter of the desired column and hits enter. The program accepts both upper-case and lower-case entries.
5. Given an invalid input (not a letter, letter too large, column is full, etc.), The game prints a error message and prompt the user again.
6. If the user enters `q`, The game prints `Goodbye.` and terminate the program.
