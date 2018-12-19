class Node < BinarySearchTree
	attr_accessor :key, :child_left, :child_right, :parent


	def initialize(value, child_left, child_right, parent)
		@key = value
		@child_left = child_left
		@child_right = child_right
		@parent = parent
	end

	def children
		puts "LEFT: #{child_left.value}  RIGHT: #{child_right.value}"
	end

	def value
		@key
	end

	def setter
		
	end

	def getter

	end



end



