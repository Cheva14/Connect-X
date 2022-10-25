/******************************************
 *
 * Sebastian Torrejon Alonzo
 *
 *****************************************/

import { exit } from "node:process"; // Provides the exit method
import * as readline from "node:readline";

// The program uses the same io object.
const io = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

// Make the Connect4 class available externally.
export default class Connect4 {
  // Use private instance variables where appropriate
  #numRows;
  #numCols;
  #winLength;
  #board;
  #player;

  constructor(numRows, numCols, winLength) {
    //assign variables to input from user
    this.#numRows = numRows;
    this.#numCols = numCols;
    this.#winLength = winLength;
    this.#player = "1";
  }

  header() {
    //return the name of each column
    return "A B C D E F G H I J K L M O P R S T U ".substring(
      0,
      this.#numCols * 2
    );
  }

  makeBoard() {
    //creates an array with dots of the size of the board.
    this.#board = [];
    let size = this.#numCols * this.#numRows;
    for (let i = 0; i < size; i++) {
      this.#board[i] = ".";
    }
  }

  printBoard() {
    //prints to the terminal the array of dots in its corresponding rows
    console.log(this.header());
    for (let i = 0; i < this.#numRows; i++) {
      for (let j = 0; j < this.#numCols; j++) {
        process.stdout.write(`${this.#board[i * this.#numCols + j]} `);
      }
      console.log("");
    }
  }

  choose() {
    //ask the user for a column and then call loop function
    this.fetchColumn(this.#player, () => {
      this.loop();
    });
  }

  fetchColumn(player, callback) {
    //get input and check if is valid, then input player into the board array
    io.question(`Player ${player}, which Column? `, (line) => {
      let bin = 0;
      switch (line) {
        case "A":
        case "a":
          bin = 0;
          break;
        case "B":
        case "b":
          bin = 1;
          break;
        case "C":
        case "c":
          bin = 2;
          break;
        case "D":
        case "d":
          bin = 3;
          break;
        case "E":
        case "e":
          bin = 4;
          break;
        case "F":
        case "f":
          bin = 5;
          break;
        case "G":
        case "g":
          bin = 6;
          break;
        case "H":
        case "h":
          bin = 7;
          break;
        case "I":
        case "i":
          bin = 8;
          break;
        case "J":
        case "j":
          bin = 9;
          break;
        case "K":
        case "k":
          bin = 10;
          break;
        case "L":
        case "l":
          bin = 11;
          break;
        case "M":
        case "m":
          bin = 12;
          break;
        case "N":
        case "n":
          bin = 13;
          break;
        case "O":
        case "o":
          bin = 14;
          break;
        case "P":
        case "p":
          bin = 15;
          break;
        case "R":
        case "r":
          bin = 16;
          break;
        case "S":
        case "s":
          bin = 17;
          break;
        case "T":
        case "t":
          bin = 18;
          break;
        case "U":
        case "u":
          bin = 19;
          break;
        case "Q":
        case "q":
          this.quit();
        default:
          bin = 666;
          console.log("Invalid input. please try again.");
      }
      if (
        bin >= 0 &&
        bin < this.#numCols &&
        this.#board[0 * this.#numCols + bin] == "."
      ) {
        this.fillBin(bin);
        if (this.#player == "1") {
          this.#player = "2";
        } else {
          this.#player = "1";
        }
      } else {
        console.log("Invalid input, please try again.");
      }
      callback();
    });
  }

  loop(n) {
    //re-print the board with the corresponding values and check if a player has won so far.
    this.printBoard();
    if (this.check("1")) {
      console.log("Congratulations, Player 1. You win.\n");
      this.quitW();
    }
    if (this.check("2")) {
      console.log("Congratulations, Player 2. You win.\n");
      this.quitW();
    }

    this.choose();
  }

  fillBin(bin) {
    //fill the board with the input from the player
    for (let level = this.#numRows - 1; level >= 0; level--) {
      if (this.#board[level * this.#numCols + bin] == ".") {
        this.#board[level * this.#numCols + bin] = this.#player;
        break;
      }
    }
  }

  check(player) {
    //check if there is a row/col/diag that meets the length of the win condition.
    let count, ways;

    // check for x-disc rows
    ways = this.#numCols - this.#winLength + 1;

    for (let i = 0; i < this.#numRows; i++) {
      // go through each row
      for (let j = 0; j < ways; j++) {
        // go through each possible winnable position on the current row
        count = 0;
        for (let k = 0; k < this.#winLength; k++) {
          // check for x in a row with same disc
          if (this.#board[i * this.#numCols + (j + k)] == player) {
            count++;
          }
        }
        if (count == this.#winLength) {
          return true;
        }
      }
    }

    // check for x-disc columns
    ways = this.#numRows - this.#winLength + 1;
    for (let i = 0; i < this.#numCols; i++) {
      // go through each column
      count = 0;
      for (let j = 0; j < ways; j++) {
        // go through each possible winnable position on the current column
        count = 0;
        for (let k = 0; k < this.#winLength; k++) {
          // check for x in a vertical-row with same disc
          if (this.#board[(j + k) * this.#numCols + i] == player) {
            count++;
          }
        }
        if (count == this.#winLength) {
          return true;
        }
      }
    }

    // check upward diagonal
    ways = this.#numCols - this.#winLength + 1;

    for (let i = this.#winLength - 1; i < this.#numRows; i++) {
      // go through each row where a winnable diagonal can be at
      for (let j = 0; j < ways; j++) {
        // go through each possible winnable position on the current row
        count = 0;
        for (let k = 0; k < this.#winLength; k++) {
          // check for x in a diagonal with same disc
          if (this.#board[(i - k) * this.#numCols + (j + k)] == player) {
            count++;
          }
        }
        if (count == this.#winLength) {
          return true;
        }
      }
    }
    // check downward diagonal
    ways = this.#numCols - this.#winLength + 1;

    for (let i = this.#winLength - 1; i < this.#numRows; i++) {
      // go through each row where a winnable diagonal can be at
      for (let j = 1; j <= ways; j++) {
        // go through each possible winnable position on the current row
        count = 0;
        for (let k = 0; k < this.#winLength; k++) {
          // check for x in a diagonal with same disc
          if (
            this.#board[(i - k) * this.#numCols + (this.#numCols - j - k)] ==
            player
          ) {
            count++;
          }
        }
        if (count == this.#winLength) {
          return true;
        }
      }
    }
    return false;
  }

  quit() {
    //quit the game at any point.
    console.log("Goodbye.");
    io.close();
    exit();
  }
  quitW() {
    //quit the game when there is a winner
    io.close();
    exit();
  }

  playGame() {
    //start the game.
    this.makeBoard();
    this.printBoard();
    this.choose();
  }
}
