class Node
	attr_accessor :key, :root, :pointer_less, :pointer_greater, :parent_node, :tmp


	def initialize(key = "root", parent = "root", pointer_less = nil, pointer_greater = nil)		
		@key = key
		@parent = parent
		@pointer_less = pointer_less
		@pointer_greater = pointer_greater
		key = "root" ? (@root = self; @tmp = @root) : ""
		puts "INIT VALUE: #{@tmp.value}  ROOT: #{@root.to_s}  TMP: #{@tmp.to_s}  PARENT: #{@parent}  LESS: #{@pointer_less} GREATER: #{@pointer_greater}"
		# @root = self
		# @tmp
	end

	def value
		@key
	end

	def go_right
		@tmp = @tmp.pointer_greater
	end

	def go_left
		@tmp = @tmp.pointer_less
	end

	def root
		@tmp = @root
	end

	def parent
		@parent_node
	end

	def child_left
		@pointer_less
	end

	def child_right
		@pointer_greater
	end

	def build_tree(array)
		puts "ARRAY: #{array.to_s} LENGTH: #{array.size}"
		puts "VALUE: #{@tmp.value} TMP: #{@tmp}"
		# YOU HAVE TO FIND ROOT
		@tmp.value == "root" ? rooter(array) : ""
		until array.empty?
			root
			val = array.pop
			plant_value(val)
		end		
	end



	def plant_value(val)
	
		puts "VAL: #{val} TMP_VALUE: #{@tmp.value} TMP: #{@tmp} GREATER: #{@tmp.pointer_greater.to_s} LESS: #{@tmp.pointer_less.to_s}"


		if val < @tmp.value && @tmp.child_left == nil
			# CREATE NEW NODE
			leaf = Node.new(val, @tmp, nil, nil)
			# YOU HAVE TO SOMEHOW IMPRINT ON THE PREVIOUS PARENT SO THAT IT WILL MAP BACK
			return @tmp.pointer_less = leaf
		elsif val > @tmp.value && @tmp.child_right == nil
			# CREATE NEW NODE
			leaf = Node.new(val, @tmp, nil, nil)
			# YOU HAVE TO SOMEHOW IMPRINT ON THE PREVIOUS PARENT SO THAT IT WILL MAP BACK
			return @tmp.pointer_greater = leaf
		elsif val < @tmp.value
			# TRAVERSE DOWN LEFT
			@tmp.go_left
			# POSSIBLY RECURSIVE CALL?
			plant_value(val)
		elsif val > @tmp.value
			# TRAVERSE DOWN RIGHT
			@tmp.go_right
			# POSSIBLY RECURSIVE CALL?
			plant_value(val)
		
		else
			puts "ERROR"
		end

	end

	def rooter(array)
		puts "ROOT: #{array[array.sort!.size/2]}"
		@tmp.key = array[array.sort!.size/2]
		array
	end

	# def to_s
	# 	root
	# 	until @tmp.child_left == nil || @tmp.child_right == nil
	# 		puts "VALUE:(#{@tmp.value}) -> "
	# 	end
	# 	puts "VALUE: (#{@tmp.value})"
	# end

end


tree = Node.new
tree.build_tree([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
