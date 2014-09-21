# LinkedListToBSTConverter
# convert sorted accending linked list to height-balanced BST
require 'lib/binary_tree_node'

class LinkedListToBSTConverter
  def initialize node, size_to_convert = nil
    @node = node
    @list_size = size_to_convert
  end

  def solve
    if list_size.to_i == 1
      return BinaryTreeNode.new(@node.value), @node
    end

    middle = ((list_size + 1).to_f / 2).ceil

    left_tree, left_last_node = LinkedListToBSTConverter.new(@node, middle - 1).solve

    middle_node = left_last_node.next
    tree = BinaryTreeNode.new middle_node.value
    tree.left = left_tree

    if list_size - middle > 0
      right_tree, right_last_node = LinkedListToBSTConverter.new(middle_node.next, list_size - middle).solve
      tree.right = right_tree
      [tree, right_last_node]
    else
      [ tree, middle_node ]
    end
  end

  def list_size
    return @list_size if @list_size
    list_size = 0
    node = @node
    loop do
      break unless node
      list_size += 1
      node = node.next
    end

    @list_size = list_size
  end
  private :list_size
end
