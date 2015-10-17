class Inventory

	def initialize 
		@items = []
	end	

	def add_item(name_, quantity) 
		@items.map{ |n|
			if n.name == name_
				@items.push(name_, quantity)
			else
				n.number += quantity 
			end
		}
	end

end