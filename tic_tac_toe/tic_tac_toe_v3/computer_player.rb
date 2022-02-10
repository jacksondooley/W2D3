class ComputerPlayer
    def initialize(mark)
        @mark = mark
    end

    attr_reader :mark

    def get_position(legal_pos)
        move = legal_pos.sample
    end

end