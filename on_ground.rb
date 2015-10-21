require "gosu"
require_relative "z_order"
require_relative "item"
require_relative "constants"

class OnGround < Item

	def initialize(name, number, x, y, animation)
		super(name, number, animation)
		@x = x
		@y = y
		@hitbox = Hitbox.new(@x, @y, Constants::IWIDTH, Constants::IHEIGHT)
	end

	def draw
		get_animation.draw(@x, @y, ZOrder::ITEMS)
	end

	def move_left
		@x += Constants::TWIDTH
		@hitbox.update_hitbox(@x, @y)
	end

	def move_right 
		@x -= Constants::TWIDTH
		@hitbox.update_hitbox(@x, @y)
	end

	def get_x
		@x
	end

	def get_y
		@y
	end

	def hitbox
		@hitbox.hitbox
	end

end