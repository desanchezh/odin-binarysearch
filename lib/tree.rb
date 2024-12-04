require_relative 'node'

class Tree
  attr_accessor :root

  def initialize(array)
    @last = array.uniq.length - 1
    @root = build_tree(array)
    @found = []
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

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.root}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def insert(root = @root, value)
    return Node.new(value) if root.nil?
    return root if root.root == value

    if value < root.root
      root.left = insert(root.left, value)
    elsif value > root.root
      root.right = insert(root.right, value)
    end
    root
  end

  def get_successor(curr)
    curr = curr.right
    curr = curr.left while !curr.nil? && !curr.left.nil?
    curr
  end

  def delete(root = @root, value)
    return root if root.nil?

    if root.root > value
      root.left = delete(root.left, value)
    elsif root.root < value
      root.right = delete(root.right, value)
    else
      return root.right if root.left.nil?
      return root.left if root.right.nil?

      succ = get_successor(root)
      root.root = succ.root
      root.right = delete(root.right, succ.root)
    end
    root
  end

  def find(value, root = @root)
    return if root.nil?

    @found << root if root.root == value
    find(value, root.left)
    find(value, root.right)
    @found
  end
end

array = (Array.new(15) { rand(1..100) })
arr = [10, 60, 20, 1, 3, 5, 1]
tree = Tree.new(arr)
tree.pretty_print
p tree.find(60)
tree.pretty_print
p
