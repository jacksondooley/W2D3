class Player
    def get_move
        puts "enter a position with cordinates seperated with a space like '4 7'"
        str = gets.chomp
        return str.split(" ").map! { |n| n.to_i}
    end
end
