require "gosu"

class GameWindow < Gosu::Window

	def initialize
		super 640, 480
	end

	def update
		
	end

	def draw
		
	end

	def button_down(id)
		close if id == Gosu::KbEscape
	end

end

window = GameWindow.new
window.show