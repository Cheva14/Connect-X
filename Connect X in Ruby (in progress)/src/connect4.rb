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
  end

  def header
    "A B C D E F G H I J K L M N O P"[0, @num_columns*2]
  end

  def play_game
   puts "Connect 4 with #{@num_rows} #{@num_columns} and #{@win_length}"
   puts "Hello"
  end
end
