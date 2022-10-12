require_relative "board"
require_relative "human_player"

class Game

    def initialize(player_1_mark, player_2_mark)
        @player_1 = HumanPlayer.new(player_1_mark)
        @player_2 = HumanPlayer.new(player_2_mark)
        @current_player = @player_1
        @board = Board.new()
    end

    def switch_turn
        if @current_player == @player_1
            @current_player = @player_2
        else
            @current_player = @player_1
        end
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
