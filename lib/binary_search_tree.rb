class BinarySearchTree
	attr_accessor :root, :tmp

	require './lib/node.rb'

	def initialize
		
	end

	

end

tree = BinarySearchTree.new
tree.build_tree([1,3,4,6,7,8,10,13,14])
# tree.build_tree([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])