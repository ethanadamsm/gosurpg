require "gosu"
require_relative "map"
require_relative "constants"
require_relative "player"
require_relative "item"
require_relative "collision"
require_relative "gui"
require_relative "z_order"
require_relative "enemy"

class GameWindow < Gosu::Window

	def initialize
		super Constants::WWIDTH, Constants::WHEIGHT
		@map = Map.new
		@player = Player.new(Constants::WWIDTH / 2, Constants::WHEIGHT / 2, Constants::PWIDTH, Constants::PHEIGHT)
		@mouse = Gosu::Image.new("media/mouse.png")
		@enemy = Enemy.new(0, 0, Constants::PWIDTH, Constants::PHEIGHT)

		@guistart = Gui.new(500, 400, 70, 40, "Welcome to RPG!", true, true)
		@guistart.add_button(180, 80, 280, 40, "Rogue")
		@guistart.add_button(180, 140, 280, 40, "Fighter")
		@guistart.add_button(180, 200, 280, 40, "Mage")
	end

	def update
		if button_down?(Gosu::KbW)
			@player.move_up
		elsif button_down?(Gosu::KbS)
			@player.move_down
		elsif button_down?(Gosu::KbA)
			@player.move_left
		elsif button_down?(Gosu::KbD)
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
		@enemy.move_to_player(@player.get_x, @player.get_y, @player.get_width, @player.get_height)

	end

	def draw
		@map.draw
		@player.draw
		@enemy.draw
		@guistart.draw
		@mouse.draw(self.mouse_x, self.mouse_y, ZOrder::MOUSE)
	end

	def button_down(id)
		close if id == Gosu::KbEscape
		if id == Gosu::MsLeft
			if @guistart.update(self.mouse_x, self.mouse_y)
				@guistart.set_visibility(false)
			end	
		end
	end

end

window = GameWindow.new
window.show