require_relative 'lib/tree'

array = (Array.new(15) { rand(1..100) })
tree = Tree.new(array)
# Confirm that the tree is balanced by calling #balanced?
puts "Is tree balanced?: #{tree.balanced?}"
tree.pretty_print
# Print out all elements in level, pre, post, and in order
p tree.level_order
p tree.preorder
p tree.postorder
p tree.inorder

# Unbalance the tree by adding several numbers > 100
tree.insert(1900)
tree.insert(440)
tree.insert(280)
tree.insert(559)

# Confirm that the tree is unbalanced by calling #balanced?
puts "Is tree balanced?: #{tree.balanced?}"
tree.pretty_print
# Balance the tree by calling #rebalance
tree.rebalance
# Confirm that the tree is balanced by calling #balanced?
puts "Is tree balanced?: #{tree.balanced?}"
tree.pretty_print

# Print out all elements in level, pre, post, and in order.
p tree.level_order
p tree.preorder
p tree.postorder
p tree.inorder
