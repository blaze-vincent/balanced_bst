require_relative('node')

class Tree
  attr_reader :root

  def initialize(nodes_array)
    array = nodes_array.sort.uniq
    @root = build_tree(array, 0, array.length-1)
  end

  def build_tree(nodes_array, left, right)
    return nil if left > right

    middle_index = left + (right - left) / 2
    branch = Node.new(nodes_array[middle_index])
    branch.left_node = build_tree(nodes_array, left, middle_index - 1)
    branch.right_node = build_tree(nodes_array, middle_index + 1, right)
    branch
  end
end