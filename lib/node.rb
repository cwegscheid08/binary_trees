class Node
	attr_accessor :value, :child_left, :child_right, :root, :crawler_node

	def initialize(value = nil)
		@value = value
		@root = nil
		@child_left = nil
		@child_right = nil
	end

	def rooter
		@crawler_node = @root
	end

	def build_tree(array)
		return array[0] if array.size == 1

		mid = (array.length/2)
		@root.nil? ? (@root = Node.new(array[mid]); @crawler_node = @root): ""

		right = build_tree(array.slice!(mid, array.size-1))
		left = build_tree(array)

		left.class == Integer ? left = Node.new(left) : ""
		right.class == Integer ? right = Node.new(right) : ""

		# puts "CRAWLER:#{crawler_node.value} LEFT:#{left.value} RIGHT:#{right.value}"

		# print "CRAWLER:#{@crawler_node.value} "
		# print left.value.nil? ? "" : "LEFT:#{left.value} "
		# print right.value.nil? ? "" : "RIGHT:#{right.value} "

		rooter
		place_node(left)
		rooter
		place_node(right)


		

	end

	def place_node(node)

		print "NODE:#{node} "
		print "CLASS:#{node.class} "
		print node.value.nil? ? "" : "VALUE:#{node.value} "
		print node.child_left.nil? ? "" : "LEFT:#{node.child_left.value} "
		print node.child_right.nil? ? "" : "RIGHT:#{node.child_right.value} "
		puts



		if node.value < @crawler_node.value && @crawler_node.child_left.nil?
			@crawler_node.child_left = node
		elsif node.value > @crawler_node.value && @crawler_node.child_right.nil?
			@crawler_node.child_right = node
		elsif node.value < @crawler_node.value && node.value > @crawler_node.child_left.value
			node.child_left = @crawler_node.child_left
			@crawler_node.child_left = node
		elsif node.value > @crawler_node.value && node.value < @crawler_node.child_right.value
			node.child_right = @crawler_node.child_right
			@crawler_node.child_right = node
		elsif node.value < @crawler_node.value && node.value < @crawler_node.child_left.value
			@crawler_node = @crawler_node.child_left
			place_node(node)
		elsif node.value > @crawler_node.value && node.value > @crawler_node.child_right.value
			@crawler_node = @crawler_node.child_right
			place_node(node)
		else
			puts "\nERROR\n"
		end
			


		# if @crawler_node.child_left.nil? || @crawler_node.child_left.value < node.value
		# 	# WRITE CODE FOR CREATING NODE OR SHIFTING NODE
		# 	node.child_left = @crawler.child_left
		# 	@crawler.child_left = node
		# elsif @crawler_node.child_right.nil? || @crawler_node.child_right.value > node.value
		# 	node.child_right = @crawler.child_right
		# 	@craler.child_right = node
		# elsif node.value < @crawler_node.value && node.value < @crawler_node.child_left.value
		# 	# SHIFT VALUE OF CRAWLER_NODE AND RECURSE
		# 	@crawler = @crawler.child_left
		# 	place_node(node)
		# elsif node.value > @crawler_node.value && node.value > @crawler_node.child_right.value
		# 	@crawler = @crawler.child_right
		# 	place_node(node)
		# end
	end

end


node = Node.new
array = [1,7,4,23,8,9,4,3,5,7,9,67,6345,324]
array.sort!
# node.build_tree([1,7,4,23,8,9,4,3,5,7,9,67,6345,324])
puts "ARRAY: #{array.to_s}"
node.build_tree(array)
