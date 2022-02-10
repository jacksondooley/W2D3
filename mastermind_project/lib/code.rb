class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(chars)
    chars.all? { |char| POSSIBLE_PEGS.has_key?(char.upcase) }
  end

  def initialize(chars)
    if Code.valid_pegs?(chars)
      @pegs = chars.map! { |char| char.upcase}
    else
      raise "Array doesn't contain valid pegs"
    end
  end

  attr_reader :pegs

  def self.random(length)
    pogs = []
    POSSIBLE_PEGS.each_key { |k| pogs << k }
    arr = Array.new(length, "")
    arr.map! { |el| pogs.sample}
    Code.new(arr)
  end

  def self.from_string(str)
    chars = str.chars
    Code.new(chars)
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    count = 0
    guess.pegs.each.with_index do |el, i|
      count += 1 if @pegs[i] == el
    end
    count
  end

  def num_near_matches(guess)
    code_dup = @pegs.dup
    guess_dup = guess.pegs.dup

    guess_dup.each_with_index do |peg, i|
      if peg == code_dup[i]
        guess_dup[i] = nil
        code_dup[i] = nil
      end
    end
    guess_dup.delete(nil)
    code_dup.delete(nil)

    count = 0
    guess_dup.each_with_index do |peg, i|
      if code_dup.include?(peg)
        count += 1
        code_dup.delete_at(code_dup.index(peg))
      end
    end
    count
  end

  def ==(guess)
    guess.pegs == @pegs
  end

end
