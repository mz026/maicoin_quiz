class BinaryTreeNode
  attr_accessor :left, :right
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

end
