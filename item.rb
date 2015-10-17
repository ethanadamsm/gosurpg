class Item

	def initialize(name, number)
		@name = name
		@number = number 
		@x = nil
		@y = nil
		@ground = false
	end

	def add_number(num)
		@number += num
	end

end