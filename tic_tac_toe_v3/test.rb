require_relative "board"
require_relative "game"
require_relative "human_player"

small = Board.new(2)
medium = Board.new(4)
large = Board.new(10)

#----------------------------- Testing Validity


# small.print
# medium.print
# large.print

# pos1 = [0,0]
# pos2 = [3,3]
# pos3 = [10,9]

# puts small.valid?(pos1)
# puts small.valid?(pos2)
# puts small.valid?(pos3)

# puts large.valid?(pos1)
# puts large.valid?(pos2)
# puts large.valid?(pos3)

#------------------------------- Testing win conditions

pos4 = [3,0]
pos1 = [2,1]
pos2 = [1,2]
pos3 = [0,3]



medium.place_mark(pos1,:X)
medium.place_mark(pos2,:X)
medium.place_mark(pos3,:X)
medium.place_mark(pos4,:X)

puts medium.win?(:X)
