require "gosu"
require_relative "z_order"

class Tile

	def initialize(width, height, x, y, animation)
		@width = width
		@height = height
		@x = x
		@y = y
		@animation = animation
	end

	def draw
		@animation.draw(@x, @y, ZOrder::TILES)
	end

	def get_x
		@x
	end

	def get_y
		@y
	end

	def set_x(x)
		@x = x
	end

	def set_y(y)
		@y = y
	end

end