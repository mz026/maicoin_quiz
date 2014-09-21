require 'lib/binary_tree_node'

describe BinaryTreeNode do
  let(:value) { 5 }
  let(:node) { BinaryTreeNode.new value }
  describe '::new(value)' do
    it "takes a value to init" do
      value = 5
      node = BinaryTreeNode.new value
    end
  end

  describe '#left=(left_node)' do
    it "assigns value to left" do
      left = BinaryTreeNode.new (value - 1)
      node.left = left

      expect(node.left).to eq(left)
    end

    it "raises if left_node.value > self.value " do
      left = BinaryTreeNode.new (value + 1)
      expect {
        node.left = left
      }.to raise_error(BinaryTreeNode::InvalidNodeException)
    end

    it "raises if left_node.value = self.value " do
      left = BinaryTreeNode.new value
      expect {
        node.left = left
      }.to raise_error(BinaryTreeNode::InvalidNodeException)
    end
  end

  describe '#right=(right_node)' do
    it "assigns value to right" do
      right = BinaryTreeNode.new (value + 1)
      node.right = right

      expect(node.right).to eq(right)
    end

    it "raises if right_node.value < self.value " do
      right = BinaryTreeNode.new (value - 1)
      expect {
        node.right = right
      }.to raise_error(BinaryTreeNode::InvalidNodeException)
    end
    
    it "raises if right_node.value = self.value " do
      right = BinaryTreeNode.new value
      expect {
        node.right = right
      }.to raise_error(BinaryTreeNode::InvalidNodeException)
    end
  end

  describe '#height' do
    def node_of_val val
      @node_val_map ||= {}

      @node_val_map[val] ||= BinaryTreeNode.new val
    end

    it "calculates height of its tree" do
      root_of_height_3 = BinaryTreeNode.new 10

      root_of_height_3.left = node_of_val(8)
      root_of_height_3.right = node_of_val(12)
      node_of_val(8).left = node_of_val(6)

      expect(root_of_height_3.height).to eq(3)
    end
  end


end
