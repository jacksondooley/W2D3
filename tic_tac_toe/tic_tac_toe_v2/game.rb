require './board.rb'
require './human_player.rb'

class Game

    def initialize(n, *player_marks)
        @players = player_marks.map { |mark| HumanPlayer.new(mark)}
        @board = Board.new(n)
        @current_player = @players.first
    end

    attr_reader :current_player

    def switch_turn
        @current_player = @players.rotate!.first
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