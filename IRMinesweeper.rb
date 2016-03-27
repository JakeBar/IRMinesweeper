# IR Minesweeper Program 
# Author - Jake Barber 
# email - s3380519@student.rmit.edu.au

dummyArray = [1,2,3,4,5,66,6]

print "Please enter lines and columns "

input = gets.chomp
dimensions = input.split(" ")

rows = dimensions[0].to_i
columns = dimensions[1].to_i

puts "Input received. #{rows} row(s), #{columns} column(s)"

i = 0

field = Hash.new

while i < rows do
	puts i
	i += 1



	print "Input row number #{i} "
	input = gets.chomp
	temp_row = input.split(" ")
	
	j = 1

	while j <= columns
		puts j

		j += 1
	end

end