class Node
	attr_accessor :value, :parent, :child_left, :child_right, :root, :tmp

	def initialize(value = nil, parent = nil, child_left = nil, child_right = nil)
		@value = value
		# @root = nil
		# @parent = nil
		# @child_left = nil
		# @child_right = nil
	end

	def rooter
		@tmp = @root
		display_branch
	end

	def left
		@tmp = @tmp.child_left
		display_branch
	end

	def right
		@tmp = @tmp.child_right
		display_branch
	end

	def up
		@tmp = @tmp.parent
		display_branch
	end

	def build_tree(array)
		return !array.nil? ? Node.new(array[0]) : "" if array.size <= 1

		mid = (array.length/2)
		base = Node.new(array[mid])

		left = array.slice!(0, mid)
		right = array.slice(1, array.size-1)
		
		
		left = build_tree(left)
		right = build_tree(right)
		

		if left.value != base.value
			left.parent = base
			base.child_left = left
		end

		if right.value != base.value
			right.parent = base
			base.child_right = right
		end

		@root = base
		return base
		

	end



	def display_branch
		print "LEFT:#{@tmp.child_left.nil? ? "" : @tmp.child_left.value} "
		print "NODE:#{@tmp.value} "
		print "RIGHT:#{@tmp.child_right.nil? ? "" : @tmp.child_right.value}\n"
	end

	def display_tree(node = nil)
		puts
		node.nil? ? node = @tmp : ""
		print node.child_left.nil? ? "             " : "CHILD_LEFT:#{node.child_left.value} "
		print "NODE: #{node.value} "
		print node.child_right.nil? ? "" : "CHILD_RIGHT:#{node.child_right.value} "
		puts
		node.child_left.nil? ? "" : display_tree(node.child_left)
		node.child_right.nil? ? "" : display_tree(node.child_right)	
	end
end


node = Node.new

array = [1,7,4,23,8,9,4,3,5,7,9,67,6345,324]
array.sort!
node.build_tree(array)
# node.display_tree

array = []
30.times { |x| array.push(rand(30))}
array.sort!
node.build_tree(array)
node.rooter
node.display_tree
