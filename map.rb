require "gosu"
require_relative "z_order"

class Map

	def initialize
		@rass = Gosu::Image.new("media/grass.png")
		@dirt = Gosu::Image.new("media/dirt.png")
		@rows = []
		if File.open("media/map.txt", "r") == nil
			(0...480 / grass.height).each do |n|
				rows.push(create_row)
			end
		end
	end

	def draw
		@grass.draw(0, 0, 0)
		@rows.each_with_index do |row, index|
			draw_row(row, index)
		end
	end

	def create_row
		row_final = []
		(0...480 / @grass.height).each do |n|
			row_final.push(rand(1))
		end
		row_final
	end

	def draw_row(row, spot)
		x = 0
		row.each do |type|
			case type
			when 0
				@grass.draw(x, spot*@grass.width, ZOrder::TILES)
			when 1 
				@dirt.draw(x, spot*@grass.width, ZOrder::TILES)
			end
			x += @grass.width
		end
	end

end