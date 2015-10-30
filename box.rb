require "gosu"
require_relative "z_order"
require_relative "button"

class Box

	def initialize(x, y, w, h, text, closable, movable)
		@x = x
		@y = y
		@w = w
		@h = h
		@text = text
		@closable = closable
		@animation = Gosu::Image.new("media/window.png")
		@buttons = []
		@mousex = 0
		@mousey = 0
	end

	def draw 
		scalex = @w / 100.0
		scaley = @h / 100.0
		font = Gosu::Font.new(12)
		font.draw(@text, @x + (@w / 2) - (@text.length * 4), @y + 2, ZOrder::GUITEXT)
		@animation.draw(@x, @y, ZOrder::GUI, scalex, scaley)
		@buttons.each do |n|
			n.draw
		end
	end

	def add_button(x, y, w, h, text)
		@buttons.push(Button.new(x, y, w, h, text))
	end

	def button_collide?(mousex, mousey)
		@mousex = mousex
		@mousey = mousey
		@buttons.each do |button|
			if button.collision?(mousex, mousey)
				return @buttons.index(button)
			end
		end
	end

end