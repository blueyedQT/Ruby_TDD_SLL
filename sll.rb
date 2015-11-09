require_relative 'node'

class SinglyLinkedList
	attr_accessor :head

	@@count = 0

	def initialize
		@head = Node.new("head")
	end

	def insert(value, position)
		if position == "head"
			@head.element = value
		elsif @@count >= position
			little_counter = 0
			runner = @head
			while little_counter != position-1 do 
				runner = runner.next
			end
			temp = runner.next
			node = Node.new(value)
			runner.next = node
			node.next = temp			
		end
		@@count += 1
	end

	def find value
		runner = @head
		while runner != nil 
			if runner.element == value
				return runner
			end
			runner = runner.next
		end
	end

	def remove value
		removed_node = nil
		if @head.element == value
			temp = @head.next
			removed_node = @head
			removed_node.next = nil
			@head = temp
			@@count -= 1
		else 
			runner = @head
			while runner.next != nil do 
				if runner.next.element == value
					removed_node = runner.next

					temp = runner.next.next
					runner.next = temp
					@@count -= 1
					return removed_node
				end
				runner = runner.next
			end
		end
	end

	def find_previous value
		runner = @head
		while runner.next != nil
			if runner.next.element == value
				return runner
			end
			runner = runner.next
		end
	end

	def display_nodes
		elements = []
		runner = @head
		while runner.next != nil
			elements << runner
			runner = runner.next
		end
		elements << runner
	end

	def display_elements
		elements = []
		runner = @head
		while runner.next != nil
			elements << runner.element
			runner = runner.next
		end
		elements << runner.element
	end
end