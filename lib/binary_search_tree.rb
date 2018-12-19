class BinarySearchTree
	attr_accessor :root, :tmp

	require './lib/node.rb'

	def initialize
		@root = nil
	end

	def crawl_up
		@tmp = @tmp.parent
	end

	def crawl_left
		@tmp = @tmp.child_left
	end

	def crawl_right
		@tmp = @tmp.child_right
	end

	def build_tree(array)
		array.sort!

		puts "ARRAY: #{array}"

		if array.size <= 1

			@tmp = Node.new(array[0], nil, nil,nil)
			return @tmp

		elsif array.size == 2
			puts "ARRAY: #{array}  SIZE: #{array.size}"
			if array[0] < array[1]
				child = Node.new(array[0], nil, nil, nil)
				@tmp = Node.new(array[1], child, nil, nil)
				child.parent = @tmp
			elsif array[0] > array[1]
				child = Node.new(array[1], nil, nil, nil)
				@tmp = Node.new(array[0], child, nil, nil)
				child.parent = @tmp
			end
				
			return @tmp
		
			
			# child_left = array[0]
			# child_right = array[2]
		end

		a = array[(array.size/2)]
		b = build_tree(array.slice!(((array.size/2)+1), array.size-1))
		c = build_tree(array)

		puts "TMP:#{@tmp.value}\nA:#{a}\nB:#{b.value}\nC:#{c.value}\n"

		@root == nil ? @root = @tmp : ""

		if b.value < c.value && c.child_left == nil
			c.child_left = b
			b.parent = c
		elsif b.value > c.value && c.child_right == nil
			c.child_right = b
			b.parent = c
		end
			
		# puts "B PARENT: #{b.parent.value} C PARENT: #{c.parent.value}"

		# if b.value < @tmp.value && @tmp.child_left == nil
		# 	@tmp.child_left = b
		# 	b.parent = @tmp
		# elsif b.value > @tmp.value && @tmp.child_right == nil
		# 	@tmp.child_right = b
		# 	b.parent = @tmp
		# elsif b.value < @tmp.value && @tmp.child_right != nil
		# 	b.child_right = @tmp
		# 	@tmp.parent = b
		# elsif b.value > @tmp.value && @tmp.child_left != nil
		# 	b.child_left = @tmp
		# 	@tmp.parent = b
		# end
		c
	end

	def write_out
		until @tmp.parent == nil 
			puts " VALUE: #{@tmp.value}"
			crawl_up
		end
	end

end

tree = BinarySearchTree.new
tree.build_tree([1,3,4,6,7,8,10,13,14])
# tree.build_tree([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])