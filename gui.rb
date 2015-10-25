require "gosu"
require_relative "Box"

class Gui

	def initialize(width, height, x, y, text, moveable)
		@mainbox = Box.new(x, y, width, height, text, true, moveable)
		@boxes = []
	end

	def draw
		@boxes.each do |box|
			box.draw
		end
		@mainbox.draw
	end

	def add_button()
		@mainbox.add_button
	end

end