class BinaryTreeNode
  class InvalidNodeException < Exception; end
  attr_reader :left, :right, :value

  class NullNode
    def height
      0
    end
  end

  @@null_node = NullNode.new

  def initialize value
    @value = value
    @left = @right = @@null_node
  end

  def height
    [left.height, right.height].max + 1
  end

  def left= node
    unless node.value < value
      raise InvalidNodeException, "attempt to assign node of value #{node.value} to be the left node of value #{value}"
    end
    @left = node
  end

  def right= node
    unless node.value > value
      raise InvalidNodeException, "attempt to assign node of value #{node.value} to be the right node of value #{value}"
    end
    
    @right = node
  end

end
