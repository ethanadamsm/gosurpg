require "gosu"
require_relative "z_order"
require_relative "constants"
require_relative "tile"

class Map

	def initialize
		@textures = []
		@textures.push(Gosu::Image.new("media/grass.png"))
		@textures.push(Gosu::Image.new("media/dirt.png"))

		@rows = []
		(0..Constants::WHEIGHT / Constants::THEIGHT).each do |n|
			@rows.push(create_row(n * Constants::THEIGHT))
		end
	end

	def draw
		@rows.each do |element|
			element.each do |n|
				n.draw
			end
		end
	end

	def create_row(y)
		row_final = []
		(0..Constants::WWIDTH / Constants::TWIDTH).each do |n|
			row_final.push(Tile.new(Constants::THEIGHT, Constants::TWIDTH, n * Constants::THEIGHT, y, @textures.sample))
		end
		row_final
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

end