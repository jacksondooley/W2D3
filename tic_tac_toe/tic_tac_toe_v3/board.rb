class Board
    def initialize(n)
        @grid = Array.new(n) { Array.new(n, '_')}
    end

    attr_reader :grid

    def valid?(row, col)
        indices = []
        @grid.each_index { |i| indices << i}
        indices.include?(row) && indices.include?(col) ? true : false
    end

    def empty?(row, col)
        @grid[row][col] == '_' ? true : false
    end

    def place_mark(pos, mark)
        row, col = pos
        raise "Not Valid Position" if !(valid?(row, col))
        raise "Not Empty Position" if !(empty?(row, col))
        @grid[row][col] = mark
    end

    def print
        @grid.each do |row| 
            puts row.join(" ")
        end
    end

    def win_row?(mark)
        @grid.each do |row|
            return true if row.all? { |el| el == mark}
        end
        false
    end

    def win_col?(mark)
        @grid.transpose.each do |row|
            return true if row.all? { |el| el == mark}
        end
        false
    end

    def win_diagnol?(mark)
        i2 = @grid.length - 1
        @grid.each_index do |i|
            return false if @grid[i][i] != mark && @grid[i2][i] != mark
            i2 -= 1
        end
        return true
    end

    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagnol?(mark) ? true :false
    end

    def empty_positions?
        @grid.flatten.any? { |el| el == '_'}
    end

    def legal_positions
        legal = []
        @grid.each.with_index do |row, x|
            row.each.with_index do |el, y|
                if valid?(x, y) && empty?(x, y)
                    legal << [x, y]
                end
            end
        end
        legal
    end


end