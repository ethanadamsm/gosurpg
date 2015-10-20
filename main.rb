require "gosu"
require_relative "map"
require_relative "constants"
require_relative "player"
require_relative "item"

class GameWindow < Gosu::Window

	def initialize
		super Constants::WWIDTH, Constants::WHEIGHT
		filenames = open("media/names.txt")
		filenames = filenames.read
		@itemnames = filenames.split(",")
		fileani = open("media/ani.txt")
		fileani = fileani.read
		fileani = fileani.split(", ")
		@itemani = []
		fileani.each do |element|
			@itemani.push(Gosu::Image.new("media/" + element))
		end
		@map = Map.new
		@player = Player.new(Constants::WWIDTH / 2, Constants::WHEIGHT / 2)
		@items = []
		create_items_random
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
			@items.each do |element| 
				if collision(@player.hitbox, element.hitbox)
					@items[@items.index(element)].set_ground(false)
					@player.add_item(element.get_name, element.get_number)
				end
			end	
		end

		case @player.check_spot?
			when 1  
				@player.teleport_right
				if @map.block_correct?("right")
					@map.create_column_right
				end
				@map.move_column_left
				@items.each do |element| element.move_right end
			when 2
				@player.teleport_left
				if @map.block_correct?("left")
					@map.create_column_left
				end
				@map.move_column_right
				@items.each do |element| element.move_left end
		end

		@player.update
	end

	def draw
		@map.draw
		@player.draw
		@items.each do |element|
			element.draw
		end
	end

	def button_down(id)
		close if id == Gosu::KbEscape
	end

	def create_items_random
		(0...rand(5)).each do |n|
			spot = rand(0...@itemnames.length)
			@items.push(Item.new(@itemnames[spot], rand(3), rand(0...(Constants::WWIDTH - Constants::IWIDTH)), rand(0...(Constants::WHEIGHT - Constants::IHEIGHT)), Constants::IWIDTH, Constants::IHEIGHT, true, @itemani[spot]))
		end
	end

	def collision(h1, h2)
			return h1[0] < h2[0] + h2[2] && h1[0] + h1[2] > h2[0] && h1[1] + h1[3] > h2[1] && h1[1] < h2[1] + h2[3]
	end

end

window = GameWindow.new
window.show