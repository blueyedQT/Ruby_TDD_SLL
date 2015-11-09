require_relative 'sll'

RSpec.describe SinglyLinkedList do
	before do
		@sll = SinglyLinkedList.new
	end

	describe "initialization" do
		it "has an attribute head that is an instance of Node with element head" do
			expect(@sll.head.class).to eq(Node)
			expect(@sll.head.element).to eq("head")
		end
	end

	describe "behavior" do
		before do
			@sll.insert(1, "head")
			@sll.insert(3, 1)
			@sll.insert(2, 1)
		end

		describe "insertion" do
			it "inserts new Node to list" do
				nodes = @sll.display_nodes
				expect(nodes[0].element).to eq(1)
				expect(nodes[1].element).to eq(2)
				expect(nodes[2].element).to eq(3)
				expect(nodes.count).to eq(3)
				expect(@sll.display_elements).to eq([1, 2, 3])
			end
		end

		describe "find" do
			it "finds and returns Node if found" do
				output = @sll.find(2)
				expect(output.class).to eq(Node)
				expect(output.element).to eq(2)
			end
			it "returns nil if not found" do
				output = @sll.find(99)
				expect(output).to eq(nil)
			end
		end

		describe "remove" do
			it "removes and returns Node" do
				node = @sll.remove(2)
				expect(node.element).to eq(2)
				expect(@sll.display_elements).to eq([1, 3])
			end
			it "returns nil if not found" do
				node = @sll.remove(99)
				expect(node).to eq(nil)
			end
		end

		describe "find previous" do
			it "returns previous node" do
				node = @sll.find_previous(3)
				expect(node.element).to eq(2)
			end
			it "returns nil if not found" do
				node = @sll.find_previous(99)
				expect(node).to eq(nil)
			end
		end
	end
end