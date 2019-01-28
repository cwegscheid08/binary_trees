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

		left = build_tree(array.slice!(0, mid))
		right = build_tree(array.slice(1, array.size-1))
		
		
		# left = build_tree(left)
		# right = build_tree(right)
		

		if !left.value.nil?
			if left.value != base.value && left.value < base.value
				left.parent = base
				base.child_left = left
			elsif left.value != base.value && left.value > base.value
				left.parent = base
				base.child_right = left
			end
		end


		if !right.value.nil?
			if right.value != base.value && right.value > base.value
				right.parent = base
				base.child_right = right
			elsif left.value != base.value && right.value < base.value
				right.parent = base
				base.child_left = right
			end
		end

		@root = base
		return base
		

	end

	def build_tree_unsorted(array)
		@root = Node.new(array.shift)
		print "ROOT:#{@root.value}\n\n"
		until array.size == 0
			rooter
			place_node(Node.new(array.shift))
		end
	end

	def place_node(node)
		print "NODE:#{node.value} \n"
		if node.value == @tmp.value
			return node
		elsif node.value < @tmp.value && @tmp.child_left.nil?
			@tmp.child_left = node
			node.parent = @tmp
			loop do 
				break if @tmp.parent.nil?
				up
			end
			@root.child_left = @tmp.child_left
		elsif node.value > @tmp.value && @tmp.child_right.nil?
			@tmp.child_right = node
			node.parent = @tmp
			loop do
				break if @tmp.parent.nil?
				up
			end
			@root.child_right = @tmp.child_right
			
		elsif node.value < @tmp.value && !@tmp.child_left.nil?
			left
			place_node(node)
		elsif node.value > @tmp.value && !@tmp.child_right.nil?
			right
			place_node(node)
		else
			print "\n\nERROR\n\n"
		end
			
	end

	def breath_first_search(search_value, node = @root, queue = [])

		if !node.nil?
			queue.push(node.child_left)
			queue.push(node.child_right)
		end

		if node.nil? && queue.size >= 1
			breath_first_search(search_value, queue.shift, queue)
		elsif node.nil? && queue.size == 0
			puts "NODE #{search_value} NOT FOUND"
			return nil
		elsif search_value == node.value
			puts "NODE #{node.value} FOUND"
			return node
		elsif queue.nil?
			puts "NODE #{search_value} NOT FOUND"
			return nil
		else
			breath_first_search(search_value, queue.shift, queue)
		end

	end

	def depth_first_search(search_value, node = @root, stack = [])

		if !node.nil?
			stack.unshift(node.child_right)
			stack.unshift(node.child_left)
		end

		if node.nil? && stack.size >= 1
			depth_first_search(search_value, stack.shift, stack)
		elsif node.nil? && stack.size == 0
			puts "NODE #{search_value} NOT FOUND"
			return nil
		elsif search_value == node.value
			puts "NODE #{node.value} FOUND"
			return node
		elsif stack.nil?
			puts "NODE #{search_value} NOT FOUND"
			return nil
		else
			depth_first_search(search_value, stack.shift, stack)
		end

	end

	def dfs_rec(search_value, node = @root)
		return node if !node.nil?

		# if !@node.nil?
			node = dfs_rec(search_value, node.child_left)
			node = dfs_rec(search_value, node.child_right)
		# end

		if node.value == search_value
			puts "NODE #{node.value} FOUND"	
			return node
		else
			puts "NODE NOT FOUND"
		end

		# return node

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

