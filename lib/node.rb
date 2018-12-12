class Node < LinkedList
	attr_accessor :data, :pointer, :parent_node


	def initialize(data, pointer, parent_node)
		@data = data
		@pointer = pointer
		@parent_node = parent_node
	end

	def value
		@data
	end

	def next
		super
	end

	def previous_node
		@parent_node
	end

	def next_node
		@pointer
	end

end