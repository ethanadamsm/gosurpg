require "gosu"
require_relative "map"
require_relative "constants"
require_relative "player"

class GameWindow < Gosu::Window

	def initialize
		super Constants::WWIDTH, Constants::WHEIGHT
		@map = Map.new
		@player = Player.new(Constants::WWIDTH / 2, Constants::WHEIGHT / 2)
	end

	def update
		if button_down?(Gosu::KbUp)
			@player.move_up
		elsif button_down?(Gosu::KbDown)
			@player.move_down
		elsif button_down?(Gosu::KbLeft)
			@player.move_left
		elsif button_down?(Gosu::KbRight)
			@player.move_right
		end
		
		case @player.check_spot?
			when 1  
				@player.teleport_right
			when 2
				@player.teleport_left
			when 3
				@player.teleport_down
			when 4
				@player.teleport_up
		end
	end

	def draw
		@map.draw
		@player.draw
	end

	def button_down(id)
		close if id == Gosu::KbEscape
	end

end

window = GameWindow.new
window.show