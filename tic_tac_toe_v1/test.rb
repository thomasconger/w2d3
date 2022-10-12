require_relative "board"
require_relative "game"
require_relative "human_player"

# tictac = Board.new

# tictac.grid[0][0] = :X
# tictac.grid[0][1] = :X
# tictac.grid[0][2] = :X

# tictac.grid[1][0] = :X
# tictac.grid[1][2] = :X

# tictac.grid[2][0] = :X
# tictac.grid[2][1] = :X
# tictac.grid[2][2] = :X



# puts
# puts

# tictac.print


# pos1 = [0,0]
# pos2 = [4,4]
# pos3 = [1,1]

# # ----- TESTING self.valid?(pos)
# # puts tictac.valid?(pos1)
# # puts tictac.valid?(pos2)

# # ----- TESTING self.empty?(pos)
# # puts tictac.empty?(pos3)
# # puts tictac.empty?(pos1)

# # ----- TESTING self.placemark(pos, symbol)
# # puts tictac.place_mark(pos1, :X)


# puts
# puts "-----------------"
# puts tictac.empty_positions?()
# puts "-----------------"
# puts

# tictac.print

t = Game.new(:X, :O)

puts t

t.play
