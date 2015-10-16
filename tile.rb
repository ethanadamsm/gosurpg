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

end