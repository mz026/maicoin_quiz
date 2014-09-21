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

    left_tree, left_last_node = LinkedListToBSTConverter.new(@node, left_length).solve

    middle_node = left_last_node.next
    tree = BinaryTreeNode.new middle_node.value
    tree.left = left_tree

    if has_right_half?
      right_tree, right_last_node = LinkedListToBSTConverter.new(middle_node.next, right_length).solve
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

  def middle_index
    @middle_index ||= ((list_size + 1).to_f / 2).ceil
  end
  private :middle_index

  def left_length
    middle_index - 1
  end
  private :left_length

  def has_right_half?
    list_size - middle_index > 0
  end
  private :has_right_half?

  def right_length
    list_size - middle_index
  end
  private :right_length
end
