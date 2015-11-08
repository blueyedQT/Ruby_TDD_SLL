class Node
	attr_accessor :element, :next

	def initialize(value)
		@element = value
		@next = nil
	end
end