require "gosu"

class Inventory

	def initialize 
		@items = []
		@border = Gosu::Image.new("media/border.png")
	end	

	def add_item(name_, quantity) 
		@items.map{ |n|
			if n.name == name_
				@items.push(name_, quantity)
			else
				n.number += quantity 
			end
		}
	end

	def draw

	end

end