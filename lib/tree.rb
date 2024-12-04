require_relative "node"

class Tree
  def initialize(array)
    @last = array.uniq.length - 1
    @root = build_tree(array)
  end

  def build_tree(array, first = 0, last = @last)
    arr = array.sort.uniq

    return nil if first > last

    mid = (first + last) / 2
    root = Node.new(arr[mid])
    root.left = build_tree(arr, first, mid - 1)
    root.right = build_tree(arr, mid + 1, last)
    root
  end

  def pretty_print(node = @root, prefix = "", is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.root}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end

array = (Array.new(15) { rand(1..100) })
tree = Tree.new(array)
tree.pretty_print
