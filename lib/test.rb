require './lib/node.rb'

def test_sorted
	node = Node.new
	array = []
	30.times {|x| array.push(rand(50))}
	array.sort!
	print "ARRAY:#{array}\n"
	node.build_tree(array)
	node.rooter
	node.display_tree
	return node
end

def test_unsorted
	node = Node.new
	array = []
	100.times {|x| array.push(rand(1000))}
	# print "ARRAY:#{array} SIZE:#{array.size}\n"
	node.build_tree_unsorted(array)
	node.rooter
	node.display_tree
	# print "ARRAY:#{array} SIZE:#{array.size}\n"
	return node
end