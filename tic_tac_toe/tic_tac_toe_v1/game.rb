require './board.rb'
require './human_player.rb'

class Game

    def initialize(mark1, mark2)
        @player_1 = HumanPlayer.new(mark1)
        @player_2 = HumanPlayer.new(mark2)
        @board = Board.new
        @current_player = @player_1
    end

    attr_reader :player_1, :player_2

    def switch_turn
        if @current_player == @player_1
            @current_player = @player_2
        else
            @current_player = @player_1
        end
    end

    def play
        while @board.empty_positions?
            @board.print
            move = @current_player.get_position
            @board.place_mark(move, @current_player.mark)
            if @board.win?(@current_player.mark)
                return "#{@current_player.mark} Wins!"
            else
                switch_turn
            end
        end
        return "Draw"
    end

end