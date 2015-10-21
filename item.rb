require_relative "constants"

class Item

	def initialize(name, number, animation)
		@name = name
		@number = number 
		@animation = animation
	end

	def add_number(num)
		@number += num
	end

	def get_name 
		@name
	end

	def get_number
		@number
	end

	def get_animation
		@animation
	end

end