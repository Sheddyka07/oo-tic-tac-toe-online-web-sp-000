class TicTacToe

  def initialize(board = Array.new(9," "))
    @board = board
  end
  
  WIN_COMBINATIONS = [ 
    [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

def input_to_index(input)
  input.to_i - 1
end
  
  
  def move(input_to_index, player = "X")
    @board[input_to_index] = player
  end

  def position_taken?(index)
    @board[index] != " " && @board[index] != ""
  end

  def valid_move?(input)
    index = input_to_index(input)
    index.between?(0,8) && !position_taken?(index)
  end

 def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(input)
      player = current_player
      move(input, player)
      display_board
    else
      turn
    end
  end

def turn_count
  counter = 0 
  @board.each do |slot| 
    if slot != " "
    counter += 1 
    end
  end
  counter
end
    
def current_player
  if turn_count.even?  
    return "X"
  else
    return "O"
  end 
end
  
def won?
  WIN_COMBINATIONS.detect do |win_combination|
  
  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]
  
  position_1 = @board[win_index_1]
  position_2 = @board[win_index_2]
  position_3 = @board[win_index_3]
  
  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return win_combination 
  elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
    return win_combination   
  else
    false 
  end
end

def full?
    @board.all? do |slot|
      slot == "X" || slot == "O"
    end
  end
  def draw?
    draw = false
    full = full?
    won = won?
    if full == true && won == false
      draw = true
    end
  end
  def over?
    over = false
    if won? != false || draw? == true
      over = true
    end
  end
  def winner
    if won? == false
      nil
    elsif @board[won?[0]] == "X"
      puts "X"
    elsif @board[won?[1]] == "O"
      puts "O"
    end
  end
  def play
    until over? == true
      turn
    end
    if won? != false
      puts "Congratulations #{winner}!"
    elsif draw? == true
      puts "Cat's Game!"
    end
  end
end
end