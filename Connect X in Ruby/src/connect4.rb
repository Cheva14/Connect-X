#######################################################
#
# Name Sebastian Torrejon Alonzo
#
#######################################################
class Connect4
  
  def initialize(num_rows, num_columns, win_length) 
    @num_rows = num_rows
    @num_columns = num_columns
    @win_length = win_length
    @board
    @player = "1"
    @bin = 0
  end

  def header
    "A B C D E F G H I J K L M N O P R S T U "[0, @num_columns*2]
  end

  def makeBoard
    @board = []
    size = @num_columns * @num_rows
    for i in 0..size-1
      @board[i] = "."
    end
  end
  
  def printBoard
    puts header
    for i in 0..@num_rows-1
      for j in 0..@num_columns-1
        print "#{@board[i * @num_columns + j]} "
      end
      puts ""
    end
  end

  def choose
    while true
      print "Player #{@player}, please enter a column: "
      c = $stdin.gets.chomp
      case c
      when "A"
      when "a"
        @bin = 0
      when "B"
      when "b"
        @bin = 1
      when "C"
      when "c"
        @bin = 2
      when "D"
      when "d"
        @bin = 3
      when "E"
      when "e"
        @bin = 4
      when "F"
      when "f"
        @bin = 5
      when "G"
      when "g"
        @bin = 6
      when "H"
      when "h"
        @bin = 7
      when "I"
      when "i"
        @bin = 8
      when "J"
      when "j"
        @bin = 9
      when "K"
      when "k"
        @bin = 10
      when "L"
      when "l"
        @bin = 11
      when "M"
      when "m"
        @bin = 12
      when "N"
      when "n"
        @bin = 13
      when "O"
      when "o"
        @bin = 14
      when "P"
      when "p"
        @bin = 15
      when "R"
      when "r"
        @bin = 16
      when "S"
      when "s"
        @bin = 17
      when "T"
      when "t"
        @bin = 18
      when "U"
      when "u"
        @bin = 19
      when "Q"
      when "q"
        puts "Goodbye."
        exit
      else
        @bin = 666
      end
      if @bin >= 0 && @bin < @num_columns && @board[@bin] == "."
        fillBin
        if @player == "1"
          @player = "2"
        else
          @player = "1"
        end
        break
      else
        puts "Invalid input, please try again."
        printBoard
      end
    end
  end
  
  def fillBin
    for level in (@num_rows-1).downto(0)
      if @board[level * @num_columns + @bin] == "."
        @board[level * @num_columns + @bin] = @player
        break
      end
    end
  end

  def check(player)

    ways = @num_columns - @win_length + 1

    for i in 0..@num_rows-1
      for j in 0..ways-1
        count = 0
        for k in 0..@win_length-1
          if @board[i * @num_columns + (j + k)] == player
            count += 1
          end
        end
        if count == @win_length
          puts "Congratulations, Player #{player}. You win."
          exit
        end
      end
    end

    ways = @num_rows - @win_length + 1
    for i in 0..@num_columns-1
      count = 0
      for j in 0..ways-1
        count = 0;
        for k in 0..@win_length-1
          if @board[(j + k) * @num_columns + i] == player
            count += 1
          end
        end
        if count == @win_length
          puts "Congratulations, Player #{player}. You win."
          exit
        end
      end
    end

    ways = @num_columns - @win_length + 1
    temp = @win_length-1
    for i in temp..@num_rows-1
      for j in 0..ways-1
        count = 0;
        for k in 0..@win_length-1
          if @board[(i - k) * @num_columns + (j + k)] == player
            count += 1
          end
        end
        if count == @win_length
          puts "Congratulations, Player #{player}. You win."
          exit
        end
      end
    end

    ways = @num_columns - @win_length + 1
    temp = @win_length-1
    for i in temp..@num_rows-1
      for j in 1..ways
        count = 0
        for k in 0..@win_length-1
          if @board[(i - k) * @num_columns + (@num_columns - j - k)] == player
            count += 1
          end
        end
        if count == @win_length
          puts "Congratulations, Player #{player}. You win."
          exit
        end
      end
    end
  end

  def play_game
   puts "Connect 4 with #{@num_rows} #{@num_columns} and #{@win_length}"

   makeBoard
   printBoard
   while true
    choose
    printBoard
    check("1")
    check("2")
   end
  end
end
