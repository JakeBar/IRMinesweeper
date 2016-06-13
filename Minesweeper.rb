# Ruby Minesweeper Program 
# Author - Jake Barber 
# email - s3380519@student.rmit.edu.au

class Board
	attr_accessor :row_count, :column_count, :mines

	def initialize (row_count, column_count, mines)
		@width = column_count
		@height = row_count
		@mines = mines
		@squares = []

		randomise_minefield
		display_minefield
	end

	#generate a random minefield
	def randomise_minefield
		(0...@width).each do |x|
			(0...@height).each do |y|
				@squares[x] = [] unless @squares[x]
				@squares[x][y] = Square.new(x,y)
			end
		end

		(0...@mines).each do |count|
			x = rand(@width)
			y = rand(@height)
			square = @squares[x][y]
			if square.mine == false
				square.mine = true
			end
		end
	end

	# check if there are any mines ajacent to the target square
	def is_adjacent(target, potential_mine)
		x = (target.x - potential_mine.x).abs
		y = (target.y - potential_mine.y).abs

		if x < 2 && y < 2 && potential_mine.mine == true
			return true
		else
			return false
		end
	end

	# count the adjacent mines
	def get_adjacent_mines(target)
		count = 0

		(0...@width).each do |x|
			(0...@height).each do |y|
				potential_mine = @squares[x][y]
				if (is_adjacent(target, potential_mine))
					count += 1
				end
			end
		end

		return count
	end

	# display the minefield
	def display_minefield
		puts "\nPrinting minefield\n"
		(0...@width).each do |x|
			(0...@height).each do |y|
				square = @squares[x][y]
				adjacent_mines = get_adjacent_mines(square)
				if (square.mine == true)
					print "* "
				else
					print "#{adjacent_mines} "
				end
			end
			print("\n")
		end
	end
end

class Square
	attr_accessor :x, :y, :mine, :adjacent_mines

	def initialize (x, y)
		@x = x
		@y = y
		@mine = false
		@adjacent_mines = 0
	end
end

puts "Please enter lines, columns and number of mines: "

input = gets.chomp
dimensions = input.split(" ")

row_count = dimensions[0].to_i
column_count = dimensions[1].to_i
mine_count = dimensions[2].to_i

puts "Input received. #{row_count} row(s), #{column_count} column(s), #{mine_count} mine(s)"

minesweeper = Board.new(row_count, column_count, mine_count)

