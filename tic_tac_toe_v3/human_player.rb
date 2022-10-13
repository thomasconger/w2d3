class HumanPlayer

    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position
        puts "Enter two numbers with a space between them."
        input = gets.chomp.split(" ").map(&:to_i)
    end
end
