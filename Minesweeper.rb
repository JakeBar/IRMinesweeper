# IR Minesweeper Program 
# Author - Jake Barber 
# email - s3380519@student.rmit.edu.au

class Board
	attr_accessor :row_count, :column_count
	def initialize (row_count, column_count)
	end

	def add_mines
	end

	def display_minefield
		puts "\nPrinting minefield\n"
		field.each do |row|
			row.each do |column|
				if (column.mine == true)
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

	def initialize (x, y, mine)
		@x = x
		@y = y
		@mine = Mine.new()
	end
end

class Mine
end

def prompt_user

	# user input
	print "Please enter lines and columns: "

	input = gets.chomp
	dimensions = input.split(" ")

	row_count = dimensions[0].to_i
	column_count = dimensions[1].to_i

	puts "Input received. #{row_count} row(s), #{column_count} column(s)"

	i = 0

	# create new board
	minesweeper = Board.new(row_count, column_count)

	# must create an array of objects to hold information
	field = Array.new

	while i < row_count do
		i += 1

		row = []

		print "Input row number #{i} values: "
		input = gets.chomp
		temp_row = input.split(" ")
		mine_state = false
		
		j = 0

		while j < column_count
			if temp_row[j] == "*"
				mine_state = true
			else
				mine_state = false
			end
			row << Square.new(i,j, mine_state)
			j += 1
		end

		field << row

	end	

end

prompt_user

#Board.display_minefield