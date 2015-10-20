require "gosu"
require_relative "z_order"
require_relative "constants"
require_relative "map"
require_relative "inventory"
require_relative "hitbox"

class Player

	def initialize(x, y) 
		@animation = Gosu::Image.new("media/player.png")
		@x = x
		@y = y
		@inv = Inventory.new
		@hitbox = Hitbox.new(@x, @y, Constants::PWIDTH, Constants::PHEIGHT)
	end

	def update
		if @y < 1 
			teleport(@x, 1)
		elsif @y + Constants::PHEIGHT > Constants::WHEIGHT - 1
			teleport(@x, Constants::WHEIGHT - Constants::PHEIGHT - 1)
		end
		@hitbox.update_c(@x, @y)
	end

	def check_spot?
		if @x + Constants::PWIDTH > Constants::WWIDTH - Constants::TWIDTH * 4
			return 1
		elsif @x < Constants::TWIDTH * 4
			return 2
		end		
	end

	def add_item(name, quantity)
		@inv.add_item(name, quantity)
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

	def hitbox
		@hitbox.hitbox
	end

	def draw
		@animation.draw(@x, @y, ZOrder::PLAYER)
	end

end