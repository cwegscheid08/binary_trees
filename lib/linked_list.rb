class LinkedList
	attr_accessor :data, :head, :current_node

	require './lib/node.rb'

	def initialize
		@head = Node.new("HEAD", nil)
		@current_node = @head
	end

	def next
		@current_node = @current_node.next_node
	end

	def head
		@current_node = @head
	end

	def tail
		until @current_node.pointer == nil
			self.next
		end
	end

	def at(x)
		i = 0
		head
		until i == x
			i += 1
			self.next
		end
		@current_node
	end

	def append(append_data)
		if @current_node.pointer == nil
			append_data = Node.new(append_data, nil)
			@current_node.pointer = append_data
		elsif @current_node.pointer != nil
			self.next
			append(append_data)
		end
	end

	def prepend(prepend_data)
		@current_node = @head
		prepend_data = Node.new(prepend_data, @current_node.next_node)
		@current_node.pointer = prepend_data
	end

	def size
		head
		i = 0
		until @current_node.pointer == nil
			i += 1
			self.next
		end
		i
	end

	def pop
		tail
		val = @current_node
		head
		until @current_node.pointer == val
			self.next
		end
		@current_node.pointer = nil
		val
	end

	def contains?(value)
		head
		until @current_node.pointer == nil
			if @current_node.value == value  
				return true
			end
			self.next
		end
		false
	end

	def find(data)
		head
		i = 0
		until @current_node.pointer == nil
			if @current_node.value == data
				return i
			end
			i += 1
			self.next
		end
		nil
	end

	def to_s
		head
		until @current_node.pointer == nil
			print "#{@current_node.value} -> "
			self.next
		end
		print "#{@current_node.value}"
	end

	def insert_at(data, index)
		at(index)
		data = Node.new(data, @current_node.pointer)
		@current_node.pointer = data
	end

	def remove_at(index)
		at(index)
		val = @current_node
		at(index-1)
		@current_node.pointer = val.next_node
	end
end