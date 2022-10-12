require "byebug"
class Board

    attr_reader :size
    attr_accessor :grid

    def initialize(n)
        @grid = Array.new(n) {Array.new(n) {:N}}
        @size = n ** 2
    end

    def [](pos)
        @grid[pos[0]][pos[1]]
    end

    def []=(pos, symbol)
        row = pos[0]
        col = pos[1]
        self.grid[row][col] = symbol
    end

    def num_ships
        @grid.inject(0){|acc, ele|acc + ele.count(:S)}
    end

    def attack(pos)
        if self[pos] == :S
            self[pos] = :H
            puts "you sunk my battleship"
            return true
        else
            self[pos] = :X
            return false
        end
    end

    def place_random_ships
        ship_count = @size / 4
        random_samples = (0...@size).to_a.sample(ship_count)
        random_samples.each do |ele|
            row = ele / Integer.sqrt(size)
            col = ele % Integer.sqrt(size)
            pos = [row, col]
            self[pos] = :S
        end
    end

    def hidden_ships_grid
        hidden_grid = Array.new(@grid.length) {Array.new(@grid.length)}

        hidden_grid.each_with_index do |subarr, row|
            subarr.each_with_index do |ele, col|
                if @grid[row][col] == :S
                    hidden_grid[row][col] = :N
                else
                    hidden_grid[row][col] = @grid[row][col]
                end
            end
        end
        hidden_grid
    end

    def self.print_grid(grid)
        grid.each do |subarr|
            puts subarr.join(" ")
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        hidden = self.hidden_ships_grid
        Board.print_grid(hidden)
    end


end
