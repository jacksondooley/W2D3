require './board.rb'
require './human_player.rb'
require './computer_player.rb'

class Game

    def initialize(n, players)
        @players = players.map do |mark, is_comp| 
            is_comp ? ComputerPlayer.new(mark) : HumanPlayer.new(mark)
        end
        @current_player = @players.first
        @board = Board.new(n)
    end

    attr_reader :current_player

    def switch_turn
        @current_player = @players.rotate!.first
    end

    def play
        while @board.empty_positions?
            @board.print
            legal_positions = @board.legal_positions
            move = @current_player.get_position(legal_positions)
            @board.place_mark(move, @current_player.mark)
            puts
            if @board.win?(@current_player.mark)
                return "#{@current_player.mark} Wins!"
            else
                switch_turn
            end
        end
        return "Draw"
    end

end