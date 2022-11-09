# Connect 4 in Ruby

Use this [GitHub Classroom link](https://classroom.github.com/a/A894ZptF) to create a repo for this project.

**!!! Important !!!** This is an _individual_ assignment.  You _may not_ work in teams.

## Overview

For this assignment you will implement the game [Connect 4](https://kevinshannon.dev/connect4) using [Ruby](https://www.ruby-lang.org/en/). 

You will be adding two additional features:
1. The size of the board will be configurable.
2. The run length needed to win will be configurable.  (So, I guess the game is really "Connect X").

I placed a sample solution on EOS at `/home/kurmasz/public/CIS343/c4demo`.  Your board and workflow need not be identical to mine.  However, I will be using automated "system tests", so your input and output needs to formatted carefully.  In addition, your implementation **must** follow a handful of rules, so **_Be sure to read the Details section below_**!

## Objectives 

This assignment has two main objectives
1. Provide experience using a modern language that has many features similar to JavaScript, but a noticeably different syntax.
2. Observe the effects of focusing on writability over readability.

Ruby has a syntax that encourages programmers to chain commands together. This style can allow for very concise code at the expense of readability. As you work on this project, look for opportunities to use this style to write very concise methods. 
Think about which of your techniques you would use again, and which are not sufficiently readable for your liking.

## Details

This project uses the same interface rules as [the C version](https://github.com/kurmasz-assignments/cis343-connect4-c).  Review them if necessary.

### Implementation Requirements

1. Use standard Ruby style.  For example, 
    * Use `snake_case` for variable names.
    * Use `each` and `map` instead of standard C-style `for` loops.
2. Look for opportunities to chain methods together.  For example
    * Make the initial board using one line of code containing two nested calls to `map`.
    * Use the `join` method to print out a row when printing the board.

### Code Quality

Your code must follow standard design principles.  For example, be sure to
   1. Use comments 
   2. Divide your code into appropriately-sized functions and files
   3. Make sure your code is neat, well-organized, and well-organized

## Testing / Test Driven Development

You must use a Test Driven Development (TDD) workflow.  If done well, your system tests from the C version of Connect 4 should also work for this project.

## Submission

When your project is complete (has a complete set of tests, has a working game, passes my automated tests, and is well-formatted and well-documented), 
check in your code with "[Grade Me]" in the commit message.

**Important**: Just because your code passes the GitHub tests, does _not_ mean it meets all the requirements. The GitHub tests do not, for example, check the user interface.  They also don't check the completeness of your unit tests or the quality of your code.

## Academic Honesty

One key purpose of the GitHub classroom setup is to automatically verify that submitted code is bug-free.  Attempting to subvert this system and generate a "false positive" (for example, by modifying files such as the Makefile) is a serious violation of Academic Honesty and could result in a failing grade in the course.

Attempting to reverse engineer the sample solution through de-compiling or other means is a serious violation of Academic Honesty and could result in a failing grade in the course.  Similarly, writing tests is an important part of the software development process. The automated tests are a part of this project's "solution".  Attempting to access the specific test cases through means included, but not limited to, de-compiling and print statements is a serious violation of Academic Honesty and could result in a failing grade in the course.

Hiding and/or obfuscating GitHub activity through means such as rebasing, squashing, or outright deleting test runs is a serious violation of Academic Honesty and could result in a failing grade in the course.

