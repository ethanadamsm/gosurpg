require "gosu"
require_relative "z_order"
require_relative "constants"
require_relative "tile"
require_relative "on_ground"

class Map

	def initialize
		@textures = []
		@textures.push(Gosu::Image.new("media/grass.png"))
		@textures.push(Gosu::Image.new("media/dirt.png"))

		@rows = []
		(0..Constants::WHEIGHT / Constants::THEIGHT).each do |n|
			@rows.push(create_row(n * Constants::THEIGHT))
		end

		filenames = open("media/names.txt")
		filenames = filenames.read
		@itemnames = filenames.split(",")
		fileani = open("media/ani.txt")
		fileani = fileani.read
		fileani = fileani.split(", ")
		@itemanimation = []
		fileani.each do |element|
			@itemanimation.push(Gosu::Image.new("media/" + element))
		end
		@items = []
		create_items_random
	end

	def draw
		@rows.each do |element|
			element.each do |n|
				n.draw
			end
		end

		@items.each do |element|
			element.draw
		end
	end

	def create_row(y)
		row_final = []
		(0..Constants::WWIDTH / Constants::TWIDTH).each do |n|
			row_final.push(Tile.new(Constants::THEIGHT, Constants::TWIDTH, n * Constants::THEIGHT, y, @textures.sample))
		end
		row_final
	end

	def block_correct?(location)
		case location
			when "right"
				return @rows[0][@rows[0].length - 1].get_x == Constants::WWIDTH - Constants::TWIDTH
			when "left"
				return @rows[0][0].get_x == 0
		end
	end

	def create_column_right
		@rows.each do |element|
			element.push(Tile.new(Constants::THEIGHT, Constants::TWIDTH, element[element.length - 1].get_x + Constants::TWIDTH, element[0].get_y, @textures.sample))
		end
	end

	def create_column_left
		@rows.map! { |element|
			[(Tile.new(Constants::THEIGHT, Constants::TWIDTH, element[0].get_x - Constants::TWIDTH, element[0].get_y, @textures.sample))] + element
		}
	end

	def move_column_left
		@rows.each do |element|
			element.each do |n|
				n.set_x(n.get_x - Constants::TWIDTH)
			end
		end
	end

	def move_column_right
		@rows.each do |element|
			element.each do |n|
				n.set_x(n.get_x + Constants::TWIDTH)
			end
		end
	end

	def create_items_random
		(0...5).each do |n|
			spot = rand(0...@itemnames.length)
			@items.push(OnGround.new(@itemnames[spot], rand(1..3), rand(0...(Constants::WWIDTH - Constants::IWIDTH)), rand(0...(Constants::WHEIGHT - Constants::IHEIGHT)), @itemanimation[spot]))
		end
	end

	def move_items_left
		@items.each do |element| element.move_left end
	end

	def move_items_right
		@items.each do |element| element.move_right end
	end

	def get_items
		@items
	end

	def delete_item(index)
		@items.delete_at(index)
	end

end