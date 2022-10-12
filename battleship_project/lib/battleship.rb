require_relative "board"
require_relative "player"

class Battleship

    attr_reader :board, :player, :remaining_misses
    attr_writer :remaining_misses

    def initialize(n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = @board.size / 2
    end

    def start_game
        @board.place_random_ships
        puts @board.size / 4
        @board.print
    end

    def lose?
        if @remaining_misses <= 0
            puts 'you lose'
            return true
        else
            return false
        end
    end

    def win?
        if self.board.num_ships <= 0
            puts "you win"
            return true
        else
            return false
        end
    end

    def game_over?
        if self.win? || self.lose?
            true
        else
            false
        end
    end

    def turn
        pos = player.get_move
        self.board.print
        if self.board.attack(pos)
            # successful
        else
            self.remaining_misses = self.remaining_misses - 1

        end
        puts @remaining_misses
    end



end
