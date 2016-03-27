# IR Minesweeper Program 
# Author - Jake Barber 
# email - s3380519@student.rmit.edu.au

class Square
	attr_accessor :x, :y, :mine

	def initialize (x, y, mine)
		@x = x
		@y = y
		@mine = mine
	end
end

dummyArray = [1,2,3,4,5,66,6]

print "Please enter lines and columns: "

input = gets.chomp
dimensions = input.split(" ")

row_count = dimensions[0].to_i
column_count = dimensions[1].to_i

puts "Input received. #{row_count} row(s), #{column_count} column(s)"

i = 0

# must create an array of objects to hold information
field = Array.new

while i < row_count do
	i += 1

	row = []

	print "Input row number #{i} values: "
	input = gets.chomp
	temp_row = input.split(" ")
	
	j = 0

	while j < column_count
		#puts j
		row << Square.new(i,j, temp_row[j])
		j += 1
	end

	field << row

end

puts "Printing minefield"

field.each do |row_entry|
	row_entry.each do |column_entry|
		print column_entry.mine
		print " "
	end
	print("\n")
end