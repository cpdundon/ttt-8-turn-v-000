def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def valid_move?(board, idx)
  if idx < 0 || idx > 8
    return false
  end
  
  !position_taken?(board, idx)
end

def position_taken?(board, idx)
  chr = board[idx]
  if chr == " "
    return false
  end
  true
end

def move(board, idx, token = "X")
  
  if valid_move?(board, idx)
    board[idx] = token
  else 
    return false
  end
  
  display_board(board)
end

def input_to_index(input)
  return (input.to_i - 1)
end

def turn(board)
  
  validMove = false
  tIn = Time.now.to_i
  
  until validMove do 
    puts "Please enter 1-9:"
    rtn = gets
    idx = input_to_index(rtn)
    
    if Time.now.to_i - tIn > 30
      break
    end
    
    validMove = move(board, idx)
  end
end