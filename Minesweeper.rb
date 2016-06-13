# IR Minesweeper Program 
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

	def randomise_minefield
		(0...@width).each do |x|
			(0...@height).each do |y|
				@squares[x] = [] unless @squares[x]
				@squares[x][y] = Square.new(x,y)
			end
		end

		mine_count = 0

		(0...@mines).each do |count|
			x = rand(@width)
			y = rand(@height)
			puts "#{}"
			square = @squares[x][y]
			if square.mine == false
				square.mine = true
				mine_count += 1
			end
		end
	end

	def display_minefield
		puts "\nPrinting minefield\n"
		(0...@width).each do |x|
			(0...@height).each do |y|
				square = @squares[x][y]
				if (square.mine == true)
					print "* "
				else
					print "0 "
				end
			end
			print("\n")
		end
	end
end

class Square
	attr_accessor :x, :y, :mine

	def initialize (x, y)
		@x = x
		@y = y
		@mine = false
	end
end

class Mine
end

def prompt_user

	# user input
	print "Please enter lines, columns and number of mines: "

	input = gets.chomp
	dimensions = input.split(" ")

	row_count = dimensions[0].to_i
	column_count = dimensions[1].to_i
	mine_count = dimensions[2].to_i

	puts "Input received. #{row_count} row(s), #{column_count} column(s), #{mine_count} mine(s)"

	minesweeper = Board.new(row_count, column_count, mine_count)
end

prompt_user


