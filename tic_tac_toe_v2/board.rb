class Board
    attr_accessor :grid

    def initialize(n=3)
        @size = n
        @grid = Array.new(n) {Array.new(n){"_"}}
    end

    def valid?(pos)
        row, col = pos
        size = @size

        if row < 0 || col < 0
            return false
        end

        if row >= size || col >= size
            return false
        end

        true
    end

    def empty?(pos)
        row, col = pos
        if self.valid?(pos)
            if @grid[row][col] == "_"
                return true
            else
                return false
            end
        else
            raise "invalid position"
            return false
        end
    end

    def place_mark(pos, mark)
        raise "That spot wasn't empty" if !self.empty?(pos)
        raise "That spot doesn't exist" if !self.valid?(pos)

        row, col = pos
        @grid[row][col] = mark

        return true
    end

    def print
        @grid.each { |ele| p ele.join(" ")}
    end

    def win_row?(mark)
        @grid.any?{ |row| row.all?{ |ele| ele == mark }}
    end

    def win_col?(mark)
        cols_as_rows = @grid.transpose.any?{ |col| col.all?{ |ele| ele == mark }}
    end

    def win_diagonal?(mark)
        diag_1 = []
        diag_2 = []

        n = 0
        while n < @size
            other = @size - 1 - n
            diag_1 << @grid[n][n]
            diag_2 << @grid[n][other]
            n += 1
        end

        if diag_1.all? { |ele| ele == mark} || diag_2.all? { |ele| ele == mark}
            return true
        else
            return false
        end

    end

    def win?(mark)
        if win_diagonal?(mark) == true || win_row?(mark) == true || win_col?(mark) == true
            return true
        else
            return false
        end
    end

    def empty_positions?
        @grid.flatten.any?{ |ele| ele == "_"}
    end

end
