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
		item = @items.select { |item| item.get_name == name }.first
		if item != nil
			@items[@items.index(item)].add_number(quantity)
		else
			@items.push(Item.new(name, quantity, animation))
		end
		if @items.length == 0
			@items.push(Item.new(name, quantity, animation))
		end
	end

	def draw
		@border.draw(20, Constants::WHEIGHT - 50, ZOrder::INVENTORY)
		x = 25
		text_x = 30
		font = Gosu::Font.new(12)
		@items.each do |element|
			element.get_animation.draw(x, Constants::WHEIGHT - 45, ZOrder::INVENTORY, 5/3, 5/3)
			font.draw("#{element.get_number}", text_x, Constants::WHEIGHT - 60, ZOrder::TEXT, 1, 1, 0xff_ffff00)
			x += 25
			text_x += 25
		end
	end

end