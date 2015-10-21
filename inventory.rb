require "gosu"
require_relative "z_order"
require_relative "constants"
require_relative "item"

class Inventory

	def initialize 
		@items = []
		@border = Gosu::Image.new("media/border.png")
	end	

	def add_item(name, quantity, animation) 
		@items.push(Item.new(name, quantity, animation))
	end

	def draw
		@border.draw(20, Constants::WHEIGHT - 50, ZOrder::INVENTORY)
		x = 25
		text_x = 30
		font = Gosu::Font.new(6)
		@items.each do |element|
			element.get_animation.draw(x, Constants::WHEIGHT - 45, ZOrder::INVENTORY, 5/3, 5/3)
			font.draw("#{element.get_number}", text_x, Constants::WHEIGHT - 60, 1, 1, 0xff_ffff00)
			x += 25
			text_x += 25
		end
	end

end