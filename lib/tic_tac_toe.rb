class TicTacToe

  def initialize(board = Array.new(9," "))
    @board = board
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@oard[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  
  def move(input, player = "X")
    index = input.to_i - 1
    @board[index] = player
  end

  def position_taken?(index)
    board[index] != " " && board[location] != ""
  end





def input_to_index(user_input)
  user_input.to_i - 1
end






def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  #get the user input
  user_input = gets.strip
  #input to index
  index = input_to_index(user_input)
  token = current_player(board)
  
  #check for validation
  if valid_move?(board,index)
    puts 'valid move'
    move(board, index, token)
    display_board(board)
   else
    puts 'try again'
    turn(board)
  end
  display_board(board)
end




# Define your play method below



def turn_count(board)
  counter = 0 
  board.each do |slot| 
    if slot != " "
    counter += 1 
    end
  end
  return counter
end
  
def current_player(board)
  counter = turn_count(board)
  if counter.even?  
    return "X"
  else
    return "O"
  end 
end


WIN_COMBINATIONS = [ 
  [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]
  
def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
  
  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]
  
  position_1 = board[win_index_1]
  position_2 = board[win_index_2]
  position_3 = board[win_index_3]
  
  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return win_combination 
  elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
    return win_combination   
  else
    false 
  end
end
end

def full?(board)
  if board.detect{|i| i == " " || i == nil}
    return false 
  else
    return true  
  end 
end
  
def draw?(board)
  if won?(board)
    return false
  elsif full?(board)
    return true
  else 
    return false
  end
end

def over?(board)
  if won?(board) || draw?(board)
    return true
  else
    return false 
  end
end

def winner(board)
  if win_combination = won?(board)
    board[win_combination.first]
  end
end


def play(board)
  while !(over?(board))
    display_board(board)
    turn(board)
  end
    if won?(board)
      puts "Congratulations #{winner(board)}!"
    elsif draw?(board)
      puts "Cat's Game!"
    end
end

end