class HumanPlayer
    def initialize(mark)
        @mark = mark
    end

    attr_reader :mark

    def get_position
        puts "Player #{@mark}, enter two numbers representing your move.
              Use 'row col' format. EX. 1 1"
        move = gets.chomp.split(" ").map! { |n| n.to_i}
        if move.length != 2
            raise "INVALID: Did not input two numbers"
        end
        move
    end
end