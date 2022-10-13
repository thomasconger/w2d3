require_relative "board"
require_relative "human_player"

class Game

    def initialize(size, *players)
        @players = Array.new(players.length) { |mark| HumanPlayer.new(players[mark])}
        @current_player = @players[0]
        @board = Board.new(size)
    end

    def switch_turn
        @current_player = @players.rotate![0]
    end

    def play
        #while empty exists
            #print board
            #get input
            #place input
            #check for victory
            #switch turn
        while @board.empty_positions?
            @board.print
            new_move = @current_player.get_position
            mark = @current_player.mark
            @board.place_mark(new_move, mark)
            if @board.win?(mark)
                puts
                puts "---------------"
                puts "#{mark} wins!!!"
                puts "---------------"
                puts

                return
            end
            switch_turn
        end
    end
end
