class Node
	attr_accessor :value, :parent, :child_left, :child_right, :root, :tmp

	def initialize(value = nil)
		@value = value
		# @root = nil
		@parent = nil
		@child_left = nil
		@child_right = nil
	end

	def rooter
		# @tmp = @root
		@tmp == @root ? "" : (@tmp = @tmp.parent; rooter)
	end

	def left
		@tmp = @tmp.child_left
	end

	def right
		@tmp = @tmp.child_right
	end

	def up
		@tmp = @tmp.parent
	end

	def build_tree(array)
		if array.size == 2
			left = Node.new(array[0])
			right = Node.new(array[1])
			right.child_left = left
			left.parent = right
			puts "LEFT:#{left.value} RIGHT:#{right.value}"
			return right
		end
		return left = Node.new(array[0]) if array.size == 1
		return array[0] if array.size == 1

		mid = (array.length/2)
		@root.nil? ? (@root = Node.new(array[mid]); @tmp = @root): ""

		# right = build_tree(array.slice!(mid, array.size-1))
		# left = build_tree(array)

		left = build_tree(array.slice!(0, mid))
		right = build_tree(array)

		# right = array.slice!(0, mid)
		# left = array

		# left.class == Integer ? left = Node.new(left) : ""
		# right.class == Integer ? right = Node.new(right) : ""

		print "ROOT:#{root.value} "
		print "LEFT:#{left.value} C_LEFT:#{left.child_left.nil?} C_RIGHT:#{left.child_right.nil?}\n" 
		print "RIGHT:#{right.value} C_LEFT:#{right.child_left.nil?} C_RIGHT:#{right.child_right.nil?}\n\n"
		# print "RIGHT:#{right}"

		if @root.value == right.value
			print "ROOT EQUAL TO RIGHT"
			@root.child_left = left
			@root.child_right = right.child_right 
			left.parent = @root
			right.child_right.parent = @root
			return @root
		elsif !left.child_right.nil?
			print "NOT NIL "
			# left = left.child_right
			@tmp = left
			until @tmp.child_right.nil?
				@tmp = @tmp.child_right
			end
			@tmp.child_right = right
			# @tmp = @tmp.parent until @tmp.parent.nil?
			until @tmp.parent.nil?
				@tmp = @tmp.parent
			end
			right.parent = left
			@root = @tmp
		elsif left.child_right.nil?
			print "CHILD RIGHT IS NIL"
			left.child_right = right
			right.parent = left
			# @root = right
		end

	

		left
		# rooter
		# place_node(left)


		

		# rooter
		# @root = @tmp
		# place_node(right)

		# rooter
		# @root = @tmp
		
		

	end

	def place_node(node)

		print "NODE:#{node} "
		print "CLASS:#{node.class} "
		print node.value.nil? ? "" : "VALUE:#{node.value} "
		print node.child_left.nil? ? "" : "LEFT:#{node.child_left.value} "
		print node.child_right.nil? ? "" : "RIGHT:#{node.child_right.value} "
		print "CRAWLER:#{@tmp.value}"
		puts



		if node.value < @tmp.value && @tmp.child_left.nil?
			@tmp.child_left = node
			# node.parent = @tmp
			print "CRAWLER CHILD_LEFT = #{@tmp.child_left.value} PARENT:#{node.parent.value}\n"
		elsif node.value > @tmp.value && @tmp.child_right.nil?
			@tmp.child_right = node
			# node.parent = @tmp
			print "CRAWLER CHILD_RIGHT = #{@tmp.child_right.value} PARENT:#{node.parent.value}\n"
		elsif node.value < @tmp.value && node.value > @tmp.child_left.value
			# node.child_left = @tmp.child_left
			@tmp.child_left = node
			# node.parent = @tmp
			print "INSERT NODE INTO CRAWLER CHILD_LEFT #{node.child_left.value} PARENT:#{node.parent.value}\n"
		elsif node.value > @tmp.value && node.value < @tmp.child_right.value
			# node.child_right = @tmp.child_right
			@tmp.child_right = node
			# node.parent = @tmp
			print "INSERT NODE INTO CRAWLER CHILD_RIGHT #{node.child_right.value} PARENT:#{node.parent.value}\n"
		elsif node.value < @tmp.value && node.value < @tmp.child_left.value
			@tmp = @tmp.child_left
			place_node(node)
			print "RECURSE LESS THAN SHIFT FROM #{@tmp.parent.value} TO #{@tmp.value} \n"
		elsif node.value > @tmp.value && node.value > @tmp.child_right.value
			@tmp = @tmp.child_right
			place_node(node)
			print "RECURSE GREATER THAN SHIFT FROM #{@tmp.parent.value} TO #{@tmp.value} \n"
		elsif node.value == @tmp.value
			puts "DOUBLE LOG"
		else
			puts "\nERROR\n"
		end
			
	end

	def display_tree
		# rooter
		until @tmp.child_right.nil? 
			print "NODE: #{@tmp.value} "
			print "CHILD_LEFT: #{@tmp.child_left.nil? ? "" : @tmp.child_left.value} "
			print "CHILD_RIGHT #{@tmp.child_right.nil? ? "" : @tmp.child_right.value}\n"
			right
			display_tree
		end 
	end

end


node = Node.new

# array = [1,7,4,23,8,9,4,3,5,7,9,67,6345,324]
# array.sort!

array = [1,3,4,5,7,8,9,23,67,324,6345]

# node.build_tree([1,7,4,23,8,9,4,3,5,7,9,67,6345,324])
puts "ARRAY: #{array.to_s}"
node.build_tree(array)
