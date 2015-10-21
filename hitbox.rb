class Hitbox

	def initialize(x, y, w, h)
		@x = x
		@y = y
		@w = w
		@h = h
	end

	def update_c(x, y)
		@x = x
		@y = y
	end

	def hitbox
		[@x, @y, @w, @h]
	end

	def update_hitbox(x, y)
		@x = x
		@y = y
	end

end