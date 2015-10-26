require "gosu"
require_relative "z_order"

class Button

	def initialize(x, y, w, h, text) 
		@x = x
		@y = y
		@w = w
		@h = h
		@text = text
		@button = Gosu::Image.new("media/window.png")
		@font = Gosu::Font.new(12)
	end

	def draw
		scalex = @w / 100.0
		scaley = @h / 100.0
		@button.draw(@x, @y, ZOrder::BUTTON, scalex, scaley)
		@font.draw(@text, @x + (@w / 2) - (@text.length * 6), @y + (@h / 2), ZOrder::BUTTON, )
	end

	def collision?(mousex, mousey)
		mousex > @x && mousex < @x + @w && mousey > @y && mousey < @y + @h
	end

end