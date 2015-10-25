require "gosu"
require_relative "map"
require_relative "constants"
require_relative "player"
require_relative "item"
require_relative "collision"

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
		elsif button_down?(Gosu::KbP)
			@map.get_items.each do |element| 
				collision = Collision.new(element, @player)
				if collision.has_collided
					@player.add_item(element.get_name, element.get_number, element.get_animation)
					@map.delete_item(@map.get_items.index(element))
					break
				end
			end	
		end

		case @player.check_spot?
			when 1  
				@player.teleport_right
				if @map.block_correct?("right")
					@map.create_column_right
				end
				@map.move_map_left
			when 2
				@player.teleport_left
				if @map.block_correct?("left")
					@map.create_column_left
				end
				@map.move_map_right
		end

		@player.update
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