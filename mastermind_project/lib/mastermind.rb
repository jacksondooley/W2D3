require_relative "code"

class Mastermind
    def initialize(length)
        @secret_code = Code.random(length)
    end

    attr_reader :secret_code

    def print_matches(guess)
        puts "Exact matches: #{@secret_code.num_exact_matches(guess)}"
        puts "Near matches: #{@secret_code.num_near_matches(guess)}"
    end

    def ask_user_for_guess
        puts "Enter a code"
        input = gets.chomp
        guess = Code.from_string(input)
        print_matches(guess)
        @secret_code==(guess)
    end
end
