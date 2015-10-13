require "gosu"
require_relative "map.rb"

class GameWindow < Gosu::Window

	def initialize
		super 640, 480
		@map = Map.new
	end

	def update
		
	end

	def draw
		@map.draw
	end

	def button_down(id)
		close if id == Gosu::KbEscape
	end

end

window = GameWindow.new
window.show