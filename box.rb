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
	end

	def draw 
		scalex = @w / 100
		scaley = @h / 100
		font = Gosu::Font.new(12)
		font.draw(@text, @x + (@w / 2) - (@text.length * 4), @y + 2, ZOrder::GUITEXT)
		@animation.draw(@x, @y, ZOrder::GUI, scalex, scaley)
	end

	def add_button(x, y, w, h, text)
		@buttons.push(Button.new(x, y, w, h, text))
	end

end