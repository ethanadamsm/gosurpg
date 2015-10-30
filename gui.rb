require "gosu"
require_relative "Box"

class Gui

	def initialize(width, height, x, y, text, moveable, visible)
		@mainbox = Box.new(x, y, width, height, text, true, moveable)
		@boxes = []
		@mousex = 0
		@mousey = 0
		@visible = visible
	end

	def draw
		if @visible
			@boxes.each do |box|
				box.draw
			end
			@mainbox.draw
		end
	end

	def set_visibility(visible)
		@visible = visible
	end

	def add_button(x, y, w, h, text)
		@mainbox.add_button(x, y, w, h, text)
	end

	def button_collide?(mousex, mousey)
		if @visible
			@mousex = mousex
			@mousey = mousey 
			return @mainbox.button_collide?(mousex, mousey)
		end
	end

end