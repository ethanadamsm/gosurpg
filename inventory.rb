require "gosu"
require_relative "z_order"
require_relative "constants"

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
		@border.draw(20, Constants::WHEIGHT - 30 - 20, ZOrder::INVENTORY)
	end

end