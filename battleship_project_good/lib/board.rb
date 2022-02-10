class Board

  def initialize(n)
    @grid = Array.new(n) { Array.new(n, :N)}
    @size = n * n
  end

  attr_reader :size

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end

  def num_ships
    @grid.flatten.count { |el| el == :S}
  end

  def attack(pos)
    if self[pos] == :S
        self[pos] = :H
        puts "you sunk my battleship!"
        return true
    else
        self[pos] = :X
        return false
    end
  end

  def place_random_ships
    total_ships = @size * 0.25

    while self.num_ships < total_ships
        rand_row = rand(0...@grid.length)
        rand_col = rand(0...@grid.length)
        pos = [rand_row, rand_col]
        self[pos] = :S
    end
  end

  def hidden_ships_grid
    @grid.map do |subarr|
        subarr.map do |el|
            el == :X ? :X : :N
        end
    end
  end

  def self.print_grid(grid)
    grid.each do |row|
        puts row.join(" ")
    end
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(self.hidden_ships_grid)
  end

end
