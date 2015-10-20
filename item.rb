require "gosu"
require_relative "z_order"
require_relative "constants"
require_relative "hitbox"

class Item

	def initialize(name, number, x, y, w, h, ground, animation)
		@name = name
		@number = number 
		@x = x
		@y = y
		@ground = ground
		@animation = animation
		@hitbox = Hitbox.new(@x, @y, Constants::IWIDTH, Constants::IHEIGHT)
	end

	def add_number(num)
		@number += num
	end

	def move_left
		@x += Constants::TWIDTH
	end

	def move_right 
		@x -= Constants::TWIDTH
	end

	def get_x
		@x
	end

	def get_y
		@y
	end

	def get_name 
		@name
	end

	def get_number
		@number
	end

	def set_ground(ground)
		@ground = ground
	end

	def hitbox
		@hitbox.hitbox
	end

	def draw
		if @ground
			@animation.draw(@x, @y, ZOrder::ITEMS)
		end 
	end

end