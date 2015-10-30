require_relative "player"
require "gosu"

class Enemy < Player

	def initialize(x, y, w, h)
		super(x, y, w, h)
		@enemy = Gosu::Image.new("media/enemy.png")
	end

	def move_to_player(x, y, w, h)
		if get_x > x + w
			teleport(get_x - 1, get_y)
		elsif get_x + get_width < x 
			teleport(get_x + 1, get_y)
		end
		if get_y > y + h
			teleport(get_x, get_y - 1)
		elsif get_y + get_height < y
			teleport(get_x, get_y + 1)
		end
	end

	def draw
		@enemy.draw(@x, @y, 6)
	end

end