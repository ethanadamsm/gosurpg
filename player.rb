require "gosu"
require_relative "z_order"
require_relative "constants"
require_relative "map"

class Player

	def initialize(x, y) 
		@animation = Gosu::Image.new("media/player.png")
		@x = x
		@y = y
	end

	def check_spot?
		if @x + Constants::PWIDTH > Constants::WWIDTH - Constants::TWIDTH * 4
			return 1
		elsif @x < Constants::TWIDTH * 4
			return 2
		elsif @y + Constants::PHEIGHT > Constants::WHEIGHT - Constants::THEIGHT * 4 
			return 3
		elsif @y < Constants::THEIGHT * 4
			return 4
		end		
	end

	def teleport(x, y) 
		@x = x
		@y = y
	end

	def teleport_right
		teleport((Constants::WWIDTH - Constants::TWIDTH * 4) - (Constants::PWIDTH + Constants::TWIDTH), @y)
	end

	def teleport_left
		teleport((Constants::TWIDTH * 4) + Constants::TWIDTH, @y)
	end

	def teleport_up
		teleport(@x, (Constants::THEIGHT * 4) + Constants::THEIGHT)
	end

	def teleport_down
		teleport(@x, (Constants::WHEIGHT - (Constants::THEIGHT * 4)) - Constants::PHEIGHT - Constants::THEIGHT)
	end

	def move_left
		@x -= Constants::MOVEMENT
	end

	def move_right
		@x += Constants::MOVEMENT
	end

	def move_up
		@y -= Constants::MOVEMENT
	end

	def move_down
		@y += Constants::MOVEMENT
	end

	def draw
		@animation.draw(@x, @y, ZOrder::PLAYER)
	end

end