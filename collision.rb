class Collision

	def initialize(object1, object2)
		@object1 = object1
		@object2 = object2
	end

	def has_collided
		hitbox1 = @object1.hitbox
		hitbox2 = @object2.hitbox
		puts hitbox1
		puts hitbox2
		hitbox1[0] < hitbox2[0] + hitbox2[2] && hitbox1[0] + hitbox1[2] > hitbox2[0] && hitbox1[1] + hitbox1[3] > hitbox2[1] && hitbox1[1] < hitbox2[1] + hitbox2[3]
	end

end