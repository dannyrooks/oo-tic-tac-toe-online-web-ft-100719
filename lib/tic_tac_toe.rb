class TicTacToe

    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
    ]

    def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(user_input)
        user_input.to_i - 1
    end

    def move(index, token = "X")
        @board[index] = token
    end

    def position_taken?(index)
        @board[index] != " "
    end

    def valid_move?(index)
        index.between?(0, 8) && !position_taken?(index)
    end

    def turn_count
        @board.count{|token| token == "X" || token == "O"}
    end

    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end

    def turn
        puts "Please enter position: "
        user_input = gets.chomp
        index = input_to_index(user_input)
        while(!valid_move?(index)) do
        puts "Please enter position: "
        user_input = gets.chomp
        index = input_to_index(user_input)
        end
    
    move(index, current_player)
    display_board
    end

    def won?
    WIN_COMBINATIONS.find{|combo| (@board[combo[0]] != " ") &&
    (@board[combo[0]] == @board[combo[1]]) &&
    (@board[combo[1]] == @board[combo[2]])  }
    end

    def full?
    turn_count == 9 ? true : false
    end
    
    def draw?
    !won? && full? ? true : false
    end

    def over?
    won? || draw? ? true : false

    end

    def winner
        if won?
        win_array = won?
        @board[win_array[0]]
        end
    end
    
    def play
        until(over?)
        turn
        end
            if won?
        puts "Congratulations #{winner}!"
            else
        puts "Cat's Game!"
            end
        end

    end

