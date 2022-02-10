require_relative "board"
require_relative "player"

class Battleship
    def initialize(n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = @board.size * 0.5
    end

    attr_reader :board, :player

    def start_game
        @board.place_random_ships
        puts "Number of Ships: #{@board.num_ships}"
        @board.print
    end

    def lose?
        if @remaining_misses <= 0 
            puts 'you lose'
            return true
        else
            return false
        end
    end

    def win?
        if @board.num_ships == 0
            puts 'you win'
            return true
        else
            return false
        end
    end

    def game_over?
        win? || lose? ? true : false
    end

    def turn
        move = @player.get_move
        @remaining_misses -= 1 if !(@board.attack(move))
        @board.print
        puts "Remaining misses: #{@remaining_misses}"
    end
end
